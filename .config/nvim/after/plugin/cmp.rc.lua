local status, cmp = pcall(require, "cmp")
if not status then
	return
end

local status2, lspkind = pcall(require, "lspkind")
if not status2 then
	return
end

cmp.setup({
	completion = {
		-- completeopt = "menu,menuone,noinsert",
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
		{ name = "async_path" },
		{ name = "luasnip", option = { use_show_condition = false } },
     { name = 'orgmode' },
    -- { name = "nerdfont" }, -- using : to trigger
		-- https://github.com/mmolhoek/cmp-scss
		-- {
		--   name = 'scss',
		--   option = {
		--     folders = { "node_modules/@dnr-ui/tokens/scss" }
		--   }
		-- },
	}),
	-- https://github.com/hrsh7th/nvim-cmp/issues/980
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...",
		}),
	},
})
