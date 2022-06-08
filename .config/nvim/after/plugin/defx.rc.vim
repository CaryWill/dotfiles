if !exists('g:loaded_defx') | finish | endif

" Define mappings
map <C-e> :<C-U>Defx -toggle -columns=indent:mark:icon:icons:filename:git:size<CR>
map <silent><localleader>e :<C-u>Defx -toggle -listed -resume
      \ -columns=filename:git
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
    \ defx#is_directory() ? defx#do_action('open') :
    \ defx#do_action('multi', ['drop'])
    nnoremap <silent><buffer><expr> <Space>
    \ defx#do_action('multi', [['drop', 'split'], 'quit'])
    nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_or_close_tree')
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
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:indent:icon:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
    nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
    nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
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
      \ 'toggle': 1,
      \ 'resume': 1
      \ })
