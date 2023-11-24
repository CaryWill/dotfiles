local status, plugin = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

plugin.setup {
  highlight = {
    -- 这个会影响 syntax on
    enable = true,
    disable = function()
      return vim.b.large_buf
    end,
  },
  indent = {
    enable = true,
    disable = function()
      return vim.b.large_buf
    end,
  },
  ensure_installed = {
    "bash",
    "c",
    "diff",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "jsonc",
    "lua",
    "luadoc",
    "luap",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "regex",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
  },
}
