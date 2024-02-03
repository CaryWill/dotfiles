local status, plugin = pcall(require, "org-roam")
if not status then
	return
end

-- after you config this, you can run `:InitWs` to open org_roam_ui url
-- vim.g.org_roam_ui_root = "/Users/cary/workspace/github/org-roam-ui.nvim"
vim.g.org_roam_ui_root = "/Users/cary/.local/share/nvim/plugged/org-roam-ui.nvim"

local org_roam = require("org-roam")
org_roam.setup({
	-- required
	-- org_roam_directory = "~/OrgRoam",
	org_roam_directory = "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org",
	-- file will created at org_roam_capture_directory or org_roam_directory
	-- org_roam_capture_directory = "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org",
	-- required (not checked if present)
	org_roam_database_file = "~/.config/emacs/org-roam.db",
	-- paths you want to save zettle when do a capture
	-- org_roam_zettle_paths = { "reference", "main", "articles" },
})
function openURL(url)
	local command = string.format("open %s", url)
	local result = os.execute(command)

	if result == true then
		print("URL opened successfully.")
	else
		print("Error opening URL.")
	end
end

local open_org_roam_ui = function()
	-- org-roam-ui default on 3000 port
	local urlToOpen = "http://localhost:3000"
	openURL(urlToOpen)
	vim.cmd("InitWs")
end

-- vim.keymap.set("n", "<Leader>nf", org_roam.org_roam_node_find)
-- vim.keymap.set("n", "<Leader>ni", org_roam.org_roam_node_insert)
vim.keymap.set("n", "<Leader>bl", org_roam.org_roam_buffer_toggle)
vim.keymap.set("n", "<Leader>zn", org_roam.org_roam_capture)
-- vim.keymap.set("n", "<Leader>zo", open_org_roam_ui)
