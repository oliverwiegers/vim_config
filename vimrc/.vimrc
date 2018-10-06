" Load local vimrc.
set exrc secure

"######################
"#		 Plugins	  #
"######################

" Airline plugin settings.
let g:airline_powerline_fonts = 1
let g:airline_theme='badcat'

"######################
"#		 Personal	  #
"######################

" Configure Vim using system clipboard depending on OS.
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
	set clipboard=unnamed
elseif os == 'Linux'
	set clipboard=unnamedplus
endif

" General settings.
set ttyfast
" Make underscore a word separator
set iskeyword=_
set hlsearch
set wildmenu
set expandtab
set splitbelow
set splitright
set copyindent
set autoindent
set lazyredraw
set smartindent
set textwidth=80
set nocompatible
set colorcolumn=81
set relativenumber
" Force vim Vim <=v7 to treat every numeral as decimal even if prepended with 0
set nrformats-=octal
set encoding=utf-8
set complete+=d,kspell
set backspace=indent,eol,start


" Set path to local working dir.
let &path = getcwd() . '/**'

" Enable syntax highlighting.
syntax on
filetype on
filetype plugin indent on

" Color scheme settings.
"set t_Co=256
set background=dark

" Spellcheking related highlighting.
" Needs to be loaded after theme otherwise the them will overrride highlighting
" settings.
hi clear SpellBad
hi SpellBad cterm=underline

" Filetype detection and set shiftwidth according to filetype.
function! SetSw(index, length) "{{{
	if a:index<0
		let sw=4
	elseif a:index==5
		let sw=4
		set colorcolumn=81,101 textwidth=100
	else
		let sw=2
	endif
	set modifiable
	execute "set tabstop=".sw
	execute "set softtabstop=".sw
	execute "set shiftwidth=".sw
endfunction "}}}

" Used shiftwidth settings.
let blacklist = ['html', 'css', 'json', 'yaml', 'cpp', 'rust']

augroup types
	au BufRead,BufNewFile,BufNew *
		\ call SetSw(index(blacklist, &ft), len(blacklist))
	au BufRead,BufNewFile,BufNew *.asm set filetype=nasm
	au BufRead,BufNewFile,BufNew *.nix set filetype=yaml
	au BufRead,BufNewFile,BufNew *.pp	set filetype=puppet
augroup END

" Commenting blocks of code, my native nerdcommenter replacement.
augroup comments
	autocmd FileType c,cpp,java,scala let b:comment_leader = '//'
	autocmd FileType conf,fstab,sh,ruby,python,yaml let b:comment_leader = '#'
	autocmd FileType vim let b:comment_leader = '"'
augroup END

augroup K
	autocmd FileType vim setlocal keywordprg=:help
	autocmd FileType help setlocal keywordprg=:help
augroup END

" Netrw, my native nerdtree replacement.
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Toggle Vexplore / open netrw / open filebrowser.
function! ToggleVExplorer() "{{{
	if exists("t:expl_buf_num")
		let expl_win_num = bufwinnr(t:expl_buf_num)
		if expl_win_num != -1
			let cur_win_nr = winnr()
			exec expl_win_num . 'wincmd w'
			close
			exec cur_win_nr . 'wincmd w'
			unlet t:expl_buf_num
		else
			unlet t:expl_buf_num
		endif
	else
		exec '1wincmd w'
		Vexplore
		let t:expl_buf_num = bufnr("%")
	endif
endfunction "}}}

"######################
"	  keymappings	  #
"######################

" Map leader key to space bar.
let mapleader = "\<Space>"

" File navigation.
nnoremap <silent> <Leader><Space> :call ToggleVExplorer()<CR>
nnoremap <Leader>t :tabnew 
nnoremap <Leader>f :find 

" Usefull mappings for writing code.
nnoremap <silent> <F2> :make!<cr>
nnoremap <silent> <F3> :make! clean<cr>
nnoremap <silent> gf <C-W>gf
vnoremap <silent> gf <C-W>gf

" Save file as root.
cmap w!! w !sudo tee % >/dev/null

" Split navigation.
nnoremap <silent> <C-J> <C-W><C-J>
nnoremap <silent> <C-K> <C-W><C-K>
nnoremap <silent> <C-L> <C-W><C-L>
nnoremap <silent> <C-H> <C-W><C-H>
nnoremap <silent> <Leader>h :split<CR>
nnoremap <silent> <Leader>v :vsplit<CR>

" Tab navigation.
nnoremap <silent> <Leader>k :tabprevious<CR>
nnoremap <silent> <Leader>j :tabprevious<CR>

" Incsearch plugin mappings.
map  /	<Plug>(incsearch-forward)
map  ?	<Plug>(incsearch-backward)
map  g/ <Plug>(incsearch-stay)

" Spell checking for non code writing.
nnoremap <silent> <Leader>s :setlocal spell! spelllang=en_us<CR>

" Commenting out code.
noremap <silent> ,ca :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')
	\<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cd :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')
	\<CR>//e<CR>:nohlsearch<CR>

" Reload config on the fly.
nnoremap  <silent> <Leader>r :source $MYVIMRC<CR>

" Mapping redo command to U.
nnoremap <silent> <S-u> :redo<CR>

" Search/replace.
nnoremap <Leader>c :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <silent> <Leader>u :let @/=''<CR>

"######################
"#		 Commands	  #
"######################

" Make ctags.
command! MakeTags !ctags -R .
