local status, headlines = pcall(require, "headlines")
if not status then
	return
end

headlines.setup({
	markdown = {
		headline_highlights = false,
	},
	org = {
		query = vim.treesitter.query.parse(
			"org",
			[[
                (headline (stars) @headline)

                (
                    (expr) @dash
                    (#match? @dash "^-----+$")
                )

                (block
                    name: (expr) @_name
                    (#eq? @_name "SRC")
                ) @codeblock

                (paragraph . (expr) @quote
                    (#eq? @quote ">")
                )
            ]]
		),
		headline_highlights = { "Headline" },
		codeblock_highlight = "CodeBlock",
		dash_highlight = "Dash",
		dash_string = "-",
		quote_highlight = "Quote",
		quote_string = "┃",
		fat_headlines = false,
		fat_headline_upper_string = "",
		fat_headline_lower_string = "",
	},
})
