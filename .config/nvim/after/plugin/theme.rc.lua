local status, plugin = pcall(require, "auto-dark-mode")
if not status then
  return
end

local auto_dark_mode = plugin

function rosedark()
  vim.cmd("colorscheme rose-pine-moon")
  -- kitty
  local job = require("plenary.job")
  job:new({
    command = "kitty",
    args = { "+kitten", "themes", "--reload-in", "all", "Rosé Pine Moon" },
  }):start()
end

function jellybeansdark()
  vim.api.nvim_set_option_value("background", "dark", {})
  vim.cmd("colorscheme jellybeans-nvim")
  -- kitty
  local job = require("plenary.job")
  job:new({
    command = "kitty",
    -- args = { "+kitten", "themes", "--reload-in", "all", "Rosé Pine Moon" },
    args = { "+kitten", "themes", "--reload-in", "all", "Atelier Dune Dark" },
  }):start()
end

function roseLight()
  vim.api.nvim_set_option_value("background", "light", {})
  vim.cmd("colorscheme rose-pine-dawn")

  -- kitty
  local job = require("plenary.job")
  job:new({
    command = "kitty",
    args = { "+kitten", "themes", "--reload-in", "all", "Rosé Pine Dawn" },
  }):start()
end

auto_dark_mode.setup({
  -- update_interval = 1000 * 60,
  update_interval = 1000,
  set_dark_mode = function()
    -- jellybeansdark()
    -- rosedark()
  end,
  set_light_mode = function()
    -- roseLight()
    -- jellybeansdark()
    -- rosedark()
  end,
})
