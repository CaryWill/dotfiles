if !exists('g:loaded_telescope') | finish | endif

nnoremap ;f <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap ;g <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap ;r <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap ;s <cmd>lua require('telescope.builtin').grep_string()<CR>
nnoremap ;h <cmd>lua require('telescope.builtin').help_tags()<CR>
nmap <C-s> <M-q>

lua << EOF
local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    -- https://stackoverflow.com/a/69923907/10190407
    -- https://stackoverflow.com/a/68571133/10190407
    file_ignore_patterns = { ".git/", "node_modules/" },
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
    -- https://github.com/nvim-telescope/telescope.nvim/issues/1173#issue-980918591
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-uu', -- search in hidden files 
      '--hidden', -- search in hidden files
    },
  },
}
EOF
