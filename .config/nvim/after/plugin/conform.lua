-- https://github.com/stevearc/conform.nvim#formatters
local status, plugin = pcall(require, "conform")
if (not status) then return end

-- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#command-to-toggle-format-on-save
plugin.setup({
  formatters_by_ft = {
    -- Conform will run multiple formatters sequentially
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettier" } },
    typescript = { { "prettier" } },
    typescriptreact = { { "prettier" } },
    javascriptreact = { { "prettier" } },
    -- Use the "*" filetype to run formatters on all filetypes.
    -- ["*"] = { { "prettier" } },
    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ["_"] = { "trim_whitespace" },
  },
  -- format_on_save = function(bufnr)
  --   -- Disable with a global or buffer-local variable
  --   if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
  --     return
  --   end
  --   return { timeout_ms = 500, lsp_fallback = true }
  -- end,
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

-- TODO: 发现如果写死 start_row 和 end_row 就可以，但是上面的 Format 还是不对
-- 它还是会格式化所有的东西, 但是 vscode 的都行，不论是 tsc 还是 prettier
local range_formatting = function()
  local start_row, _ = unpack(vim.api.nvim_buf_get_mark(0, "<"))
  local end_row, _ = unpack(vim.api.nvim_buf_get_mark(0, ">"))
  vim.lsp.buf.format({
    range = {
      ["start"] = { start_row, 0 },
      ["end"] = { end_row, 0 },
    },
    async = true,
  })
end
-- vim.keymap.set("v", "<leader>f", range_formatting, { desc = "Range Formatting" })
