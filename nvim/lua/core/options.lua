-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------


local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = "a" -- Enable mouse support
-- opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
opt.completeopt = "menuone,noinsert,noselect" -- Autocomplete options
opt.undofile = true
opt.fileencodings = { "ucs-bom", "utf-8", "cp936", "gb18030", "big5", "euc-jp", "euc-kr", "latin1" }

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true -- Show line number
opt.signcolumn = "yes:1"
opt.showmatch = true -- Highlight matching parenthesis
-- opt.colorcolumn = "80" -- Line lenght marker at 80 columns
opt.splitright = true -- Vertical split to the right
opt.splitbelow = true -- Horizontal split to the bottom
opt.ignorecase = true -- Ignore case letters when search
opt.smartcase = true -- Ignore lowercase for the whole pattern
opt.linebreak = true -- Wrap on word boundary
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.laststatus = 3 -- Set global statusline
opt.cursorline = true

opt.foldmethod = "expr" -- Enable folding (default 'foldmarker')
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldcolumn = '1' -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99

-----------------------------------------------------------
-- GUI Settings
-----------------------------------------------------------
opt.guifont = "JetBrainsMono Nerd Font Mono:h18,霞鹜文楷 屏幕阅读版 R:h18"
vim.opt.linespace = -5
if vim.g.neovide then
	vim.g.neovide_scale_factor = 1
	vim.g.neovide_scroll_animation_length = 1
	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_cursor_trail_size = 0.5
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_underline_automatic_scaling = true
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
	vim.g.neovide_cursor_vfx_particle_lifetime = 1
	vim.g.neovide_cursor_vfx_particle_density = 50
end

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines

opt.list = true
opt.listchars:append "eol:↴"


-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- Enable background buffers
opt.history = 200 -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- set colorscheme
-- vim.cmd([[colorscheme bluloco]])

-- Disable nvim intro
opt.shortmess:append("sI")

-- -- Disable builtin plugins
local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"tutor",
	"rplugin",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end
