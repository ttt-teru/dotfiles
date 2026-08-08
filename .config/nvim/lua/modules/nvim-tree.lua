local function on_attach(bufnr)
    local api = require('nvim-tree.api')
    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set('n', '<C-f>', api.tree.close, opts('Close'))
end

require('nvim-tree').setup({
    on_attach = on_attach,
    auto_reload_on_write = true,
    disable_netrw = true,
    hijack_netrw = false,
    hijack_cursor = true,
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    view = {
        width = 30,
    },
    renderer = {
        add_trailing = true,
        highlight_git = true,
        highlight_opened_files = 'none',
        indent_markers = { enable = true },
    },
    actions = { open_file = { quit_on_open = true } },
    git = {
        ignore = false,
    },
})
