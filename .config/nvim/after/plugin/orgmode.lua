-- Load custom treesitter grammar for org filetype
local status, plugin = pcall(require, "orgmode")
if not status then
	return
end

-- NOTE: there's a bug in harpoon plugin
-- if you open the file using harpoon
-- the fold on orgmode will not work properly
-- oh, i found out it's not harpoon,
-- but you need to manually open a .org file
-- first to load the ftplugin then it will
-- work afterwords
-- so i guess telescope can work because it
-- previews the file which loads the file
-- so i want to use harpoon as an extension
-- to solve the problem
require("orgmode").setup_ts_grammar()
require("orgmode").setup({})
