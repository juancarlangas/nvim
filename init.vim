call plug#begin(stdpath('data') . '/plugged')
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'morhetz/gruvbox'
call plug#end()

set mouse=a
set termguicolors

set title
set number
set wrap

set tabstop=2
set shiftwidth=2
set noexpandtab

let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox
set background=light

let g:airline_powerline_fonts = 1
