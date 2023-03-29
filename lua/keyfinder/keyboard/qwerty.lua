local Keyboard = require("keyfinder.keyboard")

---@type PhysicalLayout
local layout = {
  [1] = {
    [1] = { normal = "`", shifted = "~" },
    [2] = { normal = "1", shifted = "!" },
    [3] = { normal = "2", shifted = "@" },
    [4] = { normal = "3", shifted = "#" },
    [5] = { normal = "4", shifted = "$" },
    [6] = { normal = "5", shifted = "%" },
    [7] = { normal = "6", shifted = "^" },
    [8] = { normal = "7", shifted = "&" },
    [9] = { normal = "8", shifted = "*" },
    [10] = { normal = "9", shifted = "(" },
    [11] = { normal = "0", shifted = ")" },
    [12] = { normal = "-", shifted = "_" },
    [13] = { normal = "=", shifted = "+" },
    [14] = { normal = "<BS>", shifted = "<BS>" },
  },
  [2] = {
    [1] = { normal = "<Tab>", shifted = "<Tab>" }, -- tab
    [2] = { normal = "q", shifted = "Q" },
    [3] = { normal = "w", shifted = "W" },
    [4] = { normal = "e", shifted = "E" },
    [5] = { normal = "r", shifted = "R" },
    [6] = { normal = "t", shifted = "T" },
    [7] = { normal = "y", shifted = "Y" },
    [8] = { normal = "u", shifted = "U" },
    [9] = { normal = "i", shifted = "I" },
    [10] = { normal = "o", shifted = "O" },
    [11] = { normal = "p", shifted = "P" },
    [12] = { normal = "[", shifted = "{" },
    [13] = { normal = "]", shifted = "}" },
    [14] = { normal = "\\", shifted = "|" },
  },
  [3] = {
    [1] = { normal = "<Caps>", shifted = "<Caps>" },
    [2] = { normal = "a", shifted = "A" },
    [3] = { normal = "s", shifted = "S" },
    [4] = { normal = "d", shifted = "D" },
    [5] = { normal = "f", shifted = "F" },
    [6] = { normal = "g", shifted = "G" },
    [7] = { normal = "h", shifted = "H" },
    [8] = { normal = "j", shifted = "J" },
    [9] = { normal = "k", shifted = "K" },
    [10] = { normal = "l", shifted = "L" },
    [11] = { normal = ";", shifted = ":" },
    [12] = { normal = "'", shifted = '"' },
    [13] = { normal = "<Enter>", shifted = "<Enter>" },
  },
  [4] = {
    [1] = { normal = "<Shift>", shifted = "<Shift>" },
    [2] = { normal = "z", shifted = "Z" },
    [3] = { normal = "x", shifted = "X" },
    [4] = { normal = "c", shifted = "C" },
    [5] = { normal = "v", shifted = "V" },
    [6] = { normal = "b", shifted = "B" },
    [7] = { normal = "n", shifted = "N" },
    [8] = { normal = "m", shifted = "M" },
    [9] = { normal = ",", shifted = "<" },
    [10] = { normal = ".", shifted = ">" },
    [11] = { normal = "/", shifted = "?" },
    [12] = { normal = "<Shift>", shifted = "<Shift>" },
  },
  [5] = {
    [1] = { normal = "<Ctrl>", shifted = "<Ctrl>" },
    [2] = { normal = "<Meta>", shifted = "<Meta>" },
    [3] = { normal = "<Space>", shifted = "<Space>" },
    [4] = { normal = "<Meta>", shifted = "<Meta>" },
    [5] = { normal = "<Ctrl>", shifted = "<Ctrl>" },
  },
}

local qwerty = Keyboard:new()
qwerty._layout = layout

return qwerty
