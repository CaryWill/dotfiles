local status, pantran = pcall(require, "pantran")
if not status then
	return
end
require("pantran").setup({
	-- Default engine to use for translation. To list valid engine names run
	-- `:lua =vim.tbl_keys(require("pantran.engines"))`.
	default_engine = "google",
	-- Configuration for individual engines goes here.
	engines = {
		google = {
			-- Default languages can be defined on a per engine basis. In this case
			-- `:lua require("pantran.async").run(function()
			-- vim.pretty_print(require("pantran.engines").yandex:languages()) end)`
			-- can be used to list available language identifiers.
			default_source = "auto",
			default_target = "en",
		},
	},
})

local opts = { noremap = true, silent = true, expr = true }
vim.keymap.set("n", "<leader>tr", pantran.motion_translate, opts)
vim.keymap.set("n", "<leader>trr", function()
	return pantran.motion_translate() .. "_"
end, opts)
vim.keymap.set("x", "<leader>tr", pantran.motion_translate, opts)
