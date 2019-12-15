" This is the file type plugin file for Go (*.go)
"call minpac#add('https://github.com/vim-syntastic/syntastic', {'type': 'opt'})
call minpac#add('https://github.com/Valloric/YouCompleteMe', {'type': 'opt'})
"call minpac#add('https://github.com/fatih/vim-go', {'type': 'opt'})
"packadd syntastic
packadd YouCompleteMe
"packadd vim-go

" YCM options
let g:ycm_complete_in_strings = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" syntastic options
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_go_checkers = ['golint', 'errcheck']

" use goimports for formatting
"let g:go_fmt_command = "goimports"

" turn highlighting on
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1

" change key for <leader>
" (\ is the default, but ',' is more common, and easier to reach)
"let mapleader=","

" Open go doc in vertical window, horizontal, or tab
"au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
"au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
"au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>

