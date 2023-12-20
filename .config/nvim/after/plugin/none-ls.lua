local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

null_ls.setup({
  -- debug = true,
  sources = {
    null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.formatting.lua_format
  },
})
