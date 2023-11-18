require("bufferline").setup({
  options = {
    close_command = function(n) require("mini.bufremove").delete(n, false) end,
    right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
    diagnostics = "nvim_lsp",
    always_show_bufferline = false,
    offsets = {
      {
        filetype = "neo-tree",
        text = "Neo-tree",
        highlight = "Directory",
        text_align = "left",
      },
    },
    hover = {
      enabled = true,
      delay = 100,
      reveal = { 'close' }
    },
    highlights = {
      buffer_selected = {
        bold = false,
        italic = false,
      },
    },
    indicator = {
      style = 'underline',
    },
    max_name_length = 50,
    numbers = function(opts)
      return string.format('%s', opts.raise(opts.ordinal))
    end,
  },
})
