local M = {}

M.setup = function(opts)
    require('bufferline').setup({
        options = {
            separator_style = opts.separator_style or 'thin',
            always_show_bufferline = false,
            show_buffer_close_icons = false,
            show_close_icon = false,
            color_icons = true,
            offsets = {
                {
                    filetype = 'NvimTree',
                    text = 'File Explorer',
                    highlight = 'Directory',
                    separator = true,
                },
                {
                    filetype = 'lspsagaoutline',
                    text = 'Out Line',
                    highlight = 'Directory',
                    separator = true,
                },
            },
        },
        highlights = opts.highlights or {},
    })
end

M.set_map = function()
    local opt = { silent = true, noremap = true }
    vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', opt)
    vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', opt)
    vim.keymap.set('n', '<leader>b[', '<Cmd>BufferLineMovePrev<CR>', opt)
    vim.keymap.set('n', '<leader>b]', '<Cmd>BufferLineMoveNext<CR>', opt)
end

return M
