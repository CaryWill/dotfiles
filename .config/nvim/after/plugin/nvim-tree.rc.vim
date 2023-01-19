lua << EOF

local status, nvimTree= pcall(require, "nvim-tree")
if (not status) then return end

nvimTree.setup({
  view = { 
    mappings = {
      list = {
          { key = "<C-s>", action = "split" },
          { key = "<C-v>", action = "vsplit" },
          { key = "<C-t>", action = "tabnew" },
          { key = "d", action = "cd" },
          { key = "u", action = "dir_up" },
          { key = "D", action = "trash" },
          { key = "m", action = "cut" },
          { key = "p", action = "paste" },
          { key = "r", action = "rename" },
          { key = "c", action = "copy" },
          { key = "o", action = "system_open" },
          { key = "a", action = "create" },
          { key = "y", action = "copy_absolute_path" },
          { key = "R", action = "refresh" },
          { key = ".", action = "toggle_dotfiles" },
          { key = ".", action = "toggle_dotfiles" },
        }
      }
    }
  })
EOF

nnoremap <silent><localleader>e :NvimTreeFindFileToggle<CR>
