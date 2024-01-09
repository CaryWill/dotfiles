local status, plugin = pcall(require, "org-roam")
if not status then
	return
end

local org_roam = require("org-roam")
org_roam.setup({
	-- required
	-- org_roam_directory = "~/OrgRoam",
	org_roam_directory = "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org",
	-- file will created at org_roam_capture_directory or org_roam_directory
	-- org_roam_capture_directory = "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org",
	-- required (not checked if present)
	org_roam_database_file = "~/.config/emacs/org-roam.db",
})

vim.keymap.set("n", "<Leader>nf", org_roam.org_roam_node_find)
vim.keymap.set("n", "<Leader>zn", org_roam.org_roam_capture)
