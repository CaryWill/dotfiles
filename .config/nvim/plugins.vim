let g:plug_home = stdpath('data') . '/plugged'
let g:coc_global_extensions = ['coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-imselect', 'coc-git']
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

let NERDTreeShowHidden = 1
let g:NERDTreeWinPos = 'right'
let NERDTreeMinimalMenu=1
let NERDTreeDirArrowExpandable = " "
let NERDTreeDirArrowCollapsible = " "
let g:NERDSpaceDelims = 1
let NERDTreeHighlightCursorline=0
let g:NERDCustomDelimiters = {
  \ 'typescript.tsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
  \ 'javascript.jsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
  \ }
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

" vim: set foldmethod=marker foldlevel=0 foldenable:
