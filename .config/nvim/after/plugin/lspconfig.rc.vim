if !exists('g:lspconfig')
  finish
endif

lua << EOF
-- vim.lsp.set_log_level("debug")

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
  -- 使用 <c-x><c-o> 来唤起补全菜单
  -- use <TAB>, <C-y>, <Enter> to select, use <C-e> to cancel
  -- completeopt 不要使用 `menuone,noselect,noinsert,preview` 
  -- 如果有 preview 那么会在会车出现一个空白 buffer 用来预览
  vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'}
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- typescript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" }
}

-- lua
nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
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
    end,
    spacing = 4,
  },
  source = true,
  float = {
    source = "always", -- Or "if_many"
  },
})

-- eslint
nvim_lsp.eslint.setup{}

-- python
nvim_lsp.jedi_language_server.setup{
  on_attach = on_attach,
  capabilities = capabilities,
} 

-- swift
nvim_lsp.sourcekit.setup {
  on_attach = on_attach,
  capabilities = capabilities,
} 

-- vim
nvim_lsp.vimls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
} 

EOF

