local status, plugin = pcall(require, "gitsigns")
if (not status) then return end

plugin.setup({
    signs = {
        add = {
            text = '│'
        },
        change = {
            text = '│'
        },
        delete = {
            text = '│'
        },
        topdelete = {
            text = '│'
        },
        changedelete = {
            text = '│'
        },
        untracked = {
            text = '┆'
        }
    }
})
