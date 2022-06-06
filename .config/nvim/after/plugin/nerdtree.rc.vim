if !exists('g:loaded_nerd_tree') | finish | endif

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

map <C-e> :NERDTreeToggle<CR>
map <localleader>e :NERDTreeFind<CR>
