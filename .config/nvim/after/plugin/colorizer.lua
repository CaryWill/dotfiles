local status, plugin = pcall(require, "colorizer")
if (not status) then return end

plugin.setup()
