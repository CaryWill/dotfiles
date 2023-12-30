local status, telekasten = pcall(require, "telekasten")
if not status then
	return
end

local icloud_org_dir_path = "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/"
local home = vim.fn.expand(icloud_org_dir_path .. "zettelkasten")
require("telekasten").setup({
	home = home,
	extension = ".org",
	templates = home .. "/" .. "templates",
	template_new_note = home .. "/" .. "templates/template_new_note.org",
	plug_into_calendar = true,
	calendar_opts = {
		-- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
		weeknm = 4,
		-- use monday as first day of week: 1 .. true, 0 .. false
		calendar_monday = 1,
		-- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
		calendar_mark = "left-fit",
	},
	auto_set_filetype = false,
})

-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")

-- Most used functions
vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")

-- Call insert link automatically when we start typing a link
-- vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")
vim.keymap.set("n", "<leader>il", "<cmd>Telekasten insert_link<CR>")
