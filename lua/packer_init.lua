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

    -- gruvbox
    use {
        "ellisonleao/gruvbox.nvim"
    }




end)

