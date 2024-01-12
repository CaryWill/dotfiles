local status, plugin = pcall(require, "fidget")
if not status then
	return
end

plugin.setup({
	notification = {
		window = {
			max_width = vim.fn.winwidth(0) / 3,
		},
	},
})
