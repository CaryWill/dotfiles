local status, plugin = pcall(require, "fidget")
if not status then
	return
end

plugin.setup({
	progress = {
		ignore = { "ltex" },
	},
})
