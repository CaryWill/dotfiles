colorscheme spring-night

if (has('termguicolors'))
  set termguicolors
  let &t_8f = '\<esc>[38;2;%lu;%lu;%lum' " 文字色
  let &t_8b = '\<esc>[48;2;%lu;%lu;%lum' " 背景色
endif

" let g:airline#extensions#coc#enabled = 1
" let g:airline#extensions#hunks#coc_git = 1
let g:airline_theme='spring_night'
let g:airline_right_sep=' '
let g:airline_left_sep=' '
let w:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0 
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0      
let g:airline#extensions#tabline#show_splits = 0       
let g:airline#extensions#tabline#show_tab_nr = 0       
let g:airline#extensions#tabline#show_tab_type = 0     

" hi SignColumn guibg=#162131 ctermbg=233 ctermfg=233
" hi VertSplit guibg=#63707e guifg=#162131 ctermfg=233 ctermbg=250
" hi LineNr guibg=#162131 ctermbg=233 ctermfg=NONE
" hi Tabline cterm=none gui=none
" hi TabLineSel ctermfg=236 ctermbg=222 guifg=#435060 guibg=#fedf81

" hi CocUnusedHighlight ctermbg=NONE ctermfg=245 guibg=NONE guifg=#8a9199
" hi CocWarningSign ctermfg=130 ctermbg=235 guifg=#f0e9aa
" hi CocInfoSign    ctermfg=11 ctermbg=235 guifg=#f1a98a
" hi CocHintSign    ctermfg=12 ctermbg=235 guifg=#a0c8e1
" hi CocErrorSign   ctermbg=235 

" vim: set foldmethod=marker foldlevel=0 foldenable:
