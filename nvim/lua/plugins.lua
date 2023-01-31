-- automatically run PackerCompile whenever plugins.lua is changed
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])
-- Only required if you have packer configured as `opt`
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- material theme
    use 'marko-cerovac/material.nvim'
    -- snippet engine
    use{"L3MON4D3/LuaSnip",
    config = function()
        require('plugin-config/luasnip')
    end
    }
    -- nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()require('plugin-config/nvim-tree')end
    }
    -- paste image from clipboard
    use 'ekickx/clipboard-image.nvim'
    -- switch to English when come back to normal mode from insert mode
    use { '520Matches/fcitx5.vim'}
    --float terminal
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require('plugin-config/toggleterm')
    end}
    --lsp
    use { 'williamboman/nvim-lsp-installer',
    config = function()
        require('plugin-config/nvim-lsp-installer')
    end
    }
    use {'neovim/nvim-lspconfig',
    config = function()
        require('plugin-config/lspconfig')
    end
    }
    -- auto completation
    use {'hrsh7th/nvim-cmp',
    requires = {'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-nvim-lsp', 'saadparwaiz1/cmp_luasnip'},
    after = {'nvim-lspconfig', 'nvim-lsp-installer', 'LuaSnip'},
     config = function()
       require('plugin-config/nvim-cmp')
   end
    }
    -- statusline 
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()require('plugin-config/lualine')end
    }
    -- bufferline on the top
    use {'akinsho/bufferline.nvim', tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons',
    config = function() require('plugin-config/bufferline') end
    }
    -- autopairs
    use {"windwp/nvim-autopairs",
    after = {'nvim-cmp'},
    config = function() require('plugin-config/nvim-autopairs')end
    }
    -- Comment conveniently 
    use {'numToStr/Comment.nvim',
    config = function()require('plugin-config/Comment')end
    }
    -- scroll bar
    use {'dstein64/nvim-scrollview',
    config = function()require('plugin-config/nvim-scrollview')end
    }
    -- fuzzy search 
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('plugin-config/telescope')
        end
    }
    -- display possible keybinds 
    use {"folke/which-key.nvim",
    config = function()
        require('plugin-config/whichkey')end
    }
    -- write lilypond in neovim 
    use { 'martineausimon/nvim-lilypond-suite',
    requires =  'MunifTanjim/nui.nvim',
    ft = {'lilypond'},
    config = function()
        require('plugin-config/nvim-lilypond-suite')
    end
    }
    -- write latex in vim 
    use {'lervag/vimtex',
    config = function()
        require('plugin-config.vimtex')
    end}
    -- view marks better 
    use {'chentoast/marks.nvim' ,
        config = function()
            require('plugin-config/marks')
        end
    }
    use {'nvim-treesitter/nvim-treesitter',
    config = function()
        require('plugin-config.nvim-treesitter')end 
}
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
end
)
