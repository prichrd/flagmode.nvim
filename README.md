# flagmode.nvim

This plugin helps you enable and disable configurations using flags. Flagmode 
comes with a basic set of functionalities allowing the user to:

* Register flags with `flagmode.register`
* Toggle a flag with `flagmode.toggle` 
* Activate a flag with `flagmode.activate` 
* Deactivate a flag with `flagmode.deactivate` 

Here is an example of a flag called `relative_number` that allows a user to
toggle the relative numbering.

```lua
  require('flagmode').register('relative_number', {
    activate   = function() vim.opt.relativenumber = true; end,
    deactivate = function() vim.opt.relativenumber = false; end,
  })
```

The flag can now be toggled with:

```
:lua require('flagmode').toggle('relative_number')
```

## Install

Flagmode requires Neovim and follows the standard runtime package structure. 
It is possible to install it with all popular package managers:

* [vim-plug](https://github.com/junegunn/vim-plug)
  * `Plug 'prichrd/flagmode.nvim'`
* [packer](https://github.com/wbthomason/packer.nvim)
  * `use 'prichrd/flagmode.nvim'`

## Usage

The documentation can be found at [doc/flagmode.txt](doc/flagmode.txt). You can 
also use the `:help flagmode` command inside of Neovim.
