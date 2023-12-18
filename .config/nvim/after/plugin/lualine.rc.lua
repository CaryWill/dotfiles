local status, plugin = pcall(require, "lualine")
if (not status) then
  return
end

plugin.setup({
  options = {
    -- disabled_filetypes = { 'packer', 'NVimTree', "sagaoutline", "neo-tree" },
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "filename" },
    lualine_c = {
      "diagnostics",
    },
    lualine_x = {
    },
    lualine_y = {
    },
    lualine_z = {
      "filetype"
    },
  },
})
