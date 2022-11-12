if !exists('g:lspconfig')
  finish
endif

" Prettier
let g:neoformat_try_node_exe = 1

lua << EOF
-- vim.lsp.set_log_level("debug")

-- all lsp server config can be found throught `:help lspconfig-all`

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  -- use <TAB>, <C-y>, <Enter> to select, use <C-e> to cancel
  -- 可使用 c-x c-o 来唤起自动补全菜单

  -- Mappings.
  local opts = { noremap=true, silent=false, buffer=bufnr }
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- typescript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" }
}

-- swift
nvim_lsp.sourcekit.setup {
}

-- vim
nvim_lsp.vimls.setup{}

-- lua
nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}

-- eslint
nvim_lsp.eslint.setup{}

EOF

