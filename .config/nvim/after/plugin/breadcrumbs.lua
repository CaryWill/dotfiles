local status, plugin = pcall(require, "barbecue")
if (not status) then return end

-- triggers CursorHold event faster
vim.opt.updatetime = 200

plugin.setup({
  -- neovim built-in terminal have "" type(notype)
  exclude_filetypes = { "" },
})

vim.api.nvim_create_autocmd({
  "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",
  -- include this if you have set `show_modified` to `true`
  "BufModifiedSet",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end,
})
