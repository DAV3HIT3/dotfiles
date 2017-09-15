" vim:ft=vim:fdm=marker
" 24-bit color {{{
if has('termguicolors')
	set termguicolors
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" }}}
" Vim options {{{
" (\) leader key
let g:mapleader = ' '
" (off, off, off) Enable filetype detection, indentation, plugin
filetype indent plugin on
" (off) Enable syntax highlighting
if !exists("g:syntax_on")
	syntax enable
endif
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
" (off) Do not redraw screen while executing and other non-typed commands
set lazyredraw
" }}}
" Unicode {{{
" Symbols are restricted to PragmataPro and FontAwesome
" Unicode symbols {{{
let s:unicode_on = 1

let g:sym_eol		= (s:unicode_on == 1) ? "¶" : "¶"
let g:sym_tab		= (s:unicode_on == 1) ? ">-": ">-"
let g:sym_space		= (s:unicode_on == 1) ? "⬝" : "."
let g:sym_trail		= (s:unicode_on == 1) ? "" : "-"
let g:sym_extends	= (s:unicode_on == 1) ? "⮐" : "v"
let g:sym_precedes	= (s:unicode_on == 1) ? "⭇" : "^"
let g:sym_conceal	= (s:unicode_on == 1) ? "" : "~"
let g:sym_nbsp		= (s:unicode_on == 1) ? "␣" : "-"

let g:sym_vimtab	= (s:unicode_on == 1) ? "" : "{}"
let g:sym_buffer	= (s:unicode_on == 1) ? "" : "[]"
let g:sym_expand_left	= (s:unicode_on == 1) ? "🠸" : "<-"
let g:sym_expand_right	= (s:unicode_on == 1) ? "🠺" : "->"
let g:sym_ellipsis	= (s:unicode_on == 1) ? "" : "..."

let g:sym_fold_prefix	= (s:unicode_on == 1) ? "" : "+"

let g:sym_sep_L_pri	= (s:unicode_on == 1) ? "" : ">"
let g:sym_sep_R_pri	= (s:unicode_on == 1) ? "" : "<"
let g:sym_sep_L_sec	= (s:unicode_on == 1) ? "" : ")"
let g:sym_sep_R_sec	= (s:unicode_on == 1) ? "" : "("

let g:sym_locked	= (s:unicode_on == 1) ? "" : "X"
let g:sym_unlocked	= (s:unicode_on == 1) ? "" : "O"
let g:sym_git		= (s:unicode_on == 1) ? "" : "#"

let g:sym_line_number	= (s:unicode_on == 1) ? "" : "L"
let g:sym_line_number_t	= (s:unicode_on == 1) ? "" : "#"
let g:sym_column_number	= (s:unicode_on == 1) ? "" : "C"

let g:sym_modified	= (s:unicode_on == 1) ? "" : "+"
let g:sym_nomodifiable	= (s:unicode_on == 1) ? "" : "-"

let g:sym_showbreak	= (s:unicode_on == 1) ? "⮑" : ">"
let g:sym_fill_fold	= (s:unicode_on == 1) ? "" : "-"
let g:sym_fill_vert	= (s:unicode_on == 1) ? "┃" : "]"
let g:sym_fill_diff	= (s:unicode_on == 1) ? "" : "-"

let g:sym_fill_stl	= (s:unicode_on == 1) ? "" : ""
let g:sym_fill_stlnc	= (s:unicode_on == 1) ? "" : ""

let g:sym_paste		= (s:unicode_on == 1) ? "" : "ρ"
let g:sym_spell		= (s:unicode_on == 1) ? "" : "Ꞩ"
let g:sym_notexists	= (s:unicode_on == 1) ? "" : "∄"

let g:sym_warning	= (s:unicode_on == 1) ? "" : ">>"
let g:sym_error		= (s:unicode_on == 1) ? "" : "--"

let g:sym_subscripts	= ["₀","₁","₂","₃","₄","₅","₆","₇","₈","₉"]
let g:sym_superscripts	= ["⁰","¹","²","³","⁴","⁵","⁶","⁷","⁸","⁹"]

"}}}
" (tab:> ,trail:-,nbsp:+) listchars {{{
if (g:sym_eol != "")
	execute 'set listchars+=eol:'		. g:sym_eol
endif

if (g:sym_tab != "")
	execute 'set listchars+=tab:'		. g:sym_tab
endif

if (g:sym_space != "")
	execute 'set listchars+=space:'		. g:sym_space
endif

if (g:sym_trail != "")
	execute 'set listchars+=trail:'		. g:sym_trail
endif

if (g:sym_extends != "")
	execute 'set listchars+=extends:'	. g:sym_extends
endif

if (g:sym_precedes != "")
	execute 'set listchars+=precedes:'	. g:sym_precedes
endif

if (g:sym_conceal != "")
	execute 'set listchars+=conceal:'	. g:sym_conceal
endif

if (g:sym_nbsp != "")
	execute 'set listchars+=nbsp:'		. g:sym_nbsp
endif
"}}}
" (vert:|,fold:-) fillchars {{{
if ( has("linebreak") && has("folding"))
	if (g:sym_fill_fold != "")
		execute 'set fillchars+=fold:'	. g:sym_fill_fold
	endif

	if (g:sym_fill_vert != "")
		execute 'set fillchars+=vert:'	. g:sym_fill_vert
	endif

	if (g:sym_fill_diff != "")
		execute 'set fillchars+=diff:'	. g:sym_fill_diff
	endif

	if (g:sym_fill_stl != "")
		execute 'set fillchars+=stl:'	. g:sym_fill_stl
	endif

	if (g:sym_fill_stlnc != "")
		execute 'set fillchars+=stlnc:'	. g:sym_fill_stlnc
	endif
endif
"}}}
" ("") showbreak {{{
if has("linebreak")
	if (g:sym_showbreak != "")
		execute 'set showbreak='	. g:sym_showbreak
	endif
endif
"}}}
"}}}
" Ripgrep {{{
if executable('rg')
	set grepprg=rg\ --vimgrep
endif
"}}}
" Plugins {{{
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
" The ultimate undo history visualizer for VIM
Plug 'mbbill/undotree'

if has('osx')
	" Search Dash.app from Vim
	Plug 'rizzatti/dash.vim'
endif

" C3E Plugin(s)
Plug '~/Projects/C3E/c3e-vim-tabline'
Plug '~/Projects/C3E/c3e-vim-leader'
call plug#end()
" }}}
" Plugin config {{{
let g:C3E_FKeys=1
let g:C3E_Browser='ranger'

" ALE: Asynchronous Linting Engine {{{
let g:airline#extensions#ale#enabled = 1

let g:ale_fixers = {
			\ 'vim': ['vint']
			\}
let g:ale_vim_vint_show_style_issues = 1
let g:ale_sign_warning = g:sym_warning
let g:ale_sign_error = g:sym_error
"}}}
" Cscope {{{
" In project root: $cscope -R -b
if has("cscope")
	" (nocscopetag) search cscope db as well as tag files
	set cscopetag

	" add cscope db in current directory if readable
	" or environment variable $CSCOPE_DB if present and readable
	if filereadable("cscope.out")
		cscope add cscope.out
	elseif $CSCOPE_DB != ""
		if filereadable($CSCOPE_DB)
			cscope add $CSCOPE_DB
		endif
	endif

endif
" }}}
" vim-airline {{{
let g:airline#extensions#tabline#enabled = 0
let g:airline_theme='dark'
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

"}}}
" netrw {{{
" tree style listing
let g:netrw_liststyle=3
" netrw window size (percentage)
let g:netrw_winsize=30
" vertical split default for previewing files
let g:netrw_preview=1
" prevent gx map while editing
let g:netrw_nogx=1
" suppress history
let g:netrw_dirhistmax=0
"}}}
" Rainbow {{{
let g:rainbow_active = 1
"}}}
" Tagbar {{{
let g:tagbar_zoomwidth = 0
let g:tagbar_compact = 1
let g:tagbar_status_func = 'TagbarStatusFunc'

" TagbarStatusFunc {{{
function! TagbarStatusFunc(current, sort, fname, ...) abort
	let g:lightline.fname = a:fname
	return lightline#statusline(0)
endfunction
" }}}
" }}}
" YouCompleteMe {{{
" ("~/.vim/.ycm_extra_conf.py"eneric YCM conf") Default / Global YCM config
let g:C3E_YCM_conf='~/.vim/.ycm_extra_conf.py'
if filereadable(g:C3E_YCM_conf)
	let g:ycm_global_ycm_extra_conf = g:C3E_YCM_conf
endif

" (1) Turn on/off YCM's diagnostic display (when set, disables Syntastic)
let g:ycm_show_diagnostics_ui = 1

" (<leader>d) Show full diagnostic text when cursor on line with diagnostic
let g:ycm_key_detailed_diagnostics = ''

let g:ycm_collect_identifiers_from_tags_files = 1

" (1) prompt before loading .ycm_extra_conf.py
let g:ycm_confirm_extra_conf = 0
"}}}
"}}}
" Directories {{{
let s:vim_dir = expand('~/.vim')
" viminfo
if has('viminfo')
	" (~/.viminfo) Set viminfo file location
	if isdirectory(s:vim_dir)
		execute 'set viminfo+=n' . s:vim_dir . '/viminfo'
	endif
endif
" }}}
" Mappings {{{
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
" FoldText: customized fold formatting {{{
" [TODO] Speed this up. Too slow!
if has('folding')
	function! FoldText()
		" prefix with the fold symbol repeated 1 time per foldlevel
		let l:prefix = repeat(g:sym_fold_prefix . ' ', v:foldlevel)

		let l:numfmt = printf('%3d', v:foldend - v:foldstart)
		let l:lineinfo =  '(' . l:numfmt . ' lines) '

		let l:spacing = winwidth(0) - strlen(l:prefix) - strlen(l:lineinfo) - 2

		" get first line of the fold
		let l:line = getline(v:foldstart)

		" clean up the line (remove comments, etc.)
		let l:title = substitute(l:line, '/\*\|\*/\|{\{3}\d\=', '', 'g')
		let l:atitle = printf('%-' . l:spacing . '.' . l:spacing . 's', l:title)


		return l:prefix . l:atitle . l:lineinfo
	endfunction

	" (foldtext()) Expression used to specify the text displayed for closed fold
	set foldtext=FoldText()
endif
" }}}
" TmuxOrSplitSwitch {{{
" C-h/j/k/l to move between tmux splits and vim windows seamlessly
" [TODO] Give credit for this, can't remember where I found it
" [TODO] Why is "l:previous_title" an illegal variable name?
if exists('$TMUX')
	function! TmuxOrSplitSwitch(wincmd, tmuxdir)
		let l:previous_winnr = winnr()
		silent! execute 'wincmd ' . a:wincmd
		if l:previous_winnr == winnr()
			call system('tmux select-pane -' . a:tmuxdir)
			redraw!
		endif
	endfunction

	let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
	let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
	let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

	nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
	nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
	nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
	nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
endif
"}}}
" SetUndojoinFlag: move currentline or selection up/down with arrow keys {{{
" https://www.reddit.com/r/vim/comments/4f79fd/weekly_vim_tips_and_tricks_thread_6/d26lf3l/
function! s:SetUndojoinFlag(mode)
	augroup undojoin_flag
		autocmd!
		if a:mode ==# 'v'
			autocmd CursorMoved * autocmd undojoin_flag CursorMoved * autocmd! undojoin_flag
		else
			autocmd CursorMoved * autocmd! undojoin_flag
		endif
	augroup END
endfunction

function! s:Undojoin()
	if exists('#undojoin_flag#CursorMoved')
		silent! undojoin
	endif
endfunction

nnoremap <silent> <Down> :<C-u>call <SID>Undojoin()<CR>:<C-u>move +1<CR>==:<C-u>call <SID>SetUndojoinFlag('n')<CR>
nnoremap <silent> <Up>   :<C-u>call <SID>Undojoin()<CR>:<C-u>move -2<CR>==:<C-u>call <SID>SetUndojoinFlag('n')<CR>
xnoremap <silent> <Down> :<C-u>call <SID>Undojoin()<CR>:<C-u>'<,'>move '>+1<CR>gv=gv:<C-u>call <SID>SetUndojoinFlag('v')<CR>gv
xnoremap <silent> <Up>   :<C-u>call <SID>Undojoin()<CR>:<C-u>'<,'>move '<-2<CR>gv=gv:<C-u>call <SID>SetUndojoinFlag('v')<CR>gv
" }}}
" }}}
" Autocommands {{{
if has('autocmd')
	let s:buf_nonumber = ['man', 'help', 'qf', 'tagbar']
	let s:buf_cursorline = ['qf', 'tagbar']

	" GrepWindow : stick grep results in full-width bottom quickfix window
	augroup GrepWindow
		autocmd!
		autocmd QuickFixCmdPost * botright cwindow
	augroup END

	" VertHelp: Put help window in a vertical split
	augroup VertHelp
		autocmd!
		autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
	augroup END

	" VimStartup:  startup necessities, runs after vim startup sequence complete
	augroup VimStartup
		autocmd!
		" set colorscheme diff vs. non-diff
		autocmd VimEnter * call C3E_ToggleColorscheme()
		autocmd VimEnter * call C3E_TablineRefresh()
		autocmd VimEnter * :AirlineRefresh
		autocmd VimEnter * execute 'hi Normal guibg=NONE ctermbg=NONE'
	augroup END

	" WindowCleaner: window-specific settings for buffer / filetypes
	augroup WindowCleaner
		autocmd!
		autocmd WinEnter * if index(s:buf_cursorline, &ft) >= 0 | :setlocal cursorline
		autocmd WinEnter * if index(s:buf_nonumber, &ft) >= 0	| :setlocal nobuflisted nonumber norelativenumber

		"autocmd WinEnter * if index(s:buf_nonumber, &ft) < 0	| :setlocal number relativenumber
		"autocmd WinLeave * if index(s:buf_nonumber, &ft) < 0	| :setlocal nonumber norelativenumber
	augroup END

	" DashKeywordSetter: Set DashKeywords based on filetype
	augroup DashKeywordSetter
		autocmd!
		"autocmd FileType * if index(s:buf_nonumber, &ft) < 0 | execute "DashKeywords! " . &ft
	augroup END

	" AutoMkdir: Make directory(ies) if they don't exists when creating a new file
	augroup AutoMkdir
		autocmd!
		autocmd BufWritePre,FileWritePre,BufNewFile *
					\ call <SID>AutoMkdir()
	augroup END
endif
"}}}
" Colorscheme {{{
" NOTE: Must be *after* plugin section
let g:gruvbox_italic=1
colorscheme gruvbox
" }}}
for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%', '`' ]
	execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
	execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
	execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
	execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor
