lua << EOF
local status, plugin= pcall(require, "todo-comments")
if (not status) then return end

plugin.setup {
  signs = false, 
  keywords = {
    FIX = {
      icon = "",
      color = "error",
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, },
    TODO = { icon = "", color = "info" },
    HACK = { icon = "", color = "warning" },
    WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = "", color = "hint", alt = { "INFO" } },
    TEST = { icon = "", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },
}
EOF
