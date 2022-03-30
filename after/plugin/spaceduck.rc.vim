try 
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif

  colorscheme spaceduck

  " 修改注解和选中的时候的颜色
  " 可以使用 `:hi` 命令查看所有的颜色
  "
  "hi Visual    ctermfg=0 ctermbg=11 guifg=BLACK guibg=YELLOW
  hi TabLineSel  ctermfg=0 ctermbg=102 guifg=#000000 guibg=#818596
  hi TabLine  ctermfg=251 ctermbg=233 guifg=#c1c3cc guibg=#0f111b
  hi TabLineFill  ctermfg=102 ctermbg=0 guifg=#818596 guibg=#000000
  catch
endtry