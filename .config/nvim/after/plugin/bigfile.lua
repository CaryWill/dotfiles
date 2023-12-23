-- default config
local status, plugin = pcall(require, "bigfile")
if (not status) then return end

require("bigfile").setup({
	-- size of the file in MiB, the plugin round file sizes to the closest MiB
	filesize = 1,
	-- autocmd pattern or function see <### Overriding the detection of big files>
	pattern = { "*" },
	features = { -- features to disable
		"indent_blankline",
		"illuminate",
		"lsp",
		"treesitter",
		"syntax",
		"matchparen",
		"vimopts",
		"filetype",
	},
})
