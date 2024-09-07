local status, plugin = pcall(require, "bufferline")
if not status then
  return
end

plugin.setup({
  options = {
    -- groups = {
    --   items = {
    --     require('bufferline.groups').builtin.pinned:with({ icon = "" })
    --   }
    -- },

    show_duplicate_prefix = true,
    -- close_command = function(n)
    --   require("mini.bufremove").delete(n, false)
    -- end,
    -- right_mouse_command = function(n)
    --   require("mini.bufremove").delete(n, false)
    -- end,
    diagnostics = "nvim_lsp",
    always_show_bufferline = true,
    offsets = {
      {
        -- filetype = "NvimTree",
        filetype = "neo-tree",
        text = "File-explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    hover = {
      enabled = true,
      delay = 100,
      -- reveal = { "close" },
    },
    indicator = {
      style = "underline",
    },
    numbers = function(opts)
      return string.format("%s", opts.raise(opts.ordinal))
    end,
    mode = "tabs",
    truncate_names = false,
    max_prefix_length = 100,
    max_name_length = 100,
    show_buffer_icons = false,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = false,

    -- 缩写
    --[[
    name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match("%.md") then
        return vim.fn.fnamemodify(buf.name, ":t:r")
      end
      -- Use the file's full path and modify it as you like
      local parent_folder = vim.fn.fnamemodify(buf.path, ":p:h:t")
      local filename = vim.fn.fnamemodify(buf.path, ":t")
      return parent_folder .. "/" .. filename -- includes only the direct parent and filename
    end,
   --]]
  },
})
