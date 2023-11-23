local status, plugin = pcall(require, "toggleterm")
if (not status) then return end

plugin.setup({
  close_on_exit = false,
  persist_size = true,
  persist_mode = true,
})
