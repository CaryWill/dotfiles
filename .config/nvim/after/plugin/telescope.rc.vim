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
nnoremap ;c <cmd>lua require('telescope.builtin').git_commits()<CR>
nnoremap ;d <cmd>lua require('telescope.builtin').git_bcommits()<CR>
"nnoremap ;s <cmd>lua require('telescope.builtin').git_status()<CR>
"nnoremap gs <cmd>lua require('telescope.builtin').git_stash()<CR>
"nnoremap gb <cmd>lua require('telescope.builtin').git_branches()<CR>

nmap <C-s> <M-q>

lua << EOF
-- https://github.com/nvim-telescope/telescope.nvim/issues/1173#issue-980918591
-- https://stackoverflow.com/a/69923907/10190407
-- https://stackoverflow.com/a/68571133/10190407
-- https://github.com/nvim-telescope/telescope.nvim
-- :h Telescope 看文档配置

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
    layout_config = {
      preview_width = 0.5,
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
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  },
}
require('telescope').load_extension('fzf')
EOF
