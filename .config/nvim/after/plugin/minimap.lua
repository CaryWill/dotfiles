local status, plugin = pcall(require, "codewindow")

if not status then
  return
end

plugin.setup({
  auto_enable = true,
  minimap_width = 4,
  screen_bounds = 'background',
  window_border = 'none',
  width_multiplier = '15'
})
plugin.apply_default_keybinds()
