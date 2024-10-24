-- perf problem solved
-- https://github.com/nvim-telescope/telescope.nvim/issues/1379#issuecomment-1208003388
local ok, colorizer = pcall(require, "colorizer")
if not ok then
	return
end

-- https://github.com/lilydjwg/colorizer
colorizer.setup({ "css", "javascript", "lua", "vim", "toml", "svelte", "typescript" }, {
	RGB = true, -- #RGB hex codes
	RRGGBB = true, -- #RRGGBB hex codes
	names = false, -- "Name" codes like Blue oe blue
	RRGGBBAA = true, -- #RRGGBBAA hex codes
	rgb_fn = true, -- CSS rgb() and rgba() functions
	hsl_fn = true, -- CSS hsl() and hsla() functions
	css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
	-- Available modes: foreground, background, virtualtext
	mode = "background", -- Set the display mode.)
})
