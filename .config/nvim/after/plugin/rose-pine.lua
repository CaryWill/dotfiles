local status, plugin = pcall(require, "rose-pine")
if (not status) then return end

plugin.setup({
  --- @usage 'auto'|'main'|'moon'|'dawn'
  variant = 'dawn',
  --- @usage 'main'|'moon'|'dawn'
  dark_variant = 'dawn',
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = false,
  disable_float_background = false,
  disable_italics = false,

  --- @usage string hex value or named color from rosepinetheme.com/palette
  groups = {
  },

  -- Change specific vim highlight groups
  -- https://github.com/rose-pine/neovim/wiki/Recipes
  highlight_groups = {
  }
})
