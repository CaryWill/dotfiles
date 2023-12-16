local status, telescope = pcall(require, "telescope")
if (not status) then return end

local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    file_ignore_patterns = { ".git/", "node_modules/", ".node/", ".vscode/", ".husky/", "package-lock.json", "yarn.lock" },
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
      -- preview_width = 0.5
    },
    -- https://github.com/BurntSushi/ripgrep/issues/299#issuecomment-270102901
    -- search ( instead of \( when searching
    vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--line-number', '--column', '--smart-case', '--fixed-strings', '--hidden' },
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
      undo = {},
      harpoon = {},
      frecency = {
        show_scores = true,
        disable_devicons = true
      },
      recent_files = {
        only_cwd = true
      }
    }
  }
}

telescope.load_extension('fzf')
telescope.load_extension('harpoon')
telescope.load_extension("undo")
telescope.load_extension("frecency")
-- telescope.load_extension("recent_files")

vim.keymap.set("n", "<leader><leader>", "<Cmd>Telescope frecency workspace=CWD<CR>")
-- vim.keymap.set("n", "<leader><leader>", "<Cmd>lua require('telescope').extensions.recent_files.pick()<CR>")
