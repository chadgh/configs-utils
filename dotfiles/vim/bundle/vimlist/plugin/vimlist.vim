" Autocommands
au! BufNewFile,BufRead *.list  set filetype=list
au BufNewFile,BufRead *.list   normal zR
au BufNewFile,BufRead *.list   set ai formatoptions=cro comments=b:*

" Directory where files live
if !exists('g:vimlist_dir')
	let g:vimlist_dir = '~'
endif

" To disable key mappings, set to let g:vimlist_map_keys = 0
if !exists('g:vimlist_map_keys')
	let g:vimlist_map_keys = 1
endif

" Set the default Vimlist leader (<leader>,)
if !exists('g:vimlist_map_prefix')
	let g:vimlist_map_prefix = '<leader>,'
endif

if g:vimlist_map_keys
	" o = add item to top of current list
	execute "au FileType list" "nnoremap <buffer>" g:vimlist_map_prefix."o" "{/*<CR>:nohl<CR>O"

	" O = add item to end of current list
	execute "au FileType list" "nnoremap <buffer>" g:vimlist_map_prefix."O" "}?*<CR>:nohl<CR>o"

	" g = jump to top of current list
	execute "au FileType list" "nnoremap <buffer>" g:vimlist_map_prefix."g" "{/*<CR>:nohl<CR>"

	" G = jump to bottom of current list
	execute "au FileType list" "nnoremap <buffer>" g:vimlist_map_prefix."G" "}?*<CR>:nohl<CR>"

	" j = jump to first item of next list
	execute "au FileType list" "nnoremap <buffer>" g:vimlist_map_prefix."j" "}jj^"

	" k = jump to first item of last list
	execute "au FileType list" "nnoremap <buffer>" g:vimlist_map_prefix."k" "{{jj^"

	" e = open another list
	execute "au FileType list" "nnoremap <buffer>" g:vimlist_map_prefix."e" ":e <c-r>=g:vimlist_dir<CR>/"

	" <tab> = toggle folding
	execute "au FileType list" "nnoremap <buffer>" "<tab>" "za"
endif
