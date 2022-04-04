colorscheme spring-night
set background=dark

set laststatus=2
let g:airline_theme="spring_night"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if (has("termguicolors"))
  set termguicolors
  let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"
endif