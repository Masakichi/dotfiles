if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('Shougo/deoplete.nvim')
 call dein#add('deoplete-plugins/deoplete-go', {'build': 'make'})
 call dein#add('deoplete-plugins/deoplete-jedi')
 call dein#add('vim-airline/vim-airline')
 call dein#add('dracula/vim')
 call dein#add('scrooloose/nerdtree')
 call dein#add('tpope/vim-fugitive')
 call dein#add('chrisbra/csv.vim')
 call dein#add('davidhalter/jedi-vim')
 call dein#add('majutsushi/tagbar')
 call dein#add('w0rp/ale')
 call dein#add('chrisbra/Colorizer')
 call dein#add('mattn/emmet-vim')
 call dein#add('fatih/vim-go')
 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable

" general config
syntax on
colorscheme dracula

autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

set ignorecase
set number
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set expandtab
set tabstop=4
set shiftwidth=4
set cc=100
set cursorline
set cursorcolumn
set autowrite

autocmd FileType go nmap <leader>b  <Plug>(go-build)
" autocmd FileType go nmap <leader>r  <Plug>(go-run)
" https://github.com/fatih/vim-go/issues/1412
autocmd FileType go nmap <leader>r :w<CR>:vsplit <bar> terminal go run %<CR>
autocmd FileType go nmap <Leader>d  <Plug>(go-def-type-vertical)

let mapleader="\<SPACE>"

imap jj <Esc>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2'


" deoplete config
let g:deoplete#enable_at_startup=1
autocmd CompleteDone * silent! pclose!

" airline config
let g:airline_powerline_fonts=1
let g:airline_theme='dracula'

" jedi-vim config
let g:jedi#auto_vim_configuration=0
let g:jedi#goto_assignments_command=''  " dynamically done for ft=python.
let g:jedi#goto_definitions_command='<Leader>gd'  " dynamically done for ft=python.
let g:jedi#use_tabs_not_buffers=1  " current default is 1.
let g:jedi#rename_command='<Leader>gR'
let g:jedi#usages_command='<Leader>gu'
let g:jedi#completions_enabled=0
let g:jedi#smart_auto_mappings=1
let g:jedi#auto_close_doc=1

" nerdtree config
map <Leader>n :NERDTreeToggle<CR>

" tagbar cofig
nmap <Leader>t :TagbarToggle<CR>

" ale config
let g:ale_linters = {'python': ['pylint']}

" vim-go
let g:go_term_mode = "split"
let g:go_term_height = 10
