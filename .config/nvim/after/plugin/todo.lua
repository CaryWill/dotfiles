local status, plugin = pcall(require, "todo-comments")
if not status then
	return
end

plugin.setup({
	signs = false,
	highlight = {
		exclude = { "org" },
	},
})
