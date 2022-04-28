autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx 
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx 

let g:NERDSpaceDelims = 1
let g:NERDToggleCheckAllLines = 1

" 单行使用 left，多行使用 leftAlt（alt 是 alternate 的意思）
let g:NERDCustomDelimiters = {
      \ 'typescript.tsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
      \ 'javascript.jsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\ }
