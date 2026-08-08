require('trouble').setup({
    action_keys = {
        jump = {},
        jump_close = { '<cr>' },
        close = { 'q', '<C-f>' },
    },
    signs = {
        error = '',
        warning = '',
        information = '',
        hint = '',
        other = '',
    },
})

local opt = { silent = true, noremap = true }
-- Lua
vim.keymap.set('n', '<leader>xx', '<Cmd>TroubleToggle<CR>', opt)
vim.keymap.set('n', '<leader>xw', '<Cmd>TroubleToggle workspace_diagnostics<CR>', opt)
vim.keymap.set('n', '<leader>xd', '<Cmd>TroubleToggle document_diagnostics<CR>', opt)
vim.keymap.set('n', '<leader>xl', '<Cmd>TroubleToggle loclist<CR>', opt)
vim.keymap.set('n', '<leader>xq', '<Cmd>TroubleToggle quickfix<CR>', opt)
vim.keymap.set('n', '<leader>xr', '<Cmd>TroubleToggle lsp_references<CR>', opt)
