local helpers = dofile("tests/helpers.lua")

-- See https://github.com/echasnovski/mini.nvim/blob/main/lua/mini/test.lua for more documentation

local child = helpers.new_child_neovim()
local eq_global, eq_config, eq_state =
  helpers.expect.global_equality, helpers.expect.config_equality, helpers.expect.state_equality
local eq_type_global, eq_type_config, eq_type_state =
  helpers.expect.global_type_equality,
  helpers.expect.config_type_equality,
  helpers.expect.state_type_equality

local T = MiniTest.new_set({
  hooks = {
    -- This will be executed before every (even nested) case
    pre_case = function()
      -- Restart child process with custom 'init.lua' script
      child.restart({ "-u", "scripts/minimal_init.lua" })
      child.lua([[Keymaps = require("keyseer.keymaps")]])
      child.lua([[Keypress = require("keyseer.keymaps.keypress")]])
    end,
    -- This will be executed one after all tests from this set are finished
    post_once = child.stop,
  },
})

T["keymaps"] = MiniTest.new_set()
-- Tests related to the new method
T["keymaps"]["exposes public methods"] = function()
  eq_type_global(child, "Keymaps", "table")

  -- public methods
  eq_type_global(child, "Keymaps.new", "function")
end

T["keymaps"]["parses empty keymaps"] = function()
  child.lua([[ret = Keymaps:new()]])
  child.lua([[ret:add_keymaps({})]])
  eq_global(child, "ret.root", { keymaps = {}, modifiers = {}, children = {} })
end

T["keymaps"]["parses simple keymap"] = function()
  child.lua([[ret = Keymaps:new()]])
  child.lua([[ret:add_keymaps({{lhs='g', rhs='g_action'}})]])
  eq_global(child, "ret.root", {
    keymaps = {},
    modifiers = {},
    children = {
      g = {
        keymaps = {
          { lhs = "g", rhs = "g_action" },
        },
        modifiers = {},
        children = {},
      },
    },
  })
end

T["keymaps"]["parses shifted keymap"] = function()
  child.lua([[ret = Keymaps:new()]])
  child.lua([[ret:add_keymaps({{lhs='G', rhs='g_action'}})]])
  eq_global(child, "ret.root", {
    keymaps = {},
    modifiers = {},
    children = {
      G = {
        keymaps = {
          { lhs = "G", rhs = "g_action" },
        },
        modifiers = {
          ["<Shift>"] = true,
        },
        children = {},
      },
    },
  })
end

T["keymaps"]["parses nested keymap"] = function()
  child.lua([[ret = Keymaps:new()]])
  child.lua("ret:add_keymaps({{lhs='gg', rhs='gg_action'}})")
  eq_global(child, "ret.root", {
    keymaps = {},
    modifiers = {},
    children = {
      g = {
        keymaps = {},
        modifiers = {},
        children = {
          g = {
            keymaps = {
              { lhs = "gg", rhs = "gg_action" },
            },
            modifiers = {},
            children = {},
          },
        },
      },
    },
  })
end

T["keymaps"]["parses multiple keymaps"] = function()
  child.lua([[ret = Keymaps:new()]])
  child.lua([[ret:add_keymaps({{lhs='b', rhs='b_action'}, {lhs='g', rhs='g_action'}})]])
  eq_global(child, "ret.root", {
    keymaps = {},
    modifiers = {},
    children = {
      b = {
        keymaps = {
          { lhs = "b", rhs = "b_action" },
        },
        modifiers = {},
        children = {},
      },
      g = {
        keymaps = {
          { lhs = "g", rhs = "g_action" },
        },
        modifiers = {},
        children = {},
      },
    },
  })
end

T["keymaps"]["parses modified keymap"] = function()
  child.lua([[ret = Keymaps:new()]])
  child.lua("ret:add_keymaps({{lhs='<C-g>', rhs='g_action'}})")
  eq_global(child, "ret.root", {
    keymaps = {},
    modifiers = {},
    children = {
      ["<C-g>"] = {
        keymaps = {
          { lhs = "<C-g>", rhs = "g_action" },
        },
        modifiers = {
          ["<Ctrl>"] = true,
        },
        children = {},
      },
    },
  })
end

T["keymaps"]["gets current keycaps"] = function()
  child.lua([[ret = Keymaps:new()]])
  child.lua("ret:add_keymaps({{lhs='g', rhs='g_action'}})")
  eq_global(child, "ret:get_current_keycaps()", {
    g = "KeySeerKeycapKeymap",
  })
  child.lua("ret:add_keymaps({{lhs='<C-g>', rhs='g_action'}})")
  eq_global(child, "ret:get_current_keycaps()", {
    g = "KeySeerKeycapKeymap",
    ["<C-g>"] = "KeySeerKeycapKeymap",
  })
end

T["keypress"] = MiniTest.new_set()
T["keypress"]["parses unmodified lowercase"] = function()
  eq_global(child, "Keypress.get_modifiers('g')", {})
end
T["keypress"]["parses unmodified uppercase"] = function()
  eq_global(child, "Keypress.get_modifiers('G')", { ["<Shift>"] = true })
end
T["keypress"]["parses modified lowercase"] = function()
  eq_global(child, "Keypress.get_modifiers('<C-g>')", { ["<Ctrl>"] = true })
end

return T
