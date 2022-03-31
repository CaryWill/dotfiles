"search for files that is not in .gitignore file
nnoremap <silent> ;f :GFiles<CR>
nnoremap <silent> ;r :Rg<CR>

"https://github.com/junegunn/fzf.vim/issues/358#issuecomment-841665170
let $FZF_DEFAULT_OPTS="--preview-window 'right:57%' --preview 'bat --style=numbers --line-range :300 {}'
\ --bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down"