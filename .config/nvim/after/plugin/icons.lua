local status, plugin = pcall(require, "nvim-web-devicons")
if (not status) then return end

plugin.setup{}