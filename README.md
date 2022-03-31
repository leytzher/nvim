# Neovim configuration :rocket:

This is my personal Neovim configuration.


### Requirements
- Neovim > 0.5.0


### Installation

Clone this repo in your ~/.config directory. Make sure that you have a backup of your old nvim directory.
```
cd ~/.config/
git clone https://github.com/leytzher/nvim.git
```

We also need to install a **plugin manager**. In this case we will use Packer. Packer needs to be installed somewhere in your packpath (which is a directory that Neovim uses to find packages).  In my case one of the directories is `~/.config/nvim`. In case you want to see which directories are in your packpath, you can do this inside Neovim:

```
:lua print(vim.o.packpath)
```
Then install packer in your packpath. In this case it will create a directory called `/site` in the Neovim configuration directory.

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
~/.config/nvim/site/pack/packer/start/packer.nvim
```


