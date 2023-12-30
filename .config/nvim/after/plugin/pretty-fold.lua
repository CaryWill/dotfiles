local status, plugin = pcall(require, "pretty-fold")
if not status then
	return
end

require("pretty-fold").setup({})
