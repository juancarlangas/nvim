" PLUG-INS
	call plug#begin(stdpath('data') . '/plugged')
		Plug 'morhetz/gruvbox'
		Plug 'Mofiqul/vscode.nvim'
		Plug 'vim-airline/vim-airline'
		"Plug 'joshdick/onedark.vim'
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		Plug 'fladson/vim-kitty'
		Plug 'cdelledonne/vim-cmake'
		Plug 'tpope/vim-fugitive'
		Plug 'sfztools/sfz.vim'
		if empty($VSCODE_NEOVIM)
			"Plug 'github/copilot.vim'
		endif
		"Plug 'mechatroner/rainbow_csv'
		"Plug 'ap/vim-css-color'
		"Plug 'fneu/breezy'
		"Plug 'nanotech/jellybeans.vim'
		"Plug 'airblade/vim-gitgutter'
		"Plug 'tribela/vim-transparent'
		"Plug 'jiangmiao/auto-pairs' // Está dando lata con el coc.nvim
		"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
		"Plug 'jackguo380/vim-lsp-cxx-highlight'
	call plug#end()

" Activates Copilot
	"let g:copilot#enabled = 1

" COLORSCHEMES
	" gruvbox
		let g:gruvbox_bold = '1'
		let g:gruvbox_italic = '1'
		let g:gruvbox_underline = '1'
		let g:gruvbox_undercurl = '1'
		let g:gruvbox_termcolors = '256'
		let g:gruvbox_contrast_light = 'soft'
		"let g:gruvbox_contrast_dark = 'hard'
		let g:gruvbox_italicize_comments = '1'
		let g:gruvbox_italicize_strings = '0'
		let g:gruvbox_invert_indent_lines = '1'
		let g:gruvbox_invert_selection = '0'

	" onedark
		let g:onedark_terminal_italics = 1

	if has('win32')
		luafile C:/Users/juanc/AppData/Local/nvim/vscode.lua
	else
		luafile /home/juancarlangas/.config/nvim/vscode.lua
	endif

	colorscheme gruvbox
	"colorscheme onehalfdark
	"colorscheme onedark
	"colorscheme gruvbox-baby
	"colorscheme jellybeans
	"colorscheme vscode
	"colorscheme codedark

	set background=dark

"SYSTEM TextEdit might fail if hidden is not set.
	set hidden

" DISPLAY
	set mouse=a
	set list
	set listchars=tab:\|\ ,trail:-
	set termguicolors
	set title
	set number
	set cursorline
	set relativenumber
	" set colorcolumn=120
	" set nowrap
	set linebreak
	set splitbelow

" TABULATORS
	set tabstop=4
	"set softtabstop=4
	set shiftwidth=4
	set noexpandtab

" FOLDING
	set foldmethod=marker

" CLIPBOARD
	set clipboard=unnamed

	" Map Ctrl+C to copy to system clipboard
	"nnoremap <C-c> "+y
	"vnoremap <C-c> "+y
	"inoremap <C-c> <C-o>"+y

	" Map Ctrl+V to paste from system clipboard
	"nnoremap <C-v> "+p
	"vnoremap <C-v> "+p
	"inoremap <C-v> <C-o>"+p

	"let g:lsp_cxx_hl_light_bg = 0
	let g:coc_default_semantic_highlight_groups = 1

" AIRLINE
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1
	"let g:airline_theme = 'breezy'

	" testing extra-powerline-symbols

	" set font terminal font or set gui vim font
	" to a Nerd Font (https://github.com/ryanoasis/nerd-fonts):
	"set guifont=DroidSansMono\ Nerd\ Font\ 12

	" testing rounded separators (extra-powerline-symbols):
	let g:airline_left_sep = "\uE0B4"
	let g:airline_right_sep = "\uE0B6"

	" set the CN (column number) symbol:
	let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])

" coc.nvim node path
	"let g:coc_node_path = '/snap/bin/node'

" CMake
	let g:cmake_console_size = 15
	let g:cmake_jump_on_error = 1
	" let g:cmake_default_config = 'build'
	let g:cmake_link_compile_commands = '1'

"SHORTCUTS

	" Navigation
		nnoremap <CR> O<Esc>S<Esc>j
		nnoremap - ddkP
		nnoremap _ ddp

	" Toggle between light and dark background
	function! ToggleBg()
		if &background == 'light'
			colorscheme gruvbox
			set background=dark
		else
			colorscheme vscode
			set background=light
		endif
	endfunction

	nnoremap <F12> :call ToggleBg()<CR>

	" Don't touch unnamed register when pasting over visual selection
		xnoremap <expr> p 'pgv"' . v:register . 'y'

	" Semi fuzzy haha
		nnoremap <C-p> :b<Space>

"
	" CMake
		nmap cg <Plug>(CMakeGenerate)
		nmap cb <Plug>(CMakeBuild)
		nmap ci <Plug>(CMakeInstall)
		nmap cs <Plug>(CMakeSwitch)
		nmap cq <Plug>(CMakeClose)
"
	"coc.nvim
		nmap <Space>e <Cmd>CocCommand explorer<CR>
		nnoremap <M-o> :CocCommand clangd.switchSourceHeader<CR>
"
		"" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
		" utf-8 byte sequence
		set encoding=utf-8

		" Some servers have issues with backup files, see #649.
		set nobackup
		set nowritebackup
"
		" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
		" delays and poor user experience.
		set updatetime=300
"
		" Don't pass messages to |ins-completion-menu|.
		set shortmess+=c
"
		" Always show the signcolumn, otherwise it would shift the text each time
		" diagnostics appear/become resolved.
		if has("nvim-0.5.0") || has("patch-8.1.1564")
		  " Recently vim can merge signcolumn and number column into one
		  set signcolumn=auto
		else
		  set signcolumn=auto
		endif
"
		" Use tab for trigger completion with characters ahead and navigate.
		" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
		" other plugin before putting this into your config.
		inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
		inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
		" Esta función revisa si hay un espacio previo al cursor. Es usado
		" originalmente con <TAB> para mostrar las sugerencias, pero
		" preferimos destinar para dicho propósito solamente <c-space>
		" function! s:check_back_space() abort
		  " let col = col('.') - 1
		  " return !col || getline('.')[col - 1]  =~# '\s'
		" endfunction
"
		" Use <c-space> to trigger completion.
		if has('nvim')
		  inoremap <silent><expr> <c-space> coc#refresh()
		else
		  inoremap <silent><expr> <c-@> coc#refresh()
		endif
"
		" Make <CR> auto-select the first completion item and notify coc.nvim to
		" format on enter, <cr> could be remapped by other vim plugin
		inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
		 							  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
		" Use `[g` and `]g` to navigate diagnostics
		" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
		nmap <silent> [g <Plug>(coc-diagnostic-prev)
		nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
		" GoTo code navigtion.
		nmap <silent> gd <Plug>(coc-definition)
		nmap <silent> gy <Plug>(coc-type-definition)
		nmap <silent> gi <Plug>(coc-implementation)
		nmap <silent> gr <Plug>(coc-references)
"
		" Use K to show documentation in preview window.
		nnoremap <silent> K :call <SID>show_documentation()<CR>
"
		function! s:show_documentation()
		  if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
		  elseif (coc#rpc#ready())
			call CocActionAsync('doHover')
		  else
			execute '!' . &keywordprg . " " . expand('<cword>')
		  endif
		endfunction
"
		" Highlight the symbol and its references when holding the cursor.
		autocmd CursorHold * silent call CocActionAsync('highlight')
"
		" Symbol renaming.
		nmap <leader>rn <Plug>(coc-rename)
"
		" Formatting selected code.
		xmap <leader>f  <Plug>(coc-format-selected)
		nmap <leader>f  <Plug>(coc-format-selected)
"
		augroup mygroup
		  autocmd!
		  " Setup formatexpr specified filetype(s).
		  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
		  " Update signature help on jump placeholder.
		  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
		augroup end
"
		" Applying codeAction to the selected region.
		" Example: `<leader>aap` for current paragraph
		xmap <leader>a  <Plug>(coc-codeaction-selected)
		nmap <leader>a  <Plug>(coc-codeaction-selected)
"
		" Remap keys for applying codeAction to the current buffer.
		nmap <leader>ac  <Plug>(coc-codeaction)
		" Apply AutoFix to problem on the current line.
		nmap <leader>qf  <Plug>(coc-fix-current)
"
		" Map function and class text objects
		" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
		xmap if <Plug>(coc-funcobj-i)
		omap if <Plug>(coc-funcobj-i)
		xmap af <Plug>(coc-funcobj-a)
		omap af <Plug>(coc-funcobj-a)
		xmap ic <Plug>(coc-classobj-i)
		omap ic <Plug>(coc-classobj-i)
		xmap ac <Plug>(coc-classobj-a)
		omap ac <Plug>(coc-classobj-a)
"
		" Remap <C-f> and <C-b> for scroll float windows/popups.
		if has('nvim-0.4.0') || has('patch-8.2.0750')
		   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
		   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
		   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
		   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
		   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
		   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
		 endif
"
		" Use CTRL-S for selections ranges.
		" Requires 'textDocument/selectionRange' support of language server.
		nmap <silent> <C-s> <Plug>(coc-range-select)
		xmap <silent> <C-s> <Plug>(coc-range-select)
"
		" Add `:Format` command to format current buffer.
		command! -nargs=0 Format :call CocAction('format')
"
		" Add `:Fold` command to fold current buffer.
		command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
		" Add `:OR` command for organize imports of the current buffer.
		command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
		" Add (Neo)Vim's native statusline support.
		" NOTE: Please see `:h coc-status` for integrations with external plugins that
		" provide custom statusline: lightline.vim, vim-airline.
		set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}"
		" Mappings for CoCList
		" Show all diagnostics.
		nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
		" Manage extensions. -- la omitimos y la ocupamos para el explorer
		" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
		" Show commands.
		"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
		" Find symbol of current document.
		nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
		" Search workspace symbols.
		nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
		" Do default action for next item.
		nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
		" Do default action for previous item.
		nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
		" Resume latest coc list.
		nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

if exists("g:neovide")
	set guifont=CaskaydiaCove\ Nerd\ Font:h12
endif
