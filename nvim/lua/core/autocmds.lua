-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- General settings:
--------------------

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	group = "YankHighlight",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = "1000" })
	end,
})

-- Remove whitespace on save
autocmd("BufWritePre", {
	pattern = "",
	command = ":%s/\\s\\+$//e",
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
	pattern = "",
	command = "set fo-=c fo-=r fo-=o",
})

-- Settings for filetypes:
--------------------------

-- Disable line length marker
augroup("setLineLength", { clear = true })
autocmd("Filetype", {
	group = "setLineLength",
	pattern = { "text", "markdown", "html", "xhtml", "javascript", "typescript" },
	command = "setlocal cc=0",
})

-- Set indentation to 2 spaces
augroup("setIndent", { clear = true })
autocmd("Filetype", {
	group = "setIndent",
	pattern = { "xml", "html", "xhtml", "css", "scss", "javascript", "typescript", "yaml", "lua" },
	command = "setlocal shiftwidth=2 tabstop=2",
})

-- make
autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.keymap.set(
			"n",
			"<f5>",
			":w<CR>:TermExec cmd='python %'<CR>",
			{ silent = true, noremap = true }
		)
	end,
})

-- typst
autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.typ",
	command = [[set filetype=typst |set makeprg=typst\ c\ % ]],
})

autocmd("FileType", {
	pattern = "typst",
	callback = function()
		vim.keymap.set(
			"n",
			"<f5>",
			":w<CR>:TermExec cmd='sioyek %<.pdf > /dev/null & ;typst w %' <CR>",
			{ silent = true, noremap = true }
		)
	end,
})

autocmd("FileType", {
	pattern = "arduino",
	callback = function()
		vim.keymap.set(
			"n",
			"<f5>",
			":w<CR>:TermExec cmd='arduino-cli upload -p `ls /dev/ttyUSB*` -b arduino:avr:mega' <CR>",
			{ silent = true, noremap = true }
		)
	end,
})
