if !exists('g:loaded_fzf') | finish | endif

"Change fzf preview window theme
"https://www.reddit.com/r/neovim/comments/oz1zpe/comment/h7x28c9/?utm_source=share&utm_medium=web2x&context=3
"use `bat --list-themes` to get theme list
let $BAT_THEME="zenburn"

"tell FZF to use ripgrep
"ripgrep will respect gitignore file
let $FZF_DEFAULT_COMMAND='rg --files'

"不匹配文件名
command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always --case-sensitive '
  \.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

"We can tell Vim to use ripgrep instead of grep
set grepprg=rg\ --vimgrep\ --case-sensitive\ --follow

"默认的话 fzf 只有第一次使用 `:Rg yourquery` 命令后才会 popup
"让你基于搜索结果进行筛选，如果直接使用 `;r` popup 的话，fzf 只是 fuzzy finder
"https://github.com/junegunn/fzf.vim#example-advanced-ripgrep-integration
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --case-sensitive -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <silent> ;f :Files<CR>
"nnoremap <silent> ;fg :GFiles<CR>
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
let $FZF_DEFAULT_OPTS="--bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down --bind ctrl-a:select-all"