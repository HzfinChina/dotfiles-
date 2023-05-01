---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<F1>"] = {":Alpha<CR>", "open dashboard", opts = {nowait = true}},
  },
}

-- more keybinds!

return M
