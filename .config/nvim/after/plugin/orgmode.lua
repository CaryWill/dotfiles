-- Load custom treesitter grammar for org filetype
local status, plugin = pcall(require, "orgmode")
if not status then
	return
end

-- TODO: ios plain org purchase if i found
-- orgmode is really useful, for now like
-- using for a month then decide

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
require("orgmode").setup({
	org_startup_folded = "showeverything",
	org_custom_exports = {
		f = {
			label = "Export to RTF format",
			action = function(exporter)
				local current_file = vim.api.nvim_buf_get_name(0)
				local target = vim.fn.fnamemodify(current_file, ":p:r") .. ".rtf"
				local command = { "pandoc", current_file, "-o", target }
				local on_success = function(output)
					print("Success!")
					vim.api.nvim_echo({ { table.concat(output, "\n") } }, true, {})
				end
				local on_error = function(err)
					print("Error!")
					vim.api.nvim_echo({ { table.concat(err, "\n"), "ErrorMsg" } }, true, {})
				end
				return exporter(command, target, on_success, on_error)
			end,
		},
	},
})
