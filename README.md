# Vim config

Nothing to fancy just my vim config.

Once I was trying to solve as nany problems without plugins and came up with 
solutions replacing plugins like
[Nerdcommenter](https://github.com/scrooloose/nerdcommenter). But at some point
I noticed I was reinventing the wheel. It was a great journey and I learned alot
about Vim. 

In the end I started to use some fancy looking and helpful plugins again. After
all the goal is the same, keep this configuration as portable as possible. When
I was working on an Android tablet using Termux I started using the most minimal
configuration possible.

All used plugins are written in plain VimL and a little bash.

## Installed Plugins
- [goyo](https://github.com/junegunn/goyo.vim)
- [wal.vim](https://github.com/dylanaraps/wal.vim)
- [nerdtree](https://github.com/scrooloose/nerdtree.git)
- [airline](https://github.com/vim-airline/vim-airline)
- [incsearch](https://github.com/haya14busa/incsearch.vim)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [vim-devicons](https://github.com/ryanoasis/vim-devicons.git)
- [vim-fugitive](https://github.com/tpope/vim-fugitive.git)
- [vim-virtualenv](https://github.com/plytophogy/vim-virtualenv.git)
- [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim.git)
- [ale](https://github.com/w0rp/ale.git)


## Installation

```
$ cd $HOME
$ git clone --recursive https://github.com/oliverwigers/vim_config .vim
$ cd .vim
$ stow vimrc
```

## Look

![Vim](screenshot.png)
