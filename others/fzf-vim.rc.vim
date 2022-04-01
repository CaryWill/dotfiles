"search for files that is not in .gitignore file
nnoremap <silent> ;f :GFiles<CR>
nnoremap <silent> ;r :Rg <CR>

"https://github.com/junegunn/fzf.vim/issues/358#issuecomment-841665170
let $FZF_DEFAULT_OPTS="--preview-window 'right:57%' --preview 'bat --style=numbers --line-range :300 {}'
\ --bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down"

"不匹配文件名
command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '
  \.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)