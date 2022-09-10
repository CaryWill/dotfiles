if !exists('g:lspconfig')
  finish
endif

lua << EOF
-- vim.lsp.set_log_level("debug")

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  -- Mappings.
  local opts = { noremap=true, silent=false, buffer=bufnr }
  -- LSP diagnostics navigation
  vim.keymap.set('n', '<leader>m', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- vim.keymap.set('n', '<leader>f', '<Cmd>lua vim.lsp.buf.format()<CR>', opts)
  vim.keymap.set('n', '<leader>f', '<Cmd>:Prettier<CR>', opts)

  -- 默认使用 prettier 来格式化代码(https://github.com/neovim/neovim/issues/14952#issuecomment-872631873)
  -- 兼容不同版本的 neovim
  if client.name == "diagnosticls" then
    client.server_capabilities.document_formatting = true 
  else
    client.server_capabilities.document_formatting = false 
  end
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" }
}

nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = { "*" },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint',
        rootPatterns = { '.git' },
        debounce = 100,
        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        sourceName = 'eslint',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
    },
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
    },
    formatters = {
      prettier = {
        command = 'prettier',
        rootPatterns = { '.git' },
        args = { '--stdin', '--stdin-filepath', '%filename' }
      }
    },
    formatFiletypes = {
      css = 'prettier',
      javascript = 'prettier',
      javascriptreact = 'prettier',
      json = 'prettier',
      scss = 'prettier',
      less = 'prettier',
      typescript = 'prettier',
      typescriptreact = 'prettier',
      json = 'prettier',
    }
  }
}
EOF
