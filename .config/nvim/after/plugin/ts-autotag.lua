local status, plugin = pcall(require, "nvim-ts-autotag")
if (not status) then return end

plugin.setup()
