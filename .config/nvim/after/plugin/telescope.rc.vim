if !exists('g:loaded_telescope') | finish | endif

lua << EOF
local telescope = require('telescope')
local actions = require('telescope.actions')
local trouble = require("trouble.providers.telescope")

telescope.setup{
  defaults = {
    file_ignore_patterns = { ".git/", "node_modules/", ".node/", ".vscode/", ".husky/", "package-lock.json", "yarn.lock" },
    mappings = {
      n = {
        ["q"] = actions.close,
        -- ["<c-t>"] = trouble.open_with_trouble
      },
      i = {
        ["<C-s>"] = actions.file_split,
        ["<C-v>"] = actions.file_vsplit,
        ["<C-t>"] = actions.file_tab,
        -- ["<c-t>"] = trouble.open_with_trouble
      }
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
    },
  },
}
EOF
