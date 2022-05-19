"----------------- Basic -------------------"
set visualbell
set number
let mapleader = ","
imap jk <esc>
cmap jk <c-c>
vmap jk <c-c>
map ; :
set hlsearch
map <CR> :nohlsearch
map <C-r> :!php % <CR>
set laststatus=2
set scrolloff=10
set expandtab

"------------------- Buffer -------------------"
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>  

"------------------- Tab Size -------------------"
set tabstop=2
set shiftwidth=2
set expandtab

"------------------- Moving Line -------------------"
" Move 1 more lines up or down in normal and visual selection modes.
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

"------------------- NedTree -------------------"
nmap ,e :NERDTreeToggle<CR>
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

"------------------- Auto sourching -------------------"
augroup autosourching
  autocmd!
  autocmd! bufwritepost init.vim source %
augroup END

"------------------ Window Management ---------------------"
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>
nmap <C-h> <C-w><C-h>

"------------------ File Management ---------------------"
call plug#begin('~/.config/nvim/plugged')
		Plug 'tpope/vim-surround'
		Plug 'github/copilot.vim'
		Plug 'scrooloose/nerdtree'
		Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
		Plug 'junegunn/fzf.vim'
				silent! nmap <C-p> :Files<CR>
				silent! nmap <C-g> :GFiles<CR>
				silent! nmap <C-b> :Buffers<CR>
				silent! nmap <C-f> :Rg!
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
      let g:airline#extensions#tabline#enabled = 1
      let g:airline_statusline_ontop=0
      let g:airline#extensions#tabline#left_sep = ' '
      let g:airline#extensions#tabline#left_alt_sep = '|'
      let g:airline#extensions#tabline#buffer_nr_show = 1
      let g:airline#extensions#tabline#formatter = 'jsformatter'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'romgrk/barbar.nvim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tpope/vim-commentary' " this is for make comment
    Plug 'mattn/emmet-vim'
 call plug#end()

 "------------------ Tabstatus by Barbar ---------------------"
 " Move to previous/next
nnoremap <silent>    a, :BufferPrevious<CR>
nnoremap <silent>    a. :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    a< :BufferMovePrevious<CR>
nnoremap <silent>    a> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    a1 :BufferGoto 1<CR>
nnoremap <silent>    a2 :BufferGoto 2<CR>
nnoremap <silent>    a3 :BufferGoto 3<CR>
nnoremap <silent>    a4 :BufferGoto 4<CR>
nnoremap <silent>    a5 :BufferGoto 5<CR>
nnoremap <silent>    a6 :BufferGoto 6<CR>
nnoremap <silent>    a7 :BufferGoto 7<CR>
nnoremap <silent>    a8 :BufferGoto 8<CR>
nnoremap <silent>    a9 :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <leader>p :BufferPin<CR>

" Close buffer
nnoremap <silent>    <leader>c :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseAllButCurrentOrPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>1
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used

" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" New tabs are opened next to the currently selected tab.
" Enable to insert them in buffer number order.
let bufferline.add_in_buffer_number_order = v:true

" Enable/disable animations
let bufferline.animation = v:true

" Enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:false

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" Excludes buffers from the tabline
let bufferline.exclude_ft = ['javascript']
let bufferline.exclude_name = ['package.json']

" Enable/disable icons
" if set to 'buffer_number', will show buffer number in the tabline
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
" if set to 'buffer_number_with_icon', will show buffer number and icons in the tabline
let bufferline.icons = v:true

" Sets the icon's highlight group.
" If false, will use nvim-web-devicons colors
let bufferline.icon_custom_colors = v:false

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = '車'

" If true, new buffers will be inserted at the start/end of the list.
" Default is to insert after current buffer.
let bufferline.insert_at_start = v:false
let bufferline.insert_at_end = v:false

" Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_padding = 4

" Sets the maximum buffer name length.
let bufferline.maximum_length = 30

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
  \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the name of unnamed buffers. By default format is "[Buffer X]"
" where X is the buffer number. But only a static string is accepted here.
let bufferline.no_name_title = v:null

set termguicolors
