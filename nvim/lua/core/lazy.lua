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
local status_ok, lazy = pcall(require, 'lazy')
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
      "sainnhe/everforest",
    },
    {
      'rebelot/kanagawa.nvim',
    },
    {'projekt0n/github-nvim-theme'},
    -- Dashboard (start screen)
    {
      'goolord/alpha-nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    { "EdenEast/nightfox.nvim" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
      'uloco/bluloco.nvim',
      lazy = false,
      priority = 1000,
      dependencies = { 'rktjmp/lush.nvim' },
      config = function()
        -- your optional config goes here, see below.
      end,
    },
    {"cpea2506/one_monokai.nvim"},

    -- Git labels
    {
      'lewis6991/gitsigns.nvim',
      lazy = true,
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
      },
      config = function()
        require('gitsigns').setup{}
      end
    },

    -- File explorer
    {
      'nvim-tree/nvim-tree.lua',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    -- Statusline

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- Indent line
    { 'lukas-reineke/indent-blankline.nvim' ,},

    -- Autopair
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function()
        require('nvim-autopairs').setup{}
      end
    },

    -- LSP
    { 'neovim/nvim-lspconfig' },

    -- Autocomplete
    {
      'hrsh7th/nvim-cmp',
      -- load cmp on InsertEnter
      event = 'InsertEnter',
      -- these dependencies will only be loaded when cmp loads
      -- dependencies are always lazy-loaded unless specified otherwise
      dependencies = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
      },
    },
    -- markdown-preview
    {
      "iamcco/markdown-preview.nvim",
      ft = "markdown",
      build = function()
        vim.fn["mkdp#util#install"]()
      end,
    },
    -- quick search
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('telescope').setup{
          pickers = {
            colorscheme = {
              enable_preview = true,
            }
          }
        }
      end

    },
    -- terminal
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    -- Lsp install
    {
      "williamboman/mason.nvim",
      config = function()
        require('mason').setup{}
      end
    },
    -- buffer line
    {'akinsho/bufferline.nvim', version = "*",
      dependencies = 'nvim-tree/nvim-web-devicons',
      config = function()
        require('bufferline').setup{}
      end
    },
    -- status line
    {'nvim-lualine/lualine.nvim', version = "*",
      dependencies = 'nvim-tree/nvim-web-devicons',
      -- options ={theme = 'tokyonight'},
      config = function()
        require('lualine').setup{}
      end
    },
    -- nvim lua dev
    { "folke/neodev.nvim", opts = {} },
    -- snippets
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
      config = function()
        require('luasnip').setup{}
        require("luasnip.loaders.from_vscode").lazy_load()
      end

    },
    -- Rainbow Highlighting
    {
      "HiPhish/nvim-ts-rainbow2",
    },
    -- easy motion
    {
      'phaazon/hop.nvim',
      config = function ()
        require("hop").setup{}
      end
    },
    -- vim-tex
    {
      "lervag/vimtex",
      ft = {"tex"},
      config = function ()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_latexmk = {
          build_dir = ".out",
          options = {
            "-shell-escape",
            "-verbose",
            "-file-line-error",
            "-interaction=nonstopmode",
            "-synctex=1",
          },
        }

        vim.g.vimtex_fold_enabled = true
      end
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
      }
    },
    -- trouble: quick fix list
    {
      "folke/trouble.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
    },
    {'TobinPalmer/pastify.nvim',
      cmd = { 'Pastify' },
  config = function()
    require('pastify').setup {
      opts = {
      },
          ft = {
            typst = '#img("$IMG$")'
          }
    }
  end
    },
  }
})
