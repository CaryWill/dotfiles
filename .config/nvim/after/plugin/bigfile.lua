-- default config
local status, plugin = pcall(require, "bigfile")
if (not status) then return end

require("bigfile").setup({
	-- size of the file in MiB, the plugin round file sizes to the closest MiB
	filesize = 0.1,
	-- autocmd pattern or function see <### Overriding the detection of big files>
	-- pattern = { "*" },
  -- detect long python files
  pattern = function(bufnr, filesize_mib)
    -- you can't use `nvim_buf_line_count` because this runs on BufReadPre
    local file_contents = vim.fn.readfile(vim.api.nvim_buf_get_name(bufnr))
    local file_length = #file_contents
    -- local filetype = vim.filetype.match({ buf = bufnr })
    -- 0.5mb
    if file_length > 5000 then
      return true
    end
  end, 
	features = { -- features to disable
		"indent_blankline",
		"illuminate",
		"lsp",
		"treesitter",
		"syntax",
		"matchparen",
		"vimopts",
		"filetype",
	},
})
