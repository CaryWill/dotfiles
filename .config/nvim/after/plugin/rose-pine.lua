local status, plugin = pcall(require, "rose-pine")
if not status then
	return
end

plugin.setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = "dawn",
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = "dawn",
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {},

	-- Change specific vim highlight groups
	-- https://github.com/rose-pine/neovim/wiki/Recipes
	highlight_groups = {},
})

-- Lua code for highlight in Neovim
-- diff view
-- DiffviewFilePanel
-- use :Inspect to see the highlight group
-- and it seems like you need to set both fg and bg
-- otherwise it will not work
vim.api.nvim_command("highlight DiffviewStatusUntracked guibg=NONE guifg=#f6c0c0")
vim.api.nvim_command("highlight DiffviewStatusModified guibg=NONE guifg=#f6c0c0")
vim.api.nvim_command("highlight DiffviewFilePanelDeletions guibg=NONE guifg=#f6c0c0")
vim.api.nvim_command("highlight DiffviewFilePanelInsertions guibg=NONE guifg=#f6c0c0")
vim.api.nvim_command("highlight DiffviewStatusAdded guibg=NONE guifg=#f6c0c0")

-- nvim-tree
vim.api.nvim_command("hi NvimTreeBookmark guibg=NONE guifg=#f6c0c0")
vim.api.nvim_command("hi NvimTreeExecFile gui=bold guibg=NONE guifg=#f6c0c0")
vim.api.nvim_command("hi NvimTreeModifiedFile guibg=NONE guifg=#f6c0c0")
vim.api.nvim_command("hi DiffviewStatusDeleted guibg=NONE guifg=#f6c0c0")

-- bufferlnie
vim.api.nvim_command("highlight TabLineSel guifg=#444444 guibg=#e4e4e4 gui=NONE")
vim.api.nvim_command("highlight TabLineFill         guifg=#005f87 guibg=#005f87 gui=NONE")
vim.api.nvim_command("highlight TabLineSel          guifg=#444444 guibg=#e4e4e4 gui=NONE")
