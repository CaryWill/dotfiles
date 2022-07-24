"colorscheme nightfox
" hi SignColumn guibg=#162131 ctermbg=233 ctermfg=233
" hi VertSplit guibg=#63707e guifg=#162131 ctermfg=233 ctermbg=250
" hi LineNr guibg=#162131 ctermbg=233 ctermfg=NONE
" hi Tabline cterm=none gui=none
" hi TabLineSel ctermfg=236 ctermbg=222 guifg=#435060 guibg=#fedf81

" -- github theme start --
"let g:github_comment_style = "NONE"
"let g:github_keyword_style = "NONE"
"let g:github_function_style = "NONE"
"let g:github_variable_style = "NONE"
"let g:github_comment_style = "italic"
"let g:github_keyword_style = "italic"
"let g:github_function_style = "italic"
"let g:github_variable_style = "italic"
lua << EOF
--[[
require("github-theme").setup({
  theme_style = "dark_default",
  function_style = "italic",
  dark_float = true,
  hide_end_of_buffer = true,
  hide_inactive_statusline = false,

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  -- colors = {hint = "orange", error = "#ff0000"},
  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
      DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
      -- this will remove the highlight groups
      TSField = {},
    }
  end
})
--]]
EOF
" -- end -- 

" -- catppuccin theme start --
let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha
lua << EOF
require("catppuccin").setup({
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		telescope = true,
	},
})
EOF
" -- end --

colorscheme catppuccin
" vim: set foldmethod=marker foldlevel=0 foldenable:
