if !exists('g:loaded_defx') | finish | endif

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 1
let g:netrw_banner = 0

nnoremap <silent><C-e> :<C-u>Defx -toggle -listed -resume
  \ -columns=indent:mark:icon:icons:filename:git:size<CR>

" Auto expand parent nodes until root dir "{{{
let s:defx_win = 0
let s:last_win = 0
function s:searchNode()
 let list = split(expand('%:p'), '/')
 let index = 0
 let length = len(list)
 let fallbackRoot = system("pwd")

 if &filetype != 'defx'
  let s:last_win = win_getid()
 endif

 if win_gotoid(s:defx_win)
   let s:defx_win = 0 
   hide 
   call win_gotoid(s:last_win)
 else 
   Defx -resume
   let s:defx_win = win_getid()
   let paths = []

   let shouldBreak = 0
   for p in reverse(list) 
      let index += 1

      " use pwd as root
      let currentDirFullPath = '/' .. join(reverse(list[index:length-1]), '/')

      if shouldBreak
        break
      endif

      if trim(currentDirFullPath) == trim(fallbackRoot)
        let shouldBreak = 1
      endif

      if index == 1
        let dir = p
        call add(paths, dir)
      else 
        let dir = p .. '\/'
        call add(paths, dir)
      endif

   endfor

   for p in reverse(paths)
      silent execute "/" .. p
      normal open_tree
   endfor
 endif
endfunction
nnoremap <silent><localleader>e :call <SID>searchNode()<CR>
"}}}
" Set defx as default file explorer  "{{{
function s:setAsDefaultFileExplorer() 
   if &filetype == 'netrw'
      Defx -toggle -columns=indent:mark:icon:icons:filename:git:size<CR>
      setlocal nonumber
      only
   endif
endfunction
autocmd VimEnter * call s:setAsDefaultFileExplorer()
"}}}
" Reveal in finder "{{{
function s:revealInFinder()
  silent normal P
  let path = @0 
  let dir = path
  if !isdirectory(dir)
    let list = split(dir, '/')
    let dir = '/' .. join(list[0:len(list)-2], '/')
  endif
  silent execute '!open ' .. dir
endfunction
"}}}
" Defx key mappings "{{{
function s:defx_my_settings() abort
  " Define mappings
  setlocal nonumber
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ? defx#do_action('open_or_close_tree') :
  \ defx#do_action('multi', [['drop']])
  nnoremap <silent><buffer><expr> v
  \ defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
  nnoremap <silent><buffer><expr> t
  \ defx#do_action('multi', [['drop', 'tab split'], 'quit'])
  nnoremap <silent><buffer><expr> s
  \ defx#do_action('multi', [['drop', 'split'], 'quit'])
  nnoremap <silent><buffer><expr> o
  \	defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> open_tree
  \	defx#do_action('open_tree')
  nnoremap <silent><buffer><expr> u
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer> f :call <SID>revealInFinder()<CR>
  nnoremap <silent><buffer><expr> a
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> y
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> R
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> <
  \ defx#do_action('resize', defx#get_context().winwidth - 10)
  nnoremap <silent><buffer><expr> >
  \ defx#do_action('resize', defx#get_context().winwidth + 10)
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('print')
endfunction
autocmd FileType defx call s:defx_my_settings()
"}}}

call defx#custom#column('icon', {
  \ 'directory_icon': ' ',
  \ 'opened_icon': ' ',
  \ })

call defx#custom#column('git', 'indicators', {
  \ 'Modified'  :'M',
  \ 'Staged'    :'A',
  \ 'Untracked' :'U',
  \ 'Renamed'   :'R',
  \ 'Unmerged'  :'═',
  \ 'Ignored'   :'☒',
  \ 'Deleted'   :'D',
  \ 'Unknown'   :'?',
  \ })

call defx#custom#option('_', {
  \ 'winwidth': 40,
  \ 'split': 'vertical',
  \ 'direction': 'topleft',
  \ 'show_ignored_files': 1,
  \ 'root_marker': '@'
  \ })

" vim: set foldmethod=marker foldlevel=0 foldenable:
