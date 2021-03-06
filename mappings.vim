" VSCode keymap for Visual Block
noremap <A-LeftMouse>	<A-RightMouse>
noremap <A-LeftDrag>	<A-RightDrag>
noremap <A-LeftRelease>	<A-RightRelease>

" Ctrl-S for save
noremap  <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>gv
inoremap <C-S> <ESC>:update<CR><right>

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
vnoremap <BS> d

" Auto-close bracket
" inoremap " ""<left> " conflict with vimscript comment
" inoremap ' ''<left> " conflict with rust lifetime annotation
inoremap < <><left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

if dein#tap('vim-gitgutter')
	nmap <silent> <Leader>x :set opfunc=CleanUp<CR>g@
	nmap <silent> ]h :call NextHunkAllBuffers()<CR>
	nmap <silent> [h :call PrevHunkAllBuffers()<CR>
endif

if dein#tap('skim.vim')
	nmap <C-p>          :Files<CR>
	nmap <Leader><Tab>  :Windows<CR>
	nmap <C-f>          :Rg<CR>
	nmap <Leader>f      :Lines<CR>
endif

if dein#tap('vim-lsc')
	let g:lsc_auto_map = {
				\ 'defaults': v:true,
				\ 'NextReference': '<C-j>',
				\ 'PreviousReference': '<C-k>',
				\ 'GoToDefinition': 'gd',
				\ 'GoToDefinitionSplit': 'gD',
				\ 'Rename': '<F2>',
				\ 'FindCodeActions': '<F5>',
				\ }

	if dein#tap('VimCompletesMe')
		let g:lsc_auto_map.Completion = 'omnifunc'
		autocmd FileType * let b:vcm_tab_complete = "omni"
	endif
endif

map <F7> gg=G<C-o><C-o>
if dein#tap('neoformat')
	map <A-F7> :Neoformat<CR>
endif

" vim: set foldmethod=indent ts=2 sw=2 tw=80 noet :
