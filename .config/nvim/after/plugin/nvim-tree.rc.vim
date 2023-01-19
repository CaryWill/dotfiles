lua << EOF

local status, nvimTree= pcall(require, "nvim-tree")
if (not status) then return end

nvimTree.setup({
  view = { 
    mappings = {
      list = {
          -- add keymapping
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
          { key = "ff", action = "live_filter" },
          -- remove keymapping
          { key = "-", action = "" },
          { key = "+", action = "" },
          { key = "=", action = "" },
          { key = "I", action = "" },
          { key = "<C-x>", action = "" },
          { key = "x", action = "" },
          { key = "s", action = "" },
          { key = "gy", action = "" },
          { key = "f", action = "" },
        }
      }
    },
  renderer = {
    icons = {
      glyphs = {
        git = {
          unstaged = "M",
          staged = "A",
          unmerged = "=",
          renamed = "R",
          untracked = "U",
          deleted = "D",
          ignored = "I",
        },
        }
      } 
    }
  })
EOF

nnoremap <silent>fi :NvimTreeFindFileToggle<CR>
autocmd FileType NvimTree nnoremap <buffer> + :NvimTreeResize +20<CR>
autocmd FileType NvimTree nnoremap <buffer> - :NvimTreeResize -20<CR>
autocmd FileType NvimTree nnoremap <buffer> = :NvimTreeResize 30<CR>
