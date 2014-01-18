set nocompatible
set t_Co=256

set guifont =menlo\ for\ powerline:h16
set guioptions-=T " removes top toolbar
set guioptions-=r " removes right hand scrollbar
set go-=L " removes left hand scrollbar

"Show line numbers
set nu

" Show filepath in statusline
set statusline=%F
set laststatus=2

" Show/Hide Hidden Characters.
nmap <leader>l :set list!<CR>
set list! "show hidden characters by default

" indentation
set ts=4
set sts=4
set sw=4
set noexpandtab

" Indent Normally
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Non-default indentation preferences based on filetype
if has("autocmd")
	filetype on
	autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab

	"Treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss setfiletype xml
endif


" Remove trailing whitespace
function! <SID>StripTrailingWhitespaces()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	%s/\s\+$//e
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

"map above function to f5 and also run when certain filetypes are saved
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
autocmd BufWritePre *.php :call <SID>StripTrailingWhitespaces()

" working with buffers
set hidden
" Easier window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" Tabs
" for linux and windows users (using the control key)
map <C-S-]> gt
map <C-S-[> gT
map <C-1> 1gt
map <C-2> 2gt
map <C-3> 3gt
map <C-4> 4gt
map <C-5> 5gt
map <C-6> 6gt
map <C-7> 7gt
map <C-8> 8gt
map <C-9> 9gt
map <C-0> :tablast<CR>

" Line Bubbling
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Create/edit file in the current directory
syntax enable
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" My Bundles
" Color Scheme
Bundle 'altercation/vim-colors-solarized'
set background=dark
colorscheme solarized

filetype plugin indent on     " required!

