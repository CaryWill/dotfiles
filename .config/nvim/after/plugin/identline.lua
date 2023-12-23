local status, plugin = pcall(require, "ibl")
if (not status) then return end

plugin.setup({
  indent = {
    char = "│",
    tab_char = "│"
  },
  scope = {
    enabled = false
  },
  exclude = {
    filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "trouble", "lazy", "mason", "notify",
      "toggleterm", "lazyterm", "floaterm", "org" }
  }
})
