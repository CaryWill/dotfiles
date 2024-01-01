local status, plugin = pcall(require, "translate")
if not status then
	return
end

require("translate").setup({
	default = {
		parse_before = "natural",
		command = "google",
		parse_after = "head",
		output = "replace",
	},
})

vim.keymap.set("v", "<leader>gt", ":Translate en<CR>")
