local status, nullls = pcall(require, "null-ls")
if (not status) then return end

nullls.setup({
    sources = {
        -- nullls.builtins.formatting.prettier_d_slim,
        nullls.builtins.diagnostics.eslint_d,
    },
})
