local status, tsj = pcall(require, "treesj")
if (not status) then return end

tsj.setup({
	check_syntax_error = true,
	cursor_behavior = "hold",
	notify = true,
	dot_repeat = true,
	on_error = nil,
	use_default_keymaps = false,
	max_join_length = 200,
})
vim.keymap.set("n", "gS", ":TSJSplit<CR>", { silent = true })
vim.keymap.set("n", "gJ", ":TSJJoin<CR>", { silent = true })
