require('lsp_signature').setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = 'rounded',
    },
    hint_enable = false,
    hint_prefix = '💡 ',
    floating_window = false,
    toggle_key = '<C-k>', -- toggle signature on and off in insert mode.
    -- toggle_key_flip_floatwin_setting = true,
})
