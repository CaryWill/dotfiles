local status, plugin = pcall(require, "lualine")
if not status then
	return
end

local inited_db = false
local function get_backlines()
	if vim.bo.filetype == "org" then
		if inited_db ~= true then
			inited_db = true
			require("org-roam").org_roam_buffer_toggle({ open_loc = false })
		end
		local file_path = vim.fn.expand("%:p")
		local backlinks_count = vim.g.org_roam_backlinks[file_path]
		if backlinks_count == 0 then
			return backlinks_count or "no backlines"
		else
			return backlinks_count .. " backlines"
		end
	else
		return ""
	end
end

plugin.setup({
	options = {
		-- disabled_filetypes = { 'packer', 'NVimTree', "sagaoutline", "neo-tree" },
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", { "filename", path = 1 } },
		lualine_c = {
			"diagnostics",
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {
			get_backlines,
			"filesize",
			"filetype",
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "filesize", "location" },
		lualine_y = {},
		lualine_z = {},
	},
})
