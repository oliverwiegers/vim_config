"#########################################################
"#        _    __   ____   __  ___   ____     ______     #
"#       | |  / /  /  _/  /  |/  /  / __ \   / ____/     #
"#       | | / /   / /   / /|_/ /  / /_/ /  / /          #
"#     _ | |/ /  _/ /   / /  / /  / _, _/  / /___        #
"#    (_)|___/  /___/  /_/  /_/  /_/ |_|   \____/        #
"#                                                       #
"#########################################################

" Load local vimrc.
set exrc secure

"            __            _
"     ____  / /_  ______ _(_)___  _____
"    / __ \/ / / / / __ `/ / __ \/ ___/
"   / /_/ / / /_/ / /_/ / / / / (__  )
"  / .___/_/\__,_/\__, /_/_/ /_/____/
" /_/            /____/

" A.L.E. settings.
let g:ale_completion_enabled = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_yaml_yamllint_options='-d "{extends: default, rules: {line-length: false, document-start: disable}}"'

" Airline settings.
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='gruvbox'

" FZF settings.
if executable('fzf')
    if executable('rg')
      let $FZF_DEFAULT_COMMAND = 'rg --ignore-case --files --hidden --follow --glob "!.git/*"'
      set grepprg=rg\ --vimgrep
      command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)  
      
      " Overriding fzf.vim's default :Files command.
      " Pass zero or one args to Files command (which are then passed to Fzf_dev). Support file path completion too.
      command! -nargs=? -complete=file Files call Fzf_dev(<q-args>)
    else
        echo 'Please install rg.'
    endif
    
    " Files + devicons
    function! Fzf_dev(qargs)
      let l:fzf_files_options = '-i --preview "bat --theme="base16" --style=numbers,changes --color always {2..-1} | head -'.&lines.'" --expect=ctrl-t,ctrl-v,ctrl-x --multi --bind=ctrl-a:select-all,ctrl-d:deselect-all'
    
      function! s:files(dir)
        let l:cmd = $FZF_DEFAULT_COMMAND
        if a:dir !=# ''
          let l:cmd .= ' ' . shellescape(a:dir)
        endif
        let l:files = split(system(l:cmd), '\n')
        return s:prepend_icon(l:files)
      endfunction
    
      function! s:prepend_icon(candidates)
        let l:result = []
        for l:candidate in a:candidates
          let l:filename = fnamemodify(l:candidate, ':p:t')
          let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
          call add(l:result, printf('%s %s', l:icon, l:candidate))
        endfor
    
        return l:result
      endfunction
      
      function! s:edit_file(lines)
        if len(a:lines) < 2 | return | endif
    
        let l:cmd = get({'ctrl-x': 'split',
                     \ 'ctrl-v': 'vertical split',
                     \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
        
        for l:item in a:lines[1:]
          let l:pos = stridx(l:item, ' ')
          let l:file_path = l:item[pos+1:-1]
          execute 'silent '. l:cmd . ' ' . l:file_path
        endfor
      endfunction
    
      call fzf#run({
            \ 'source': <sid>files(a:qargs),
            \ 'sink*':   function('s:edit_file'),
            \ 'options': '-m ' . l:fzf_files_options,
            \ 'down':    '40%' })
    endfunction
else
    echo 'Please install fzf.'
endif

" Startify.
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

let g:startify_enable_special      = 0
let g:startify_files_number        = 8
let g:startify_relative_path       = 1
let g:startify_change_to_dir       = 1
let g:startify_update_oldfiles     = 1
let g:startify_session_autoload    = 1
let g:startify_session_persistence = 1

let g:startify_skiplist = [
        \ 'COMMIT_EDITMSG',
        \ 'bundle/.*/doc',
        \ '/data/repo/neovim/runtime/doc',
        \ '/Users/mhi/local/vim/share/vim/vim74/doc',
        \ ]

let g:startify_bookmarks = [
        \ { 'c': '~/.vimrc' },
        \ ]

let g:startify_custom_footer =
       \ ['', "   Vim is charityware. Please read ':help uganda'.", '']

"               __  __  _
"    ________  / /_/ /_(_)___  ____ ______
"   / ___/ _ \/ __/ __/ / __ \/ __ `/ ___/
"  (__  )  __/ /_/ /_/ / / / / /_/ (__  )
" /____/\___/\__/\__/_/_/ /_/\__, /____/
"                           /____/

" General settings.
set ttyfast
set splitbelow
set splitright
set copyindent
set autoindent
set lazyredraw
set smartindent
"set nocompatible

" Give more space for displaying messages.
set cmdheight=2

" Switch buffers without saving.
set hidden

" Set encoding.
set encoding=utf-8
scriptencoding utf-8

" Show linenumbers and current line relative.
set relativenumber nu

" Fix last character of lines.
set backspace=indent,eol,start

" Highlight search results.
set hlsearch

" Start searching by substring.
set incsearch

" Enable wildmenu == show tab completion results.
set wildmenu

" Expand tabs to spaces
set expandtab

" Use zsh as vim shell.
set shell=zsh

" Set filewidth.
set textwidth=80
set colorcolumn=81

" needs to be after nocompatible
set iskeyword-=_

" Make Ctrl-a and Ctrl-x working with Base-10 numbers.
set nrformats-=octal

" Spellchecking.
set complete+=d,kspell

" Enable persistent undo.
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Set cursorline.
set cursorline

" Set cursorcolumn.
set cursorcolumn

" Set path to local working dir.
let &path = getcwd() . '/**'

" Enable syntax highlighting.
syntax on
filetype on
filetype plugin indent on

" Color scheme settings.
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
set background=dark

" Set netrw settings.
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Spellcheking related highlighting.
" Needs to be loaded after theme otherwise the them will overrride highlighting
" settings.
hi clear SpellBad
hi SpellBad cterm=underline

" Used shiftwidth settings.
let blacklist =
        \ ['html', 'css', 'json', 'yaml', 'cpp', 'rust',
        \ 'puppet', 'pp', 'ruby', 'eruby']

augroup types
    au BufRead,BufNewFile,BufNew *
        \ call SetSw(blacklist)
    au BufRead,BufNewFile,BufNew *.pp  set filetype=puppet
augroup END

augroup keywords
    au FileType vim setlocal keywordprg=:help
    au FileType help setlocal keywordprg=:help
augroup END

augroup retab_on_write
    au BufWrite * retab
augroup END

augroup local
    au User Startified setlocal cursorline
augroup end

"     ____                 __  _
"    / __/_  ______  _____/ /_(_)___  ____  _____
"   / /_/ / / / __ \/ ___/ __/ / __ \/ __ \/ ___/
"  / __/ /_/ / / / / /__/ /_/ / /_/ / / / (__  )
" /_/  \__,_/_/ /_/\___/\__/_/\____/_/ /_/____/

" Filetype detection and set shiftwidth according to filetype.
function! SetSw(blacklist) "{{{
    let index = index(a:blacklist, &filetype)
    if index<0
        let sw=4
    elseif index==5
        let sw=4
        set colorcolumn=81,101 textwidth=100
    else
        let sw=2
    endif
    set modifiable
    execute 'set tabstop='.sw
    execute 'set softtabstop='.sw
    execute 'set shiftwidth='.sw
endfunction "}}}

" Save current sessoin as $HOME/.vim/sessions/session-201911241740.vim
function! SaveCurrentSession() "{{{
    let path = $HOME . '/.vim/sessions/'
    let session_name = 'session' . strftime('-%Y%m%d%H%M%S.vim')
    let session = path . session_name
    let latest = path . 'latest'
    execute 'mksession ' . session
    execute '!if [ -L ' . latest . ' ]; then rm ' . latest . ';fi'
    execute '!ln -s ' . session . ' ' . latest
endfunction "}}}

" Load latest session.
function! LoadLatestSession() "{{{
    let path = $HOME . '/.vim/sessions/'
    let latest = path . 'latest'
    execute 'source ' . latest
endfunction "}}}

" Toggle Vexplore with.
function! ToggleVExplorer()
  if exists('t:expl_buf_num')
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
      let t:expl_buf_num = bufnr('%')
  endif
endfunction

"     __                                          _
"    / /_____  __  ______ ___  ____ _____  ____  (_)___  ____ ______
"   / //_/ _ \/ / / / __ `__ \/ __ `/ __ \/ __ \/ / __ \/ __ `/ ___/
"  / ,< /  __/ /_/ / / / / / / /_/ / /_/ / /_/ / / / / / /_/ (__  )
" /_/|_|\___/\__, /_/ /_/ /_/\__,_/ .___/ .___/_/_/ /_/\__, /____/
"           /____/               /_/   /_/            /____/

" Map leader key to space bar.
let mapleader = "\<Space>"

" A.L.E keybindings.
nmap <silent> <leader>an :ALENext<cr>
nmap <silent> <leader>ap :ALEPrevious<cr>

" File navigation.
nnoremap <silent> <Leader><Space> :call ToggleVExplorer()<CR>

" Usefull mappings for writing code.
nnoremap <silent> gf <C-W>gf
vnoremap <silent> gf <C-W>gf

" Save file as root.
cmap w!! w !sudo tee % >/dev/null

" Split navigation.
nnoremap <silent> <Leader>h :split<CR>
nnoremap <silent> <Leader>v :vsplit<CR>

" Tab navigation.
nnoremap <silent> <Leader>k :tabnext<CR>
nnoremap <silent> <Leader>j :tabprevious<CR>

" Spell checking for non code writing.
nnoremap <silent> <Leader>sp :setlocal spell! spelllang=en_us<CR>

" Reload config on the fly.
nnoremap <silent> <Leader>s :source $MYVIMRC<CR>

" Mapping redo command to U.
nnoremap <silent> <S-u> :redo<CR>

" Reset search pattern.
nnoremap <silent> <Leader>u :let @/=''<CR>

" FZF commands.
nnoremap <tab><tab> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader><tab> :Rg<CR>
nnoremap <leader>gc :Commits<CR>

" Open terminal in vsplit.
nnoremap <silent> <leader>t :term ++rows=20<CR>

nnoremap <silent> <Leader>r :term ++rows=20 ++close ranger<CR>

" Session management.
nnoremap <silent> <leader>ss :call SaveCurrentSession()<CR>
nnoremap <silent> <leader>ls :call LoadLatestSession()<CR>

" Goyo writing plugin.
nnoremap <silent> <Leader>ga :Goyo<CR>

" Change directory.
nnoremap <Leader>cd :cd %:p:h<Tab>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"                                                   __
"   _________  ____ ___  ____ ___  ____ _____  ____/ /____
"  / ___/ __ \/ __ `__ \/ __ `__ \/ __ `/ __ \/ __  / ___/
" / /__/ /_/ / / / / / / / / / / / /_/ / / / / /_/ (__  )
" \___/\____/_/ /_/ /_/_/ /_/ /_/\__,_/_/ /_/\__,_/____/
"

" Make ctags.
command! MakeTags !ctags -R .

"                              _                      __        __
"   ___  _  ______  ___  _____(_)___ ___  ___  ____  / /_____ _/ /
"  / _ \| |/_/ __ \/ _ \/ ___/ / __ `__ \/ _ \/ __ \/ __/ __ `/ /
" /  __/>  </ /_/ /  __/ /  / / / / / / /  __/ / / / /_/ /_/ / /
" \___/_/|_/ .___/\___/_/  /_/_/ /_/ /_/\___/_/ /_/\__/\__,_/_/
"         /_/
