-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------

-- Plugin: nvim-lspconfig
-- url: https://github.com/neovim/nvim-lspconfig

-- For configuration see the Wiki: https://github.com/neovim/nvim-lspconfig/wiki
-- Autocompletion settings of "nvim-cmp" are defined in plugins/nvim-cmp.lua

local lsp_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_status_ok then
  return
end

local cmp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_status_ok then
  return
end

-- Add additional capabilities supported by nvim-cmp
-- See: https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Highlighting references.
  -- See: https://sbulav.github.io/til/til-neovim-highlight-references/
  -- for the highlight trigger time see: `vim.opt.updatetime`
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = vim.lsp.buf.document_highlight,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Document Highlight",
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Clear All the References",
    })
  end

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

-- Diagnostic settings:
-- see: `:help vim.diagnostic.config`
-- Customizing how diagnostics are displayed
vim.diagnostic.config({
  -- 如果设置update_in_insert的话会一直跳，很烦
  update_in_insert = false,
  float = {
    -- 设置了不自动弹出后就可以设置focusable 为true了
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- Show line diagnostics automatically in hover window
-- 对我来说不需要，反而还挡住了cmp的提示
-- vim.cmd([[
--   autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
-- ]])

--[[
Language servers setup:

For language servers list see:
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

Language server installed:

Bash          -> bashls
Python        -> pyright
C-C++         -> clangd
HTML/CSS/JSON -> vscode-html-languageserver
JavaScript/TypeScript -> tsserver
--]]

-- Define `root_dir` when needed
-- See: https://github.com/neovim/nvim-lspconfig/issues/320
-- This is a workaround, maybe not work with some servers.
local root_dir = function()
  return vim.fn.getcwd()
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches.
-- Add your language server below:
local servers = { 'bashls', 'pyright', 'clangd', 'texlab', 'typst_lsp', 'lua_ls' }

-- Call setup
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    root_dir = root_dir,
    capabilities = capabilities,
    flags = {
      -- default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

-- nvim ufo fold setttings
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
require('ufo').setup()


-- arduino setup
local MY_FQBN = "arduino:avr:mega"
lspconfig.arduino_language_server.setup {
  cmd = {
    "arduino-language-server",
    "-cli-config", "/home/hzf/dotfiles/arduino-cli.yaml",
    "-fqbn",
    MY_FQBN,
  }
}
