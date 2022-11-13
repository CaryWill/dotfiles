if !exists('g:loaded_telescope') | finish | endif

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
    file_ignore_patterns = { ".git/", "node_modules/", ".node/", ".vscode/", ".husky/", "package-lock.json", "yarn.lock" },
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
}
EOF
