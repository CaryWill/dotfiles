-- for debug

-- it creates a global function in lua
-- you can use :lua P(123) to print
P = function(...)
	vim.print(vim.inspect(...))
end

RELOAD = function(...)
	return require("plenary.reload").reload_module(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end

-- vim.api.nvim_set_keymap("n", "<leader>r", ":lua R('SingleComment')<cr>", { noremap = true, silent = true })

-- Define the Lua function to copy the Git URL
-- code from chatgpt
local function copy_git_url_to_clipboard()
	local handle = io.popen("git remote get-url origin")
	local git_url = ""
	if handle then
		git_url = handle:read("*a")
		handle:close()
	end
	-- Removes any trailing whitespace including new lines
	git_url = string.gsub(git_url, "%s+$", "")
	-- Use Neovim's API to set the clipboard contents
	vim.fn.setreg("+", git_url)
	-- Optional: display a message in Neovim
	print("Copied Git URL to clipboard: " .. git_url)
end
-- vim.api.nvim_set_keymap("n", "<leader>cg", "", {
-- 	noremap = true,
-- 	silent = true,
-- 	callback = copy_git_url_to_clipboard,
-- })
