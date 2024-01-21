-- 性能优化参考下面的文章
-- https://www.reddit.com/r/neovim/comments/z85s1l/disable_lsp_for_very_large_files/

-- from here
-- https://neovim.discourse.group/t/a-lua-based-auto-refresh-buffers-when-they-change-on-disk-function/2482/3
-- https://gitlab.com/jokeyrhyme/dotfiles/-/blob/main/config/nvim/init.lua#L5-11
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})
