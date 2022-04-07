"Common(airline)
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
set guioptions-=r               " remove right-hand scroll bar
set guioptions-=l               " remove left-hand scroll bar
set guioptions-=L               " remove left-hand scroll bar even if there is a vertical split
set guioptions-=b               " remove bottom scroll bar

"--- Spring-night theme ---
if (has('termguicolors'))
  set termguicolors
  let &t_8f = '\<esc>[38;2;%lu;%lu;%lum'
  let &t_8b = '\<esc>[48;2;%lu;%lu;%lum'
endif

colorscheme spring-night
set background=dark
let g:airline_theme="spring_night"
set termguicolors
hi LineNr guibg=#162131
hi SignColumn guibg=#162131
hi! VertSplit guibg=#63707e guifg=#162131
"--- end ---

"--- Jellybeans theme ---
" colorscheme jellybeans
" set background=dark
" let g:jellybeans_overrides = {
" \    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
" \              'ctermfg': 'Black', 'ctermbg': 'Yellow',
" \              'attr': 'bold' },
" \    'Comment': { 'guifg': 'cccccc' },
" \    'background': { 'guibg': '000000' },
" \}

" let g:jellybeans_overrides = {
" \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
" \}
" if has('termguicolors') && &termguicolors
"     let g:jellybeans_overrides['background']['guibg'] = 'none'
" endif
" --- end ---

"--- Seoul256 theme ---
" let g:airline_theme="seoul256"
" function! IsHexColorLight(color) abort
"   let l:raw_color = trim(a:color, '#')

"   let l:red = str2nr(substitute(l:raw_color, '(.{2}).{4}', '1', 'g'), 16)
"   let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
"   let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)

"   let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000

"   return l:brightness > 155
" endfunction
" set background=dark
" colorscheme seoul256

"--- lucario theme ---
" let g:airline_theme="lucario"
" syntax enable
" set number
" colorscheme lucario

"--- nord theme ---
"colorscheme nord
"set background=dark
"let g:airline_theme="nord"

"--- github theme ---
" colorscheme github_dark_default
" set background=dark

"--- gruvbox ---
" colorscheme gruvbox
" set background=dark
" let g:airline_theme="gruvbox"

"--- spaceduck ---
"colorscheme spaceduck
"set background=dark

"--- everforest ---
"set background=dark
"colorscheme everforest