" :help airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline_section_z='' "隐藏光标的当前所在位置
" remove separators for empty sections
let g:airline_skip_empty_sections = 1
let g:airline_theme='spring_night'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline_right_sep=' '
let g:airline_left_sep=' '
let w:airline_skip_empty_sections = 1
let airline#extensions#tabline#tabs_label = ''
let airline#extensions#tabline#show_splits = 0
" let g:airline#extensions#tabline#left_alt_sep = '|'

if (has('termguicolors'))
  set termguicolors
  let &t_8f = '\<esc>[38;2;%lu;%lu;%lum'
  let &t_8b = '\<esc>[48;2;%lu;%lu;%lum'
endif

colorscheme spring-night
set background=dark
hi LineNr guibg=#162131
hi SignColumn guibg=#162131
hi VertSplit guibg=#63707e guifg=#162131
