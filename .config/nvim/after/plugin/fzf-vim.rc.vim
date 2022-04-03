if !exists('g:loaded_fzf') | finish | endif

nnoremap <silent> ;f :Files<CR>
nnoremap <silent> ;r :Rg<CR>

"https://github.com/junegunn/fzf.vim/issues/358#issuecomment-841665170
"https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
let $FZF_DEFAULT_OPTS="--bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down"

"tell FZF to use ripgrep
"ripgrep will respect gitignore file
let $FZF_DEFAULT_COMMAND='rg --files'

"不匹配文件名
command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '
  \.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

"We can tell Vim to use ripgrep instead of grep
"set grepprg=rg\ --vimgrep\ --smart-case\ --follow
