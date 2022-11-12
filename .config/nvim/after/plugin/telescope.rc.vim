if !exists('g:loaded_telescope') | finish | endif

nnoremap ;f <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap ;g <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap ;r <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap ;s <cmd>lua require('telescope.builtin').grep_string()<CR>
nnoremap ;h <cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap ;e <cmd>lua require('telescope.builtin').diagnostics()<CR>
"lsp
nnoremap gD <cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>
nnoremap gi <cmd>lua require('telescope.builtin').lsp_implementations()<CR>
nnoremap gd <cmd>lua require('telescope.builtin').lsp_definitions()<CR>
nnoremap gr <cmd>lua require('telescope.builtin').lsp_references()<CR>
"git
nnoremap gc <cmd>lua require('telescope.builtin').git_commits()<CR>
nnoremap gbc <cmd>lua require('telescope.builtin').git_bcommits()<CR>
nnoremap gs <cmd>lua require('telescope.builtin').git_status()<CR>
"nnoremap gs <cmd>lua require('telescope.builtin').git_stash()<CR>
"nnoremap gb <cmd>lua require('telescope.builtin').git_branches()<CR>

nmap <C-s> <M-q>

lua << EOF
-- https://github.com/nvim-telescope/telescope.nvim/issues/1173#issue-980918591
-- https://stackoverflow.com/a/69923907/10190407
-- https://stackoverflow.com/a/68571133/10190407

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    file_ignore_patterns = { ".git/", "node_modules/", ".node/", ".vscode/", ".husky/" },
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--line-number',
      '--column',
      '--smart-case',
--      '--with-filename',
--      '-uu', -- search in hidden files 
--      '--hidden', -- search in hidden files
    },
--    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
  },
}
EOF
