-- Load custom treesitter grammar for org filetype
local status, plugin = pcall(require, "orgmode")
if not status then
	return
end

-- NOTE: there's a bug in harpoon plugin
-- if you open the file using harpoon
-- the fold on orgmode will not work properly
require("orgmode").setup_ts_grammar()
require("orgmode").setup({})
