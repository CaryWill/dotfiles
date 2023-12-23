-- 性能优化参考下面的文章
-- https://www.reddit.com/r/neovim/comments/z85s1l/disable_lsp_for_very_large_files/
-- local aug = vim.api.nvim_create_augroup("buf_large", { clear = true })
--[[ vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  -- callback = function()
    -- -- ignore certain file type
    -- local excluded_filetypes = { "neo-tree", "fugitive", "" }
    -- -- TODO: 不知道会不会影响性能计算行数的时候, 不然直接用 filesize 来作为标准好了
    -- if vim.tbl_contains(excluded_filetypes, vim.bo.filetype) then
      -- vim.b.large_buf = false
    -- elseif tonumber(vim.fn.system({ 'wc', '-l', vim.fn.expand('%') }):match('%d+')) > 10000 then
      -- vim.b.large_buf = true
      -- vim.cmd("syntax off")
      -- -- vim.cmd("IlluminatePauseBuf")     -- disable vim-illuminate
      -- -- vim.cmd("IndentBlanklineDisable") -- disable indent-blankline.nvim
      -- -- vim.opt_local.foldmethod = "manual"
      -- vim.opt_local.spell = false
      -- vim.b.miniindentscope_disable = true -- mini indent
    -- else
      -- vim.b.large_buf = false
    -- end
  -- end,
  -- group = aug,
  -- pattern = "*",
 }) --]]

-- org
-- disable auto indent
vim.cmd([[
  augroup org
    autocmd!
    autocmd FileType org setlocal noai nocin nosi inde=
  augroup END
]])

-- autocmd FileType org setlocal concealcursor=nc
-- tocmd FileType org setlocal conceallevel=2
