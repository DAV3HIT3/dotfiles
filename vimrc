" vim:ft=vim:fdm=marker

" (\) leader key
let g:mapleader = ' '
" (off, off, off) Enable filetype detection, indentation, plugin
filetype indent plugin on
" (off) Enable syntax highlighting
syntax on
" (off) automatically save undo history to undo file when writing
set undofile
" ("") clipboard
set clipboard+=unnamed
" (1) Always have a status line
set laststatus=2
" (1) Always show tab line
set showtabline=2
" (1) Screen lines for command-line (avoid "hit-enter" prompts)
set cmdheight=2
" (off) Allow buffers with unsaved changes
set hidden
" (off) Show line numbers
set number
" (off) Show relative line numbers
set relativenumber
" (off) Enhanced command-line completion
set wildmenu
" (tcq) How automatic formatting should be done
" j : remove a comment leader when joining lines
set formatoptions+=j
" o : insert current comment leader after 'o'/'O' in normal mode
" [TODO]: Find out where is is being turned back on!
set formatoptions-=o
" t : auto-wrap text, but not comments
set formatoptions-=t
" (aABceFs) Add option to use number column for wrapped text
set cpoptions+=n
" (on) Don't insert two spaces after ./?/! when joining
set nojoinspaces
" (off) Ignore case in seach patterns
set ignorecase
" (off) Adjust case when doing keyword completion
set infercase
" (off) Override |ignorecase| if pattern contains uppercase
set smartcase
" (off) highlight all search patterns
set hlsearch
" (off) match search pattern as it is typed
set incsearch
" (manual) Syntax highlighting items specify folds
set foldmethod=syntax
" (3000) Maximum column in which to search for syntax items
set synmaxcol=160
" (0) maximum width of text that is being inserted
set textwidth=80
" (on) When on, lines longer than window width will wrap
set nowrap
" (.,/usr/include,,) List of dirs to search with some commands
set path=.,**
let g:C3E_FKeys=1
let g:C3E_Browser='ranger'

" Plugins (via vim-plug) {{{
call plug#begin('~/.vim/plugged')
" Retro groove color scheme for Vim
Plug 'morhetz/gruvbox'
" Dark powered asynchronous unite all interfaces for Neovim/Vim8
Plug 'Shougo/denite.nvim'
" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
" A vim keymap-display loosely inspired by emacs's guide-key.
Plug 'hecal3/vim-leader-guide'
" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe'
" Generates config files for YouCompleteMe
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'
" Asynchronous Lint Engine
Plug 'w0rp/ale'
" Adds file type glyphs/icons to many popular Vim plugins
"Plug 'ryanoasis/vim-devicons'
"rainbow parentheses improved, shorter code, no level limit, smooth and fast, powerful configuration.
Plug 'luochen1990/rainbow'
" A command-line fuzzy finder written in Go
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

if has('osx')
	" Search Dash.app from Vim
	Plug 'rizzatti/dash.vim'
endif

" C3E Plugin(s)
Plug '~/Projects/C3E/c3e-vim'
Plug '~/Projects/C3E/c3e-vim-tabline'
Plug '~/Projects/C3E/c3e-vim-leader'
call plug#end()
" }}}

let g:gruvbox_italic=1
colorscheme gruvbox

" Directory locations {{{

" viminfo
if has('viminfo')
	" vim settings directory
	let s:vim_dir = expand('~/.vim')

	" (~/.viminfo) Set viminfo file location
	if isdirectory(s:vim_dir)
		execute 'set viminfo+=n' . s:vim_dir . '/viminfo'
	endif
endif

" undodir
"if has("persistent_undo")
"	let s:undo_dir = expand("~/.vim")
"
"	" (.) List of directory names for undo files, seperated with commas
"	if isdirectory(s:undo_dir)
"		execute "set undodir+=n" . s:undo_dir . "/undodir"
"	endif
"
"endif
"}}}
" Custom mappings {{{
" Y to act like D and C, i.e. to yank until EOL
map Y y$
" i instead of I to insert in visual mode
vmap i I
" w!! : save with sudo (when opened without sudo)
cnoremap  w!! w !sudo tee % > /dev/null
"}}}
" Functions {{{
" AutoMkdir: auto-create missing directory(ies) for new files/buffers {{{
" https://www.reddit.com/r/vim/comments/4tb61s/weekly_vim_tips_and_tricks_thread_19/d5g0iik/ 
function! <SID>AutoMkdir() abort 
    let l:dir = expand('<afile>:p:h')
    let l:file = expand('<afile>:t')
    if !isdirectory(l:dir)
        call mkdir(l:dir, 'p')
        silent execute 'bw ' . l:dir . '/' . l:file
        silent execute 'e ' . l:dir . '/' . l:file
    endif
endfunction
" }}}
" }}}
" Autocommands {{{
let s:buf_nonumber = ['man', 'help', 'qf', 'tagbar']
let s:buf_cursorline = ['qf', 'tagbar']

" GrepWindow : stick grep results in full-width bottom quickfix window
augroup GrepWindow
	au!
	autocmd QuickFixCmdPost * botright cwindow
augroup END

" VimStartup:  startup necessities, runs after vim startup sequence complete
augroup VimStartup
	au!
	" set colorscheme diff vs. non-diff
	autocmd VimEnter * call C3E_ToggleColorscheme()
	autocmd VimEnter * call C3E_TablineRefresh()
	autocmd VimEnter * :AirlineRefresh
	autocmd VimEnter * execute 'hi Normal guibg=NONE ctermbg=NONE'
augroup END

" WindowCleaner: window-specific settings for buffer / filetypes
augroup WindowCleaner
	au!
	autocmd WinEnter * if index(s:buf_cursorline, &ft) >= 0 | :setlocal cursorline
	autocmd WinEnter * if index(s:buf_nonumber, &ft) < 0	| :setlocal number relativenumber
	autocmd WinEnter * if index(s:buf_nonumber, &ft) >= 0	| :setlocal nobuflisted nonumber norelativenumber

	autocmd WinLeave * if index(s:buf_nonumber, &ft) < 0	| :setlocal nonumber norelativenumber
augroup END

" DashKeywordSetter: Set DashKeywords based on filetype
augroup DashKeywordSetter
	au!
	autocmd FileType * if index(s:buf_nonumber, &ft) < 0 | execute "DashKeywords! " . &ft
augroup END

" AutoMkdir: Make directory(ies) if they don't exists when creating a new file
augroup AutoMkdir
    autocmd!
    autocmd BufWritePre,FileWritePre,BufNewFile *
        \ call <SID>AutoMkdir()
augroup END
"}}}
