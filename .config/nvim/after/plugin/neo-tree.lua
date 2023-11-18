require('neo-tree').setup({
    sources = {"filesystem", "buffers", "git_status", "document_symbols"},
    open_files_do_not_replace_types = {"terminal", "Trouble", "trouble", "qf", "Outline"},
    filesystem = {
        bind_to_cwd = false,
        follow_current_file = {
            enabled = true
        },
        use_libuv_file_watcher = true,
        filtered_items = {
            visible = true,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_by_name = {},
            never_show = {}
        }
    },
    git_status = {
        symbols = {
            -- Change type
            added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "M", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "D",
            renamed = "R",
            untracked = "U",
            ignored = "☒",
            unstaged = "󰄱",
            staged = "A",
            conflict = ""
        }
    },
    window = {
        position = "left",
        width = 30,
        mapping_options = {
            noremap = true,
            nowait = true
        },
        mappings = {
            ["<cr>"] = "open",
            ["<esc>"] = "cancel", -- close preview or floating neo-tree window
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            ["a"] = {
                "add",
                config = {
                    show_path = "relative"
                }
            },
            ["A"] = "add_directory",
            ["d"] = "delete",
            ["r"] = "rename",
            ["c"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["m"] = "move",
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["i"] = "show_file_details",
            ["J"] = function(state)
                local tree = state.tree
                local node = tree:get_node()
                local siblings = tree:get_nodes(node:get_parent_id())
                local renderer = require('neo-tree.ui.renderer')
                renderer.focus_node(state, siblings[#siblings]:get_id())
            end,
            ["K"] = function(state)
                local tree = state.tree
                local node = tree:get_node()
                local siblings = tree:get_nodes(node:get_parent_id())
                local renderer = require('neo-tree.ui.renderer')
                renderer.focus_node(state, siblings[1]:get_id())
            end,
            ["o"] = function(state)
                local node = state.tree:get_node()
                local path = node:get_id()
                vim.api.nvim_command('silent !open ' .. path)
            end,
            ["."] = "toggle_hidden",
            ["cd"] = "set_root",
            ["u"] = "navigate_up"
        }
    }
})
