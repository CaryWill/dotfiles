if !exists('g:loaded_fzf') | finish | endif


let $BAT_THEME="zenburn" "use `bat --list-themes` to get theme list, Change fzf preview window theme
let $FZF_DEFAULT_COMMAND='rg --files' " tell FZF to use ripgrep, ripgrep will respect gitignore file

"不匹配文件名
command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always --case-sensitive '
  \.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --case-sensitive -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <silent> ;f :Files<CR>
"Exact finder
nnoremap <silent> ;R :RG<CR>
"fuzzy finder
nnoremap <silent> ;r :Rg<CR>

" CTRL-A CTRL-Q to select all and build quickfix list
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

" CTRL-A CTRL-Q to select all and build quickfix list
" 使用 Rg 来 build vim 的 quickfix list
" 直接使用 vimgrep 的话，直接卡死，估计是因为 node_module 文件太多
"https://github.com/junegunn/fzf.vim/issues/185#issuecomment-322120216
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"https://github.com/junegunn/fzf.vim/issues/358#issuecomment-841665170
"https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
"https://github.com/junegunn/fzf.vim/issues/185#issuecomment-322120216
"其他额外的参数可以通过跑 `man fzf` 看到
let $FZF_DEFAULT_OPTS="--bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down --bind ctrl-a:select-all --preview-window border-left"

let g:fzf_layout = { 'down': '45%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
