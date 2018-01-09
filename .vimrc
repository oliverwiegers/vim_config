"load local vimrc
set exrc secure
"######################
"#		 plugins	  #
"######################

"airline
let g:airline_powerline_fonts = 1

"######################
"#		 personal	  #
"######################

"general
set ttyfast
set hlsearch
set path+=**
set wildmenu
set copyindent
set lazyredraw
set nocompatible
set encoding=utf-8
set clipboard=unnamed
set complete+=d,kspell
let &path.="/src/include"
set backspace=indent,eol,start

syntax on
filetype on
filetype plugin indent on

"splitting
set splitbelow splitright

"look of vim
set t_Co=256
set relativenumber
set background=dark
colorscheme gruvbox

"hilight whitespaces
set autoindent smartindent
set list listchars=tab:\|·,trail:·

"filetype detection and set shiftwidth
function! SetSw(index, length) "{{{
	if a:index<0
		let sw=4
	elseif a:index>=0 && a:index<a:length
		let sw=2
	endif
	set modifiable
	execute "set tabstop=".sw
	execute "set softtabstop=".sw
	execute "set shiftwidth=".sw
	if a:index==3
		set expandtab colorcolumn=81 textwidth=80 | retab.sw
	else
		set noexpandtab expandtab noexpandtab colorcolumn=81 textwidth=80 |
			\ retab!sw
	endif
endfunction "}}}

"call above function
let blacklist = ['html', 'css', 'json', 'yaml', 'cpp']

augroup types
	au BufRead,BufNewFile,BufNew *
		\ call SetSw(index(blacklist, &ft), len(blacklist))
	au BufRead,BufNewFile,BufNew *.asm set filetype=nasm
	au BufRead,BufNewFile,BufNew *.nix set filetype=yaml
	au BufRead,BufNewFile,BufNew *.pp	set filetype=puppet
augroup END

"commenting blocks of code, my native nerdcommenter replacement
augroup comments
	autocmd FileType c,cpp,java,scala let b:comment_leader = '//'
	autocmd FileType conf,fstab,sh,ruby,python,yaml let b:comment_leader = '#'
	autocmd FileType vim let b:comment_leader = '"'
augroup END

augroup K
	autocmd FileType vim setlocal keywordprg=:help
	autocmd FileType help setlocal keywordprg=:help
augroup END

augroup make_command
	autocmd FileType python set makeprg=python\ -c\ \"import\ py_compile,sys;\
				\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
	autocmd FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\
				\ %l%.%#,%Z%[%^\ ]%\\@=%m
	autocmd FileType python set omnifunc=python3complete#Complete keywordprg=pydoc3
augroup END

"netrw, my native nerdtree replacement
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25


"toggle Vexplore / open netrw / open filebrowser
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

"keymappings
let mapleader = "\<Space>"
inoremap jk <ESC>
nnoremap <silent> <Leader><Space> :call ToggleVExplorer()<CR>
nnoremap <silent> <S-u> :redo<CR>
nnoremap <Leader>t :tabnew 
nnoremap <Leader>f :find 

"development
nnoremap <silent> <F2> :make!<cr>
nnoremap <silent> <F3> :make! clean<cr>
nnoremap <silent> gf <C-W>gf
vnoremap <silent> gf <C-W>gf

"save file as root
cmap w!! w !sudo tee % >/dev/null

"split navigation
nnoremap <silent> <C-J> <C-W><C-J>
nnoremap <silent> <C-K> <C-W><C-K>
nnoremap <silent> <C-L> <C-W><C-L>
nnoremap <silent> <C-H> <C-W><C-H>
nnoremap <silent> <Leader>h :split<CR>
nnoremap <silent> <Leader>v :vsplit<CR>

"tab navigation
nnoremap <silent> <Leader>k :tabprevious<CR>
nnoremap <silent> <Leader>j :tabprevious<CR>

"incsearch
map  /	<Plug>(incsearch-forward)
map  ?	<Plug>(incsearch-backward)
map  g/ <Plug>(incsearch-stay)

"writing
nnoremap <silent> <Leader>s :setlocal spell! spelllang=en_us<CR>

"commenting
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')
	\<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')
	\<CR>//e<CR>:nohlsearch<CR>

"config changing
nnoremap  <silent> <Leader>r :source $MYVIMRC<CR>

"serch/replace
nnoremap <Leader>c :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <silent> <Leader>u :let @/=''<CR>

"######################
"#		 commands	  #
"######################

"make ctags
command! MakeTags !ctags -R .

"######################
"#		 testing	  #
"######################
nnoremap <Leader>todo :-1read $HOME/.vim/snippets/todo.vim<CR>
