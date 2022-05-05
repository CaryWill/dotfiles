map <C-e> :NERDTreeToggle<CR>
map <localleader>e :NERDTreeFind<CR>

let NERDTreeShowHidden = 1
let g:NERDTreeWinPos = 'right'
let NERDTreeMinimalMenu=1
let NERDTreeDirArrowExpandable = " "
let NERDTreeDirArrowCollapsible = " "
let NERDTreeIgnore = ['\.swp$', '^\.git$', '^\.svn$', '^\.DS_Store$']

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
