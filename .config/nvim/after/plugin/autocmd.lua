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
-- vim.cmd([[
--   augroup org
--     autocmd!
--   augroup END
-- ]])

-- autocmd FileType org setlocal foldenable
-- autocmd FileType org setlocal foldmethod=expr
-- autocmd FileType org setlocal foldexpr=nvim_treesitter#foldexpr()
-- autocmd FileType org setlocal foldmethod=expr
-- autocmd FileType org setlocal foldexpr=nvim_treesitter#foldexpr()
-- autocmd FileType org setlocal noai nocin nosi inde=
-- autocmd FileType org setlocal concealcursor=nc
-- tocmd FileType org setlocal conceallevel=2

-- orgmode hack, i use nvim-tree, but if disable or hijack the
-- netrw tree, then <leader>oo open link will not work
-- autocmd FileType netrw lua vim.cmd('NvimTreeToggle')

-- vim.api.nvim_exec(
-- 	[[
--     autocmd FileType netrw lua vim.cmd(':new | :only')
--   ]],
-- 	false
-- )
-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	pattern = "*",
-- 	command = "NvimTreeToggle",
-- })

-- disable autopairs for org file(need to work with telekasten)
-- vim.api.nvim_exec(
-- 	[[
--     autocmd FileType org lua vim.b.minipairs_disable = true
--   ]],
-- 	false
-- )

-- from here
-- https://neovim.discourse.group/t/a-lua-based-auto-refresh-buffers-when-they-change-on-disk-function/2482/3
-- https://gitlab.com/jokeyrhyme/dotfiles/-/blob/main/config/nvim/init.lua#L5-11
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})
