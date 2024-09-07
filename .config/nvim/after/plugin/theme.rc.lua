local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
  -- update_interval = 1000 * 60,
  update_interval = 1000,
  set_dark_mode = function()
    vim.api.nvim_set_option_value('background', 'dark', {})
    vim.cmd('colorscheme rose-pine-moon')
    -- kitty
    local job = require("plenary.job")
    job:new({
      command = "kitty",
      args = { "+kitten", "themes", "--reload-in", "all", "Rosé Pine Moon" },
    }):start()
  end,
  set_light_mode = function()
    vim.api.nvim_set_option_value('background', 'light', {})
    vim.cmd('colorscheme rose-pine-dawn')

    -- kitty
    local job = require("plenary.job")
    job:new({
      command = "kitty",
      args = { "+kitten", "themes", "--reload-in", "all", "Rosé Pine Dawn" },
    }):start()
  end,
})
