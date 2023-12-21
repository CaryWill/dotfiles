-- i like using this plugin
-- since it will notify in the right bottom
local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

-- 来自https://github.com/MunifTanjim/prettier.nvim
-- 但是好像不用装这个插件也行, 然后就可以直接 range formatting 了
-- 但是我发现好像有时候还是有问题，这个好像是因为 lsp 返回的值的原因
-- 后面对比下 vscode 吧，但是怎么可以默认 range format 的时候用 tsserver 呢
-- 我看了下如果是 jsx 的片段，我用 vscode 也是这样，如果有两个地方修改了缩进
-- 但是我选中了一个地方进行格式化，vscode 会将两个地方都格式化，所以这个应该
-- 还是 lsp 的问题
null_ls.setup({
	-- debug = true,
	-- NOTE: if you have problem with speed then use _d
	-- but you need to install the correspoding ececutable
	-- binary first
	sources = {
		-- null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.formatting.eslint.with({
		-- 	extra_args = { "--fix-dry-run" },
		-- }),
		-- null_ls.builtins.formatting.eslint_d,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.keymap.set("n", "<Leader>f", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })

			-- https://github.com/MunifTanjim/prettier.nvim
			-- format on save
			-- local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
			-- local event = "BufWritePre" -- or "BufWritePost"
			-- local async = event == "BufWritePost"
			-- vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
			-- vim.api.nvim_create_autocmd(event, {
			-- 	buffer = bufnr,
			-- 	group = group,
			-- 	callback = function()
			-- 		vim.lsp.buf.format({ bufnr = bufnr, async = async })
			-- 	end,
			-- 	desc = "[lsp] format on save",
			-- })
		end

		if client.supports_method("textDocument/rangeFormatting") then
			vim.keymap.set("x", "<Leader>f", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })
		end

		-- TODO1: not work
		-- format only on changed lines
		-- https://github.com/joechrisellis/lsp-format-modifications.nvim/issues/1#issuecomment-1275302811
		-- but it seems like it frozen when auto save format
		-- local lsp_format_modifications = require("lsp-format-modifications")
		-- lsp_format_modifications.attach(client, bufnr, { format_on_save = true })

		-- TODO2:
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1131#issuecomment-1273843531
		-- Avoid breaking formatexpr (i.e. gq)
	end,
})

-- https://sxyz.blog/nvim-async-formatting/  Neovim 异步格式化探索
