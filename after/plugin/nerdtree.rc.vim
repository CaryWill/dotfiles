" using :NERDTree restart NERDTree
map <C-e> :NERDTreeToggle<CR>
map <localleader>e :NERDTreeFind<CR>

let NERDTreeIgnore = ['\.swp$', '^\.git$', '^\.svn$', '^\.DS_Store$']
let NERDTreeMouseMode = 2
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeNodeDelimiter = "\x07"