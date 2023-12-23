-- how to use it
-- name the file with *.test.ts
-- and put it in root test/ folder
-- then on the test file using <leader>t
-- using <A-i> to dismiss it

-- since jest will use the directory jest.config.js as the rootDir
-- so here, we will jest use a json object
-- https://jestjs.io/docs/cli#--configpath
-- https://jestjs.io/docs/next/configuration
local status, plugin = pcall(require, "jester")
if (not status) then return end

local config = {
  moduleFileExtensions = { "js", "cjs", "ts", "mjs" },
  testEnvironment = "node",
  -- so yourfile should end .ts to make it work with esm
  extensionsToTreatAsEsm = { ".ts" },
}
-- remove whitespaces(like newline and space)
local jsonConfig = "'" .. vim.fn.json_encode(config) .. "'"
local jestcmd = "NODE_OPTIONS=--experimental-vm-modules jest --config " .. jsonConfig .. " $file"

require("jester").setup({
  cmd = jestcmd,
  terminal_cmd = ':FloatermNew'
})

-- vim.g.floaterm_autoinsert = false
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9
-- A for alt key
-- TODO: can have a autocmd filetype
-- since for now it's only for js file type
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>FloatermToggle<CR>')
vim.keymap.set('t', '<Leader>t', '<C-\\><C-n><CMD>FloatermToggle<CR>')
