-- Plugin manager configuration fiel
-- Plugin manager: packer.vim
-- url: https://github.com/wbthomason/packer.nvim

local cmd = vim.cmd
local fn = vim.fn

--- Autoinstall packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim.git",
        install_path,
    }
    print "[INFO] Installing Packer. Close and reopen Neovim"
    cmd [[packadd packer.nvim]]
end

--- Autocommand to reload neovim whenever this file is saved
cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

--- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded"}
        end,
    },
}


-- install plugins
return packer.startup(function(use)
   -- Add plugins here
   use "wbthomason/packer.nvim"   -- have packer manage itself

   -- Autopair
   use {
       'windwp/nvim-autopairs',
       config = function()
           require('nvim-autopairs').setup()
       end
   }

   -- nvim-tree
   use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        cmd = {"NvimTreeToggle", "NvimTreeClose"},
        config = function()
            require 'core.plugins-config.nvim-tree'.setup{}
        end,
   }

   -- treesitter
   use {
       'nvim-treesitter/nvim-treesitter',
       run = ":TSUpdate",
   }

    use {
        'junegunn/fzf', run="./install --bin",
    }

   -- telescope
   use {
       'nvim-telescope/telescope.nvim',
       requires = {{'nvim-lua/plenary.nvim'}}
   }

    -- comment plugin, terminal plugin and which key plugin
    use  "numToStr/Comment.nvim" -- easily comment stuff
    use  "akinsho/toggleterm.nvim"
    use  "antoinemadec/FixCursorHold.nvim" -- needed to fix lsp doc highlighting
    use  "folke/which-key.nvim"

    -- theme
    use {'ful1e5/onedark.nvim',
        config = function()
            require 'core.plugins-config.onedark'.setup{}
        end,
    }  -- onedark color theme

     use {'datwaft/bubbly.nvim', config = function()
        -- Here you can add the configuration for the plugin
        vim.g.bubbly_palette = {
          background = "#34343c",
          foreground = "#c5cdd9",
          black = "#3e4249",
          red = "#ec7279",
          green = "#a0c980",
          yellow = "#deb974",
          blue = "#6cb6eb",
          purple = "#d38aea",
          cyan = "#5dbbc1",
          white = "#c5cdd9",
          lightgrey = "#57595e",
          darkgrey = "#404247",
        }
        vim.g.bubbly_statusline = {
          'mode',

          'truncate',

          'path',
          'branch',
          'signify',
          'gitsigns',
          'coc',

          'divisor',

          'filetype',
          'progress',
        }
          end}

    --- Autocompletion
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP (Language Server Protocol)
    use  "neovim/nvim-lspconfig"  -- enable LSP
    use  "williamboman/nvim-lsp-installer" -- simple language server installer
    use  "tamago324/nlsp-settings.nvim"  -- language server settings defined in json
    use "jose-elias-alvarez/null-ls.nvim"  -- for formatters and linters

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)


