-- LSP config doc
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local opts = {
        noremap = true,
        silent = true,
        buffer = bufnr
    }
    -- 使用 <c-x><c-o> 来唤起补全菜单
    -- use <TAB>, <C-y>, <Enter> to select, use <C-e> to cancel
    -- completeopt 不要使用 `menuone,noselect,noinsert,preview` 
    -- 如果有 preview 那么会在会车出现一个空白 buffer 用来预览
    vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'}
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- typescript
nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx"}
}

-- lua
local signs = {
    Error = "",
    Warn = "",
    Hint = "",
    Info = ""
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = hl
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
        spacing = 4
    },
    source = true,
    float = {
        source = "always" -- Or "if_many"
    },
    inlay_hints = {
      enabled = true,
    },
    -- signs = true,
    -- underline = false,
    -- virtual_text = false,
})

-- eslint
nvim_lsp.eslint.setup({
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll"
        })
    end
})

-- vim
nvim_lsp.vimls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
