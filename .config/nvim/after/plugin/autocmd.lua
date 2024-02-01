-- 性能优化参考下面的文章
-- https://www.reddit.com/r/neovim/comments/z85s1l/disable_lsp_for_very_large_files/

-- from here
-- https://neovim.discourse.group/t/a-lua-based-auto-refresh-buffers-when-they-change-on-disk-function/2482/3
-- https://gitlab.com/jokeyrhyme/dotfiles/-/blob/main/config/nvim/init.lua#L5-11
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

local function change_theme()
	-- 9AM - 18 AM 自动切换主题
	local hr = tonumber(os.date("%H", os.time()))
	if hr > 9 and hr < 17 then
		vim.opt.background = "light"
		vim.cmd("colorscheme rose-pine")
		-- change kitty theme asyncly
		local job = require("plenary.job")
		job:new({
			command = "kitty",
			args = { "+kitten", "themes", "--reload-in", "all", "Rosé Pine Dawn" },
		}):start()
	elseif hr > 17 and hr < 18 then -- dusk
		vim.opt.background = "dark"
		vim.cmd("colorscheme rose-pine-main")
		-- change kitty theme asyncly
		local job = require("plenary.job")
		job:new({
			command = "kitty",
			args = { "+kitten", "themes", "--reload-in", "all", "Rosé Pine Moon" },
		}):start()
	else
		vim.opt.background = "dark"
		vim.cmd("colorscheme rose-pine-moon")
		-- change kitty theme asyncly
		local job = require("plenary.job")
		job:new({
			command = "kitty",
			args = { "+kitten", "themes", "--reload-in", "all", "Rosé Pine Moon" },
		}):start()
	end
end
change_theme()
-- if set background then call this function
vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "background",
	callback = function()
		change_theme()
	end,
})
