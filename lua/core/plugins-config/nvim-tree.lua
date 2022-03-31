-- nvim-tree configuration


-- checking in case nvim-tree is not working properly
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local M = {}

function M.setup()
    require('nvim-tree').setup {
        auto_reload_on_write = true,
        hide_root_folder = false,
        hijack_cursor = false,
        hijack_unnamed_buffer_when_opening = false,
        sort_by = 'name',
        update_cwd = false,
        disable_netrw = true,
        hijack_netrw = true,
        view = {
            side = 'left',
            signcolumn = "yes",
            number = true,
            relativenumber = true,
        },
        filters = {
            dotfiles = false,
            custom = {".git"},
        },
        git = {
            enable = true,
            ignore = true,
            timeout = 400,
        },
        actions = {
            change_dir = {
                enable = true,
                global = true,
            },
            open_file = {
                quit_on_open = true,
                resize_window = false,
            }
        },

    }
end

return M

