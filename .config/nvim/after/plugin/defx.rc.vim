if !exists('g:loaded_defx') | finish | endif

" Define mappings
let g:history = []
function! SearchNode()
 " silence the cmd if test passed
 let list = split(expand('%:p'), '/')
 let index = 0
 let length = len(list)
 let g:defx_win = 0

 if win_gotoid(g:term_win)
    let g:term_win = 0 
    echo g:term_win
    hide 
 else 
   Defx
   let g:term_win = win_getid()
   let paths = []

   for p in reverse(list) 
      let index += 1
      let currentDirFullPath = '/' . join(reverse(list[index:length-1]), '/')
      let gitDir = currentDirFullPath . '/.git' 
      if index == 1
        let dir = p
        call add(paths, dir)
      else 
        let dir = p . '\/'
        call add(paths, dir)
      endif
      if isdirectory(gitDir)
        break
      else
        continue
      endif
   endfor
   for c in reverse(paths)
      execute "/" . c
      normal o
   endfor
   echo paths
 endif

endfunction
nnoremap <C-e> :call SearchNode()<CR>
nnoremap <silent><localleader>e :<C-u>Defx -toggle -listed -resume
      \ -columns=indent:mark:icon:icons:filename:git:size
      \ -buffer-name=defx
      \ `expand('%:p:h')` -search=`expand('%:p')`<CR>

autocmd VimEnter * call s:setAsDefaultFileExplorer()
  function! s:setAsDefaultFileExplorer() 
     if &filetype == 'netrw'
        Defx -toggle -columns=indent:mark:icon:icons:filename:git:size<CR>
        setlocal nonumber
        only
     endif
  endfunction
autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	  " Define mappings
    setlocal nonumber
    nnoremap <silent><buffer><expr> <CR>
    \ defx#is_directory() ? defx#do_action('open_or_close_tree') :
    \ defx#do_action('multi', [['drop']])
    nnoremap <silent><buffer><expr> v
    \ defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
    nnoremap <silent><buffer><expr> <Space>
    \ defx#do_action('multi', [['drop', 'split'], 'quit'])
	  nnoremap <silent><buffer><expr> o
    \	defx#do_action('open_or_close_tree', 'nested')
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
	  nnoremap <silent><buffer><expr> f
	  \ defx#do_action('execute_command', 'open .')
	  nnoremap <silent><buffer><expr> a
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> R
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
    nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	endfunction

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })

call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : 'M',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })

call defx#custom#option('_', {
      \ 'winwidth': 40,
      \ 'split': 'vertical',
      \ 'direction': 'botright',
      \ 'show_ignored_files': 1,
      \ 'buffer_name': '',
      \ })
