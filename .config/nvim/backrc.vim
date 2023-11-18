let mapleader = ' '
let maplocalleader = ','

" --- Airline ---
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#hunks#coc_git = 1
let g:airline_skip_empty_sections = 1
let g:airline_section_z=''
let g:airline_section_y=''
let g:airline_section_c = '%f'
" --- ale ---
let g:ale_echo_msg_format = '[%linter%] [%severity%] %code%: %s'
let g:airline#extensions#ale#enabled = 1
let g:ale_disable_lsp = 0
let g:ale_set_highlights = 0
let g:ale_floating_preview = 1
let g:ale_sign_highlight_linenrs = 1
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'javascriptreact': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\   'json': ['prettier', 'eslint'],
\   'less': ['prettier', 'stylelint'],
\   'css': ['prettier', 'stylelint'],
\}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
nnoremap <silent> K :ALEDetail<CR>

" --- NERDTree ---
nnoremap <silent>fi :NERDTreeFind<CR>
map ;e :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 30
autocmd FileType nerdtree nnoremap <buffer> + :vertical resize +20<CR>
autocmd FileType nerdtree nnoremap <buffer> - :vertical resize -20<CR>
autocmd FileType nerdtree nnoremap <buffer> = :vertical resize 30<CR>

" --- NERDTree git icon ---
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  :'M',
    \ 'Staged'    :'A',
    \ 'Untracked' :'U',
    \ 'Renamed'   :'R',
    \ 'Unmerged'  :'═',
    \ 'Deleted'   :'D',
    \ 'Dirty'     :'x',
    \ 'Ignored'   :'☒',
    \ 'Clean'     :'O',
    \ 'Unknown'   :'?',
    \ }