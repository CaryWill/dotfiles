local status, plugin = pcall(require, "neo-tree")
if not status then
	return
end

plugin.setup({
	close_if_last_window = true,
	sources = { "filesystem", "buffers", "git_status", "document_symbols" },
	open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
	filesystem = {
		bind_to_cwd = false,
		follow_current_file = {
			enabled = true,
		},
		use_libuv_file_watcher = true,
		filtered_items = {
			visible = false,
			show_hidden_count = true,
			hide_dotfiles = false,
			hide_gitignored = true,
			hide_by_name = {},
			never_show = {},
			hide_by_pattern = {
				"*.org_archive",
			},
			always_show = { -- remains visible even if other settings would normally hide it
				--".gitignored",
			},
			never_show_by_pattern = { -- uses glob style patterns
				--".null-ls_*",
				-- "*.org_archive",
				".DS_Store",
			},
		},
		-- 因为默认如果打开了一个 buffer，telescope 第一次搜索
		-- 后进行跳转就会跳到第一行
		hijack_netrw_behavior = "open_current",
	},
	git_status = {
		symbols = {
			-- Change type
			added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
			modified = "M", -- or "", but this is redundant info if you use git_status_colors on the name
			deleted = "D",
			renamed = "R",
			untracked = "N",
			ignored = "I",
			unstaged = "U",
			staged = "A",
			conflict = "C",
		},
	},
	window = {
		position = "left",
		width = 30,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			["<cr>"] = "open",
			["<esc>"] = "cancel", -- close preview or floating neo-tree window
			["S"] = "open_split",
			["s"] = "open_vsplit",
			["t"] = "open_tabnew",
			["C"] = "close_node",
			["z"] = "close_all_nodes",
			["a"] = {
				"add",
				config = {
					show_path = "relative",
				},
			},
			["A"] = "add_directory",
			["d"] = "delete",
			["r"] = "rename",
			["c"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			["m"] = "move",
			["q"] = "close_window",
			["R"] = "refresh",
			["?"] = "show_help",
			["i"] = "show_file_details",
			["o"] = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()
				vim.api.nvim_command("silent !open " .. path)
			end,
			["."] = "toggle_hidden",
			["cd"] = "set_root",
			["u"] = "navigate_up",
			["y"] = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()
				vim.fn.setreg("+", path)
			end,
		},
	},
})

vim.api.nvim_set_keymap("n", ";e", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true })
