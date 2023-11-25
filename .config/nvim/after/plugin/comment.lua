require('mini.comment').setup {
  options = {
    custom_commentstring = function()
      return vim.bo.commentstring
      -- return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
    end,
  },
}
