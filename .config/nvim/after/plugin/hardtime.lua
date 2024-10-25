local status, plugin = pcall(require, "hardtime")
if not status then
	return
end

require("hardtime").setup({
	disable_mouse = false,
	disabled_keys = {
		["<Up>"] = { "", "i" },
		["<Down>"] = { "", "i" },
		["<Left>"] = { "", "i" },
		["<Right>"] = { "", "i" },
	},
	-- restriction_mode = "hint",
})
