local status, plugin = pcall(require, "eagle")
if (not status) then return end

plugin.setup({
  -- override the default values found in config.lua
})

-- make sure mousemoveevent is enabled
vim.o.mousemoveevent = true
