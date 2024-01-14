local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local actions = require("telescope.actions")

local previewers = require("telescope.previewers")
local previewers_utils = require("telescope.previewers.utils")

-- Faster preview large file
-- current condition: preview large file stucks
-- https://github.com/nvim-telescope/telescope.nvim/issues/623#issuecomment-853164470
local max_size = 100000
local truncate_large_files = function(filepath, bufnr, opts)
	opts = opts or {}
	filepath = vim.fn.expand(filepath)
	vim.loop.fs_stat(filepath, function(_, stat)
		if not stat then
			return
		end
		if stat.size > max_size then
			local cmd = { "head", "-c", max_size, filepath }
			previewers_utils.job_maker(cmd, bufnr, opts)
		else
			previewers.buffer_previewer_maker(filepath, bufnr, opts)
		end
	end)
end

-- TODO: file size window height -
telescope.setup({
	defaults = {
		layout_config = {
			-- prompt_position = "bottom",
			-- preview_cutoff = 170,
		},
		-- you can go https://www.nerdfonts.com/cheat-sheet
		-- and click copy icon then you can use the icon
		-- from nerdfont
		prompt_prefix = "   ",
		-- sorting_strategy = "ascending",
		buffer_previewer_maker = truncate_large_files,
		file_ignore_patterns = {
			"^.git/",
			"node_modules/",
			"^.node/",
			"^.vscode/",
			"^.husky/",
			"package-lock.json",
			"yarn.lock",
		},
		mappings = {
			n = {
				["<ESC>"] = actions.close,
				["<C-[>"] = actions.close,
				-- ["q"] = actions.close,
			},
			i = {
				["<C-s>"] = actions.file_split,
				["<C-v>"] = actions.file_vsplit,
				["<C-t>"] = actions.file_tab,
				-- ["<C-y>"] = require("telescope.actions.layout").toggle_preview,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				-- ["<ESC>"] = actions.close,
				["<C-[>"] = actions.close,
				-- ["q"] = actions.close,
			},
		},
		-- https://github.com/BurntSushi/ripgrep/issues/299#issuecomment-270102901
		-- search ( instead of \( when searching
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--line-number",
			"--column",
			"--smart-case",
			"--fixed-strings",
			"--hidden",
		},
		extensions = {
			-- file_browser = {
			-- 	theme = "ivy",
			-- 	-- disables netrw and use telescope-file-browser in its place
			-- 	hijack_netrw = true,
			-- 	mappings = {
			-- 		["i"] = {
			-- 			-- your custom insert mode mappings
			-- 		},
			-- 		["n"] = {
			-- 			-- your custom normal mode mappings
			-- 		},
			-- 	},
			-- },
			-- fzf = {
			--   fuzzy = true,                   -- false will only do exact matching
			--   override_generic_sorter = true, -- override the generic sorter
			--   override_file_sorter = true,    -- override the file sorter
			--   case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
			--   -- the default case_mode is "smart_case"
			-- },
			-- undo = {},
			-- harpoon = {},
			-- frecency = {
			-- 	show_scores = true,
			-- 	disable_devicons = true,
			-- 	ignore_patterns = {
			-- 		"node_modules/",
			-- 	},
			-- 	auto_validate = false,
			-- 	db_safe_mode = false,
			-- },
			media_files = {
				-- filetypes whitelist
				-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
				filetypes = { "png", "webp", "jpg", "jpeg" },
				-- find command (defaults to `fd`)
				find_cmd = "rg",
			},
			-- recent_files = {
			--   only_cwd = true
			-- }
		},
	},
})

-- vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
-- 	pattern = "*",
-- 	callback = function()
-- 		clear_last_image()
-- 	end,
-- })

-- require('telescope').extensions.smart_open.smart_open {
--   cwd_only = true,
--   filename_first = false,
-- }

-- require("telescope").load_extension("file_browser")
-- telescope.load_extension("frecency")

-- > I use Alacritty and the image quality is pretty shit but at least I got a peek of what the images look like,
-- maybe iterm2 and kitty would be better. - https://github.com/nvim-telescope/telescope-media-files.nvim/issues/17#issuecomment-1229801090
-- > Überzug doesn't support MacOs,
require("telescope").load_extension("media_files")
-- require("telescope").load_extension("luasnip")
require("telescope").load_extension("bibtex")
-- require("telescope").load_extension("media_files")
-- require("telescope").load_extension("bibtex")
-- telescope.load_extension('fzf')
-- telescope.load_extension("undo")
-- telescope.load_extension("recent_files")
-- telescope.load_extension('harpoon')
-- telescope.load_extension('smart_open')

-- vim.keymap.set("n", "<leader><leader>", "<Cmd>Telescope frecency workspace=CWD<CR>")
-- vim.keymap.set("n", "<leader><leader>", "<Cmd>lua require('telescope').extensions.recent_files.pick()<CR>")
-- vim.keymap.set("n", "<leader><leader>", "<Cmd>lua require('telescope').extensions.smart_open.smart_open()<CR>")
