local status, harpoon = pcall(require, "harpoon")
if (not status) then return end

-- REQUIRED
harpoon:setup()

local function delete()
  harpoon:list():removeAt(1)
  vim.fn.feedkeys('dd')
end

-- use <leader>a to add yourfile as frequntly accessed file
vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>x", delete)
vim.keymap.set("n", "<leader>o", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- vim.keymap.set("n", "<leader>o", ":Telescope harpoon marks<CR>")
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)
