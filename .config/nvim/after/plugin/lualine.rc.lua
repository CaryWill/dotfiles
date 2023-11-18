local status, lualine = pcall(require, "lualine")
if (not status) then
    return
end

lualine.setup({
    options = {
        disabled_filetypes = {'neo-tree', 'packer', 'NVimTree'}
    }
})
