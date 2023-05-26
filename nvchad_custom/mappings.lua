local M = {}

M.general = {
  n = {
    ["<F1>"] = {":Alpha<CR>", "open dashboard", opts = {nowait = true}},
  },
    i = {
        ["<S-CR>"] = {"<Esc>o", "new line", opts = {nowait = true}},
    }
}

M.exec = {
  n = {
    ["<F5>"] = {":! python %<CR>", "run python file", opts = {nowait = true}},
  },
}
return M
