local Keyboard = require("keyseer.keyboard")

return Keyboard:new({
  layout = {
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
      [12] = { normal = "[", shifted = "{" },
      [13] = { normal = "]", shifted = "}" },
      [14] = { normal = "<BS>", shifted = "<BS>" },
    },
    [2] = {
      [1] = { normal = "<Tab>", shifted = "<Tab>" },
      [2] = { normal = "'", shifted = '"' },
      [3] = { normal = ",", shifted = "<" },
      [4] = { normal = ".", shifted = ">" },
      [5] = { normal = "p", shifted = "P" },
      [6] = { normal = "y", shifted = "Y" },
      [7] = { normal = "f", shifted = "F" },
      [8] = { normal = "g", shifted = "G" },
      [9] = { normal = "c", shifted = "C" },
      [10] = { normal = "r", shifted = "R" },
      [11] = { normal = "l", shifted = "L" },
      [12] = { normal = "/", shifted = "?" },
      [13] = { normal = "=", shifted = "+" },
      [14] = { normal = "\\", shifted = "|" },
    },
    [3] = {
      [1] = { normal = "<Caps>", shifted = "<Caps>" },
      [2] = { normal = "a", shifted = "A" },
      [3] = { normal = "o", shifted = "O" },
      [4] = { normal = "e", shifted = "E" },
      [5] = { normal = "u", shifted = "U" },
      [6] = { normal = "i", shifted = "I" },
      [7] = { normal = "d", shifted = "D" },
      [8] = { normal = "h", shifted = "H" },
      [9] = { normal = "t", shifted = "T" },
      [10] = { normal = "n", shifted = "N" },
      [11] = { normal = "s", shifted = "S" },
      [12] = { normal = "-", shifted = "_" },
      [13] = { normal = "<Enter>", shifted = "<Enter>" },
    },
    [4] = {
      [1] = { normal = "<Shift>", shifted = "<Shift>" },
      [2] = { normal = ";", shifted = ":" },
      [3] = { normal = "q", shifted = "Q" },
      [4] = { normal = "j", shifted = "J" },
      [5] = { normal = "k", shifted = "K" },
      [6] = { normal = "x", shifted = "X" },
      [7] = { normal = "b", shifted = "B" },
      [8] = { normal = "m", shifted = "M" },
      [9] = { normal = "w", shifted = "W" },
      [10] = { normal = "v", shifted = "V" },
      [11] = { normal = "z", shifted = "Z" },
      [12] = { normal = "<Shift>", shifted = "<Shift>" },
    },
    [5] = {
      [1] = { normal = "<Ctrl>", shifted = "<Ctrl>" },
      [2] = { normal = "<Meta>", shifted = "<Meta>" },
      [3] = { normal = "<Space>", shifted = "<Space>" },
      [4] = { normal = "<Meta>", shifted = "<Meta>" },
      [5] = { normal = "<Ctrl>", shifted = "<Ctrl>" },
      [6] = { normal = "Left", shifted = "Left" },
      [7] = { normal = "Up", shifted = "Up" },
      [8] = { normal = "Down", shifted = "Down" },
      [9] = { normal = "Right", shifted = "Right" },
    },
  },
})
