local status, plugin = pcall(require, "lspsaga")
if not status then
	return
end

plugin.setup({
	ui = {
		winblend = 10,
		border = "rounded",
		code_action = "",
		actionfix = "💡  ",
		devicon = false,
	},
	symbol_in_winbar = {
		enable = false,
	},
	diagnostic = {
		show_code_action = false,
		extend_relatedInformation = true,
	},
	outline = {
		auto_preview = false,
	},
})

-- diagnostics navigation
vim.keymap.set("n", "[e", function()
	-- require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
	require("lspsaga.diagnostic"):goto_prev()
end)
vim.keymap.set("n", "]e", function()
	-- require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
	require("lspsaga.diagnostic"):goto_next()
end)

-- code action
-- grammarly can use it to do a auto correct, or eslint,...
vim.keymap.set({ "n", "v" }, "<leader>a", "<cmd>Lspsaga code_action<CR>")
-- vim.keymap.set({ "n", "v" }, "<leader>o", "<cmd>Lspsaga outline<CR>")
