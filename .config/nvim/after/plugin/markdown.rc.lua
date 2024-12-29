local status, plugin = pcall(require, "render-markdown")
if not status then
  return
end

plugin.setup({})
