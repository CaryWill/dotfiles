-- https://miguelcrespo.co/posts/debugging-javascript-applications-with-neovim/
-- 教程来源

local status, plugin = pcall(require, "dap")
if not status then
  return
end

local dap = require("dap")

-- Set keymaps to control the debugger
vim.keymap.set("n", "<F5>", require("dap").continue)
vim.keymap.set("n", "<F10>", require("dap").step_over)
vim.keymap.set("n", "<F11>", require("dap").step_into)
vim.keymap.set("n", "<F12>", require("dap").step_out)
vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
vim.keymap.set("n", "<leader>B", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)

local status2 = pcall(require, "dap-vscode-js")
if not status2 then
  return
end
require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  debugger_path = vim.fn.stdpath("data") .. "/plugged/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = {
    "chrome",
    "pwa-node",
    "pwa-chrome",
    "pwa-msedge",
    "node-terminal",
    "pwa-extensionHost",
    "node",
    "chrome",
  }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

local js_based_languages = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
local dap_utils = require("dap.utils")

-- https://github.com/anasrar/.dotfiles/blob/fdf4b88dfd2255b90f03c62dfc0f3f9458dc99a9/neovim/.config/nvim/lua/rin/DAP/languages/typescript.lua
for _, language in ipairs(js_based_languages) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Current File (pwa-node)",
      cwd = vim.fn.getcwd(),
      args = { "${file}" },
      sourceMaps = true,
      protocol = "inspector",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Current File (pwa-node with ts-node)",
      cwd = vim.fn.getcwd(),
      runtimeArgs = { "--loader", "ts-node/esm" },
      runtimeExecutable = "node",
      args = { "${file}" },
      sourceMaps = true,
      protocol = "inspector",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Current File (pwa-node with deno)",
      cwd = vim.fn.getcwd(),
      runtimeArgs = { "run", "--inspect-brk", "--allow-all", "${file}" },
      runtimeExecutable = "deno",
      attachSimplePort = 9229,
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Test Current File (pwa-node with vitest)",
      cwd = vim.fn.getcwd(),
      program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
      args = { "--inspect-brk", "--threads", "false", "run", "${file}" },
      autoAttachChildProcesses = true,
      smartStep = true,
      console = "integratedTerminal",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Test Current File (pwa-node with deno)",
      cwd = vim.fn.getcwd(),
      runtimeArgs = { "test", "--inspect-brk", "--allow-all", "${file}" },
      runtimeExecutable = "deno",
      smartStep = true,
      console = "integratedTerminal",
      attachSimplePort = 9229,
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Start Chrome with localhost(pwa-chrome, select port)",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      -- port = function()
      --   return vim.fn.input("Select port: ", 9222)
      -- end,
      url = function()
        local port = vim.fn.input("Select port: ", 9222);
        return "http://localhost:" .. port;
      end,
      webRoot = "${workspaceFolder}",
      userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
    },
    {
      type = "pwa-chrome",
      request = "attach",
      name = "Attach Program (pwa-chrome, select port)",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      port = function()
        return vim.fn.input("Select port: ", 9222)
      end,
      webRoot = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach Program (pwa-node, select pid)",
      cwd = vim.fn.getcwd(),
      processId = dap_utils.pick_process,
      skipFiles = { "<node_internals>/**" },
    },
  }
end

-- dap-ui
local status3 = pcall(require, "dapui")
if not status3 then
  return
end
require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close({})
end

vim.keymap.set("n", "<leader>dui", require("dapui").toggle)

-- 不知道这行有没有用
-- https://github.com/mfussenegger/nvim-dap/pull/48
-- require('dap.ext.vscode').load_launchjs()

-- icon
-- https://miguelcrespo.co/posts/how-to-debug-like-a-pro-using-neovim/
-- https://www.nerdfonts.com/cheat-sheet
-- 这个是需要 kitty 里面配置 icon 为 Symbol Nerd Font 的
vim.cmd('highlight DapBreakpointText guifg=#FF0000')
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpointText', linehl = '', numhl = '' })
-- vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpointText', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '', texthl = '', linehl = '', numhl = '' })
-- BUG: https://github.com/rcarriga/nvim-dap-ui/issues/315

-- 如果是 node 的话，先执行 node --inspect src/a.js
-- 然后 F5 选择 current file
