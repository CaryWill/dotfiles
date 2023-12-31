local status, plugin = pcall(require, "deadcolumn")
if not status then
	return
end

local opts = {
	scope = "line",
	blending = {
		threshold = 0.75,
		colorcode = "#000000",
		hlgroup = {
			"Normal",
			"background",
		},
	},
	warning = {
		alpha = 0.4,
		offset = 0,
		colorcode = "#e4e4e4",
		hlgroup = {
			"Error",
			"background",
		},
	},
}

plugin.setup(opts)
vim.cmd("set colorcolumn=80")
