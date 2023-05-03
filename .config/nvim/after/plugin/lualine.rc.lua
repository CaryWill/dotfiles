local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup {
  options = {
    section_separators = {left = '', right = ''},
    component_separators = {left = '', right = ''},
    disabled_filetypes = {},
    icons_enabled = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{
      'filename', file_status = true, path = 1, newfile_status = true,
    }},
    lualine_x = {'encoding', 'filetype'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_z = { 'filetype' },
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'fugitive'}
}
