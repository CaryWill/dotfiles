local status, plugin = pcall(require, "ts_context_commentstring")
if (not status) then return end

plugin.setup {}