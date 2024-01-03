local status, ls = pcall(require, "luasnip")
if not status then
	return
end

vim.keymap.set({ "i" }, "<C-K>", function()
	ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
	ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

-- using all html snippets in react files
-- https://github.com/rafamadriz/friendly-snippets/issues/31
require("luasnip").filetype_extend("javascriptreact", { "html" })
require("luasnip").filetype_extend("typescriptreact", { "html" })
-- since legacy react files are in .js extension
require("luasnip").filetype_extend("javascript", { "javascriptreact" })
require("luasnip").filetype_extend("typescript", { "javascriptreact" })

-- https://github.com/rafamadriz/friendly-snippets/wiki/Javascript,-Typescript,-Javascriptreact,-Typescriptreact
-- load pre defined snippets
require("luasnip.loaders.from_vscode").lazy_load()
-- local snippet_dir = vim.fn.fnamemodify(vim.env.MYVIMRC, ":p:h") .. "/snippets"
-- require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets" })

local snippet = ls.snippet
local text = ls.text

-- Register the snippet
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

-- tutorial
-- https://sbulav.github.io/vim/neovim-setting-up-luasnip/
ls.add_snippets(nil, {
	all = {
		snip({
			trig = "icg",
			name = "icloud image path for org",
		}, {
			text("[[~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/assets/"),
			insert(1),
			text("]]"),
		}),
	},
})

ls.add_snippets(nil, {
	all = {
		snip({
			trig = "ocg",
			name = "org image path",
		}, {
			text("~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/assets/"),
			insert(1),
		}),
	},
})
