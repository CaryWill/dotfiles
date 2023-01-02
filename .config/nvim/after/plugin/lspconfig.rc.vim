if !exists('g:lspconfig')
  finish
endif

lua << EOF
-- vim.lsp.set_log_level("debug")

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
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

vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return string.format("%s: %s", diagnostic.source, diagnostic.message)
      end
      return diagnostic.message
    end
  },
  source = true
})

nvim_lsp.eslint.setup{} -- eslint
nvim_lsp.jedi_language_server.setup{} -- python
nvim_lsp.sourcekit.setup {} -- swift
nvim_lsp.vimls.setup{} -- vim

EOF
