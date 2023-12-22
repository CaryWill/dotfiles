-- LSP config doc
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint
local nvim_lsp = require("lspconfig")
local on_attach = function(client, bufnr)
	local opts = {
		noremap = true,
		silent = true,
		buffer = bufnr,
	}
	-- 使用 <c-x><c-o> 来唤起补全菜单
	-- use <TAB>, <C-y>, <Enter> to select, use <C-e> to cancel
	-- completeopt 不要使用 `menuone,noselect,noinsert,preview`
	-- 如果有 preview 那么会在会车出现一个空白 buffer 用来预览
	vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- lsp saga
	vim.keymap.set("n", "<leader>j", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	vim.keymap.set("n", "<leader>k", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
	vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)

	-- formatting
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
	-- https://www.reddit.com/r/neovim/comments/122q5we/how_to_disable_builtin_formatter_from_lsp_in/
	-- if client.name == "tsserver" then
	--   client.server_capabilities.documentFormattingProvider = false
	--   client.server_capabilities.documentRangeFormattingProvider = false
	-- end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- typescript
nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
})

-- lua
local signs = {
	Error = "",
	Warn = "",
	Hint = "",
	Info = "",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, {
		text = icon,
		texthl = hl,
		numhl = hl,
	})
end

vim.diagnostic.config({
	underline = true,
	virtual_text = {
		format = function(diagnostic)
			if diagnostic.severity == vim.diagnostic.severity.ERROR then
				return string.format("%s: %s", diagnostic.source, diagnostic.message)
			end
			return diagnostic.message
		end,
		spacing = 4,
	},
	source = true,
	float = {
		source = "always", -- Or "if_many"
	},
	inlay_hints = {
		enabled = true,
	},
	-- signs = true,
	-- virtual_text = false,
})

-- eslint
-- https://blog.csdn.net/lxyoucan/article/details/120956203
-- https://github.com/neovim/nvim-lspconfig/blob/9099871a7c7e1c16122e00d70208a2cd02078d80/lua/lspconfig/server_configurations/eslint.lua#L152
nvim_lsp.eslint.setup({
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			-- command = "EslintFixAll",
			callback = function()
				vim.cmd("EslintFixAll")
				require("fidget").notify("Eslint is auto fixing ~")
			end,
		})
	end,
})

-- NOTE: i thought eslint error can only
-- be fixed by eslint but it can actually
-- be fixed by prettier, which i used
-- :NullLsLog seeing this happening
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = { "*" },
-- 	callback = function()
-- 		vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
-- 	end,
-- })

-- lua
nvim_lsp.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					"vim",
					-- describe and it are from plugin plenate
					"describe",
					"it",
				},
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})

local servers = {
	"cssls",
	-- "stylelint_lsp",
	"vimls",
}

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
