-- Load custom treesitter grammar for org filetype
local status, plugin = pcall(require, "orgmode")
if not status then
	return
end

-- partial config from https://github.com/kristijanhusak/neovim-config/blob/master/nvim/lua/partials/plugins/orgmode.lua

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
local icloud_org_dir_path = "~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/"
require("orgmode").setup({
	org_agenda_files = {
		icloud_org_dir_path .. "agenda/**/*",
		icloud_org_dir_path .. "**/*",
		-- "/Users/cary/workspace/github/dotfiles/tests/org/test.org",
	},
	-- agenda will also search org_default_notes_file file
	org_default_notes_file = icloud_org_dir_path .. "inbox.org",
	-- if you just use `t` when in capture mode, it goes here
	org_capture_templates = {
		-- T = {
		-- 	description = "Todo",
		-- 	template = "* TODO %?\n %u",
		-- 	target = icloud_org_dir_path .. "todo.org",
		-- },
		n = {
			description = "Notes",
			template = "* %?\n %u",
			target = icloud_org_dir_path .. "inbox.org",
		},
		d = {
			description = "Daily todo",
			template = "* TODO %?\n  DEADLINE: %T",
			target = icloud_org_dir_path .. "inbox.org",
		},
		w = {
			description = "Work todo",
			template = "* TODO %?\n  DEADLINE: %T",
			target = icloud_org_dir_path .. "work.org",
		},
	},
	org_id_link_to_org_use_id = true,
	-- https://github.com/BartSte/dotfiles/blob/master/dotfiles/nvim/lua/config/orgmode.lua
	-- https://github.com/nvim-orgmode/orgmode/blob/master/lua/orgmode/config/defaults.lua
	mappings = {
		org = {
			org_toggle_checkbox = "<leader>cc",
		},
	},
	org_use_tag_inheritance = true,
	-- org_log_into_drawer = "LOGBOOK",
	-- org_startup_folded = "showeverything",
	org_todo_keywords = { "TODO(t)", "WAITING(w)", "PROGRESS(p)", "CONFIRMING(c)", "|", "DONE(d)" },
	org_custom_exports = {
		-- NOTE: there's also other options, like to html then to markdown
		g = {
			label = "Export to gfm markdown personal refined",
			action = function(exporter)
				local current_file = vim.api.nvim_buf_get_name(0)
				local target = vim.fn.fnamemodify(current_file, ":p:r") .. ".md"
				local command = { "pandoc", "--from=org", "--to=gfm", current_file }
				local on_success = function(output)
					local function replaceBrackets(str)
						return str:gsub("\\%[", "["):gsub("\\%]", "]")
					end
					-- Replace "\\[" with "[" in each element of the table
					for i, v in ipairs(output) do
						output[i] = replaceBrackets(v)
					end
					local content = table.concat(output, "\n")
					local file = io.open(target, "w")
					file:write(content)
					file:close()
					vim.api.nvim_echo({ { "success!" } }, true, {})
				end
				local on_error = function(err)
					vim.api.nvim_echo({ { table.concat(err, "\n"), "ErrorMsg" } }, true, {})
				end
				return exporter(command, target, on_success, on_error)
			end,
		},
	},
	-- org_hide_emphasis_markers = true,
	org_agenda_text_search_extra_files = { "agenda-archives" },
	-- org_archive_location = "assets/archives/%s_archive",
	org_blank_before_new_entry = { heading = false, plain_list_item = false },
	-- org_agenda_start_on_weekday = false,
	-- emacs_config = { executable_path = "emacs", config_path = "$HOME/.emacs.d/init.el" },
})
