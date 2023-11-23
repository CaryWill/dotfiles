local status, plugin = pcall(require, "telescope")
if (not status) then return end

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
    defaults = {
        file_ignore_patterns = {".git/", "node_modules/", ".node/", ".vscode/", ".husky/", "package-lock.json",
                                "yarn.lock"},
        mappings = {
            n = {
                ["q"] = actions.close
            },
            i = {
                ["<C-s>"] = actions.file_split,
                ["<C-v>"] = actions.file_vsplit,
                ["<C-t>"] = actions.file_tab
            }
        },
        layout_config = {
            preview_width = 0.5
        },
        vimgrep_arguments = {'rg', '--color=never', '--no-heading', '--line-number', '--column', '--smart-case'}
    }
}
