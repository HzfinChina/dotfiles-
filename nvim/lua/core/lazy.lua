-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: lazy.nvim
-- URL: https://github.com/folke/lazy.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- Start setup
lazy.setup({
	spec = {
		-- Colorscheme:
		-- The colorscheme should be available when starting Neovim.
		{
			"folke/tokyonight.nvim",
		},
		{
			"marko-cerovac/material.nvim",
		},
		{
			"sainnhe/everforest",
		},
		{
			"bluz71/vim-nightfly-colors",
			name = "nightfly",
			lazy = false,
			priority = 1000,
		},
		{
			"sainnhe/edge",
		},
		{
			"sainnhe/gruvbox-material",
		},
		{
			"sainnhe/sonokai",
		},
		{
			"nyoom-engineering/oxocarbon.nvim",
		},
		{
			"rebelot/kanagawa.nvim",
		},
		{
			"luisiacc/gruvbox-baby",
		},
		{
			"EdenEast/nightfox.nvim",
		},
		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
		},
		{
			"uloco/bluloco.nvim",
			lazy = false,
			priority = 1000,
			dependencies = { "rktjmp/lush.nvim" },
			config = function() end,
		},
		{
			"cpea2506/one_monokai.nvim",
		},
		{
			"navarasu/onedark.nvim",
		},
		{
			"projekt0n/github-nvim-theme",
		},
		{
			"zaldih/themery.nvim",
			config = function()
				require("themery").setup({
					themes = {
						"carbonfox",
						"catppuccin",
						"catppuccin-frappe",
						"catppuccin-latte",
						"catppuccin-macchiato",
						"catppuccin-mocha",
						"darkblue",
						"dawnfox",
						"dayfox",
						"default",
						"delek",
						"desert",
						"duskfox",
						"edge",
						"elflord",
						"evening",
						"everforest",
						"github_dark",
						"github_dark_colorblind",
						"github_dark_default",
						"github_dark_high_contrast",
						"github_dark_tritanopia",
						"github_dimmed",
						"github_light",
						"github_light_colorblind",
						"github_light_default",
						"github_light_high_contrast",
						"github_light_tritanopia",
						"gruvbox-baby",
						"gruvbox-material",
						"habamax",
						"industry",
						"kanagawa",
						"kanagawa-dragon",
						"kanagawa-lotus",
						"kanagawa-wave",
						"koehler",
						"lunaperche",
						"material",
						"material-darker",
						"material-deep-ocean",
						"material-lighter",
						"material-oceanic",
						"material-palenight",
						"morning",
						"murphy",
						"nightfly",
						"nightfox",
						"nordfox",
						"one_monokai",
						"onedark",
						"oxocarbon",
						"pablo",
						"peachpuff",
						"quiet",
						"ron",
						"shine",
						"slate",
						"sonokai",
						"terafox",
						"tokyonight",
						"tokyonight-day",
						"tokyonight-moon",
						"tokyonight-night",
						"tokyonight-storm",
						"torte",
						"zellner",
						"bluloco",
						"bluloco-light",
						"bluloco-dark",
						"blue",
						"github_dark_dimmed",
					},
					themeConfigFile = "~/.config/nvim/lua/core/theme.lua", -- Described below
					livePreview = true,
				})
			end,
		},

		-- Dashboard (start screen)
		{
			"goolord/alpha-nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},

		-- Git labels
		{
			"lewis6991/gitsigns.nvim",
			lazy = true,
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				require("gitsigns").setup({})
			end,
		},

		-- File explorer
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
			},
			config = function()
        require("neo-tree").setup({
          follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer every time
            --               -- the current file is changed while the tree is open.
          },
          window = {
            width = 25,
            mappings = {
              ["o"] = "system_open",
            },
          },
          commands = {
            system_open = function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              path = vim.fn.shellescape(path, 1)
              -- Linux: open file in default application
              vim.api.nvim_command("silent !xdg-open " .. path)
            end,
          },
				})
			end,
		},

		-- Treesitter
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
		},

		-- Indent line
		{
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("indent_blankline").setup({
					space_char_blankline = " ",
					show_current_context = true,
					show_current_context_start = true,
				})
			end,
		},

		-- Autopair
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		},

		-- LSP
		{
			"neovim/nvim-lspconfig",
		},
		{
			"nvimdev/lspsaga.nvim",
			event = "LspAttach",
			config = function()
				require("lspsaga").setup({})
			end,
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
				"nvim-tree/nvim-web-devicons",
			},
		},

		-- Lsp install
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup({})
			end,
		},
		-- lsp picograms
		{
			"onsails/lspkind.nvim",
		},
		-- stand alone lsp ui
		{
			"j-hui/fidget.nvim",
			tag = "legacy",
			event = "LspAttach",
			opts = {
				-- options
			},
		},
		-- 键入参数时显示类型
		{
			"ray-x/lsp_signature.nvim",
			event = "VeryLazy",
			opts = {},
			config = function(_, opts)
				require("lsp_signature").setup(opts)
			end,
		},
		{
			"folke/trouble.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			config = function()
				require("trouble").setup({})
			end,
			--use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
		},

		-- Autocomplete
		{
			"hrsh7th/nvim-cmp",
			-- load cmp on InsertEnter
			event = "InsertEnter",
			-- these dependencies will only be loaded when cmp loads
			-- dependencies are always lazy-loaded unless specified otherwise
			dependencies = {
				"L3MON4D3/LuaSnip",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-buffer",
				"saadparwaiz1/cmp_luasnip",
			},
		},
		-- markdown-preview
		{
			"iamcco/markdown-preview.nvim",
			ft = { "markdown", "txt", "help" },
			build = function()
				vim.fn["mkdp#util#install"]()
			end,
			config = function()
				vim.g.mkdp_browser = "qutebrowser"
				vim.g.mkdp_filetypes = { "markdown", "txt", "help" }
			end,
		},
		-- quick search
		{
			"nvim-telescope/telescope.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				require("telescope").setup({
					pickers = {
						colorscheme = {
							enable_preview = true,
						},
					},
				})
			end,
		},
		-- terminal
		{ "akinsho/toggleterm.nvim", version = "*", config = true },
		-- buffer line
		{
			"akinsho/bufferline.nvim",
			version = "*",
			dependencies = "nvim-tree/nvim-web-devicons",
			config = function()
				require("bufferline").setup({})
			end,
		},
		-- status line
		{
			"nvim-lualine/lualine.nvim",
			version = "*",
			dependencies = "nvim-tree/nvim-web-devicons",
			-- options ={theme = 'tokyonight'},
			config = function()
				require("lualine").setup({})
			end,
		},

		-- nvim lua dev
		{
			"folke/neodev.nvim",
			opts = {},
		},

		-- snippets
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			build = "make install_jsregexp",
		},
		-- Rainbow Highlighting
		--{
		--  "HiPhish/nvim-ts-rainbow2",
		--},
		-- easy motion
		{
			"phaazon/hop.nvim",
			config = function()
				require("hop").setup({})
			end,
		},

		-- which key
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			init = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
			end,
			opts = {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
		},

		{
			"TobinPalmer/pastify.nvim",
			cmd = { "Pastify" },
			config = function()
				require("pastify").setup({
					opts = {},
					ft = {
						typst = '#img("$IMG$")',
					},
				})
			end,
		},

		{
			"kylechui/nvim-surround",
			version = "*", -- Use for stability; omit to use `main` branch for the latest features
			event = "VeryLazy",
			config = function()
				require("nvim-surround").setup({
					-- Configuration here, or leave empty to use defaults
				})
			end,
		},
		{
			"kevinhwang91/nvim-ufo",
			dependencies = {
				"kevinhwang91/promise-async",
				"neovim/nvim-lspconfig",
			},
			config = function()
				require("ufo").setup()
			end,
		},
		{
			"numToStr/Comment.nvim",
			opts = {
				-- add any options here
			},
			lazy = false,
		},
		{
			"andrewferrier/debugprint.nvim",
			opts = { ... },
			-- Remove the following line to use development versions,
			-- not just the formal releases
			version = "*",
		},
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      -- @type Flash.Config
      opts = {},
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
    }
  },
})
