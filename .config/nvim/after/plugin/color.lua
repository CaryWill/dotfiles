local status, plugin = pcall(require, "nvim-highlight-colors")
if (not status) then return end

plugin.setup({})

