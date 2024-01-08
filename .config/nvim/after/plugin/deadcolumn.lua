local status, plugin = pcall(require, "deadcolumn")
if not status then
	return
end

local function contains(table, element)
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

local opts = {
	scope = "buffer",
	modes = function(mode)
		if vim.bo.filetype == "org" then
			return true
		else
			return contains({ "i", "ic", "ix", "R", "Rc", "Rx", "Rv", "Rvc", "Rvx" }, mode)
		end
	end,
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
