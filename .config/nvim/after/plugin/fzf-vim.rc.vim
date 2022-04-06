if !exists('g:loaded_fzf') | finish | endif
"https://github.com/junegunn/fzf.vim/issues/358#issuecomment-841665170
"https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
let $FZF_DEFAULT_OPTS="--bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down"

"tell FZF to use ripgrep
"ripgrep will respect gitignore file
let $FZF_DEFAULT_COMMAND='rg --files'

"不匹配文件名
command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always --case-sensitive '
  \.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

"We can tell Vim to use ripgrep instead of grep
"set grepprg=rg\ --vimgrep\ --smart-case\ --follow

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
nnoremap <silent> ;r :RG<CR>
"fuzzy finder
"nnoremap <silent> ;r :Rg<CR>