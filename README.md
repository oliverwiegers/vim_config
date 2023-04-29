# Vim config

Nothing to fancy just my vim config.

Once I was trying to solve as many problems without plugins and came up with
solutions replacing plugins like
[Nerdcommenter](https://github.com/scrooloose/nerdcommenter). But at some point
I noticed I was reinventing the wheel. It was a great journey and I learned a
lot about Vim.

In the end I started using plugins again.

## Look

Currently using gruvbox again.
Screenshot is showing the ripgrep preview.

![Vim](screenshot.png "Vim screenshot")

## Installed Plugins

- [ale](https://github.com/w0rp/ale.git)
- [fzf.vim](https://github.com/junegunn/fzf.vim)
- [wal.vim](https://github.com/dylanaraps/wal.vim)
- [airline](https://github.com/vim-airline/vim-airline)
- [gruvbox](https://github.com/morhetz/gruvbox)
- [coc.nvim](https://github.com/neoclide/coc.nvim)
- [rust.vim](https://github.com/rust-lang/rust.vim)
- [goyo.vim](https://github.com/junegunn/goyo.vim)
- [vim-rails](https://github.com/tpope/vim-rails)
- [vim-racer](https://github.com/racer-rust/vim-racer)
- [vader.vim](https://github.com/junegunn/vader.vim)
- [vim-dadbod](https://github.com/tpope/vim-dadbod)
- [rcshell.vim](https://github.com/vim-scripts/rcshell.vim)
- [vim-bundler](https://github.com/tpope/vim-bundler)
- [vim-devicons](https://github.com/ryanoasis/vim-devicons.git)
- [vim-fugitive](https://github.com/tpope/vim-fugitive.git)
- [vim-capslock](https://github.com/tpope/vim-capslock)
- [vim-startify](https://github.com/mhinz/vim-startify)

## External dependencies

- [ripgrep](https://github.com/BurntSushi/ripgrep) is needed to recursively
  search directory.
- [bat](https://github.com/sharkdp/bat) is needed for ripgrep preview.
- [fzf](https://github.com/junegunn/fzf) is needed for fzf.vim to run.

## Installation

```
cd $HOME
git clone --recursive https://github.com/oliverwiegers/vim_config .vim
cd .vim
stow vimrc
./helper-scripts/manage-coc.sh -i
```

### Coc.nvim extensions

```
vim '+CocInstall coc-rls coc-jedi'
```
