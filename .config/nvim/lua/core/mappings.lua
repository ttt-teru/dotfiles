vim.cmd([[
    noremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
]])
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local key_set = vim.keymap.set
local key_del = vim.keymap.del
local opts = { noremap = true, silent = true }

key_set('', '$', 'g_', opts)

key_set('n', 'j', 'gj', opts)
key_set('n', 'k', 'gk', opts)

key_set('n', '<C-o>', '<C-o>zz', opts)
key_set('n', '<C-i>', '<C-i>zz', opts)
key_set('n', "''", "''zz", opts)

key_set('n', 'x', '"_x', opts)
key_set('n', 's', '"_s', opts)
key_set('v', 'p', '"0p', opts)

key_set('i', '<C-f>', '<Esc>', opts)
key_set('v', '<C-f>', '<Esc>', opts)

key_set('i', '<C-h>', '<BS>', opts)
key_set('i', '<C-d>', '<Del>', opts)

key_set('i', '<C-l>', '<right>', opts)
key_set('i', '<C-b>', '<left>', opts)

key_set('i', '<C-t>', '<Nop>', opts)
key_set('i', '<C-g>', '<Nop>', opts) -- not working?
key_set('i', '<C-q>', '<Nop>', opts)

key_set('n', '<Tab>', ':normal van<cr>', opts)
key_set('v', '<Tab>', function()
    vim.api.nvim_feedkeys('an', 'v', false)
end)
key_set('n', '<S-Tab>', ':normal vin<cr>', opts)
key_set('v', '<S-Tab>', function()
    vim.api.nvim_feedkeys('in', 'v', false)
end)

-- Error!!
-- key_set('x', 'an', function()
--   vim.lsp.buf.selection_range('outer')
-- end, { desc = "vim.lsp.buf.selection_range('outer')" })
-- key_set('x', 'in', function()
--   vim.lsp.buf.selection_range('inner')
-- end, { desc = "vim.lsp.buf.selection_range('inner')" })

-- Neovim >= 0.12 New added keymap
vim.keymap.set({ 'x' }, '[n', function()
    require('vim.treesitter._select').select_prev(vim.v.count1)
end, { desc = 'Select previous treesitter node' })

vim.keymap.set({ 'x' }, ']n', function()
    require('vim.treesitter._select').select_next(vim.v.count1)
end, { desc = 'Select next treesitter node' })

vim.keymap.set({ 'x', 'o' }, 'an', function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
        require('vim.treesitter._select').select_parent(vim.v.count1)
    else
        vim.lsp.buf.selection_range(vim.v.count1)
    end
end, { desc = 'Select parent treesitter node or outer incremental lsp selections' })

vim.keymap.set({ 'x', 'o' }, 'in', function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
        require('vim.treesitter._select').select_child(vim.v.count1)
    else
        vim.lsp.buf.selection_range(-vim.v.count1)
    end
end, { desc = 'Select child treesitter node or inner incremental lsp selections' })
