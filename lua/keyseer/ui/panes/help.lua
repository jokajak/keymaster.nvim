local UIConfig = require("keyseer.ui.config")

-- Render help
local M = {}

-- TODO: Populate colors on help
function M.render(ui)
  local display = ui.render
  display:append("Help", "KeySeerH2"):nl():nl()

  display:append("Colors depict the status of a keycap."):nl()

  display
    :append("Button", "KeySeerKeycapKeymap", { indent = 2 })
    :append(" has a single keymap assigned.")
    :nl()
  display
    :append("Button", "KeySeerKeycapMultipleKeymaps", { indent = 2 })
    :append(" has a multiple keymaps assigned.")
    :nl()

  display
    :append("Button", "KeySeerKeycapKeymapsAndPrefix", { indent = 2 })
    :append(" has multiple keymaps assigned and is a prefix to more keymaps.")
    :nl()

  display
    :append("Button", "KeySeerKeycapKeymapAndPrefix", { indent = 2 })
    :append(" has a keymap assigned and is a prefix to keymaps.")
    :nl()

  display
    :append("Button", "KeySeerKeycapPrefix", { indent = 2 })
    :append(" is a prefix to keymaps.")
    :nl()

  display
    :append("You can press ")
    :append(UIConfig.keys.details, "KeySeerSpecial")
    :append(" on a key to show its details.")
    :nl()
    :nl()

  display
    :append("You can press ")
    :append(UIConfig.keys.close, "KeySeerSpecial")
    :append(" to close this window.")
    :nl()
    :nl()

  display:append("Keyboard Shortcuts", "KeySeerH2"):nl()
  for _, pane in ipairs(UIConfig.get_panes()) do
    if pane.key then
      local title = pane.name:sub(1, 1):upper() .. pane.name:sub(2)
      display:append("- ", "KeySeerSpecial", { indent = 2 })
      display:append(title, "Title")
      if pane.key then
        display:append(" <" .. pane.key .. ">", "KeySeerProp")
      end
      display:append(" " .. (pane.desc or "")):nl()
    end
  end

  display:nl()
  display:append("Key has an action assigned"):nl()
  display:append("Key is a prefix"):nl()
end

return M
