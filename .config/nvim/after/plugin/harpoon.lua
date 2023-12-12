local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()

-- use <leader>a to add yourfile as frequntly accessed file
-- use <C-e> to open the list
-- this is the video author talks https://www.youtube.com/watch?v=Qnos8aApa9g
vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
