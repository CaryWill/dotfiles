" :help airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='spring_night'
" let g:airline#extensions#tabline#formatter = 'default'
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline_right_sep=' '
" let g:airline_left_sep=' '
" let w:airline_skip_empty_sections = 1
" let airline#extensions#tabline#tabs_label = ''
" let airline#extensions#tabline#show_splits = 0
" let g:airline#extensions#tabline#left_alt_sep = '>'
" let g:airline_section_z='' "隐藏光标的当前所在位置
" let g:airline_skip_empty_sections = 1 " remove separators for empty sections

" 默认使用 256 色
if (has('termguicolors'))
  " set termguicolors
  " let &t_8f = '\<esc>[38;2;%lu;%lu;%lum' " 文字色
  " let &t_8b = '\<esc>[48;2;%lu;%lu;%lum' " 背景色
endif

" https://www.ditig.com/256-colors-cheat-sheet 256颜色表
colorscheme spring-night
hi CocUnusedHighlight ctermbg=NONE ctermfg=245 guibg=NONE guifg=#8a9199
hi VertSplit guibg=#63707e guifg=#162131 ctermfg=233 ctermbg=233
" set background=dark
" hi LineNr guibg=#162131
" hi SignColumn guibg=#162131
" hi CocWarningSign ctermfg=130 guifg=#f0e9aa
" hi CocInfoSign    ctermfg=11 guifg=#f1a98a
" hi CocHintSign    ctermfg=12 guifg=#a0c8e1
