local status, plugin = pcall(require, "todo-comments")
if not status then
	return
end
-- TODO: test
plugin.setup({
	signs = false,
	highlight = {
		exclude = { "org" },
		keyword = "bg",
	},
})
