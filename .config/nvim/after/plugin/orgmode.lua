-- Load custom treesitter grammar for org filetype
local status, plugin = pcall(require, "orgmode")
if not status then
	return
end

require("orgmode").setup_ts_grammar()
require("orgmode").setup({})
