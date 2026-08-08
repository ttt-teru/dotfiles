require('lspsaga').setup({
    preview = {
        lines_above = 1,
        lines_below = 10,
    },
    scroll_preview = {
        scroll_down = '<C-e>',
        scroll_up = '<C-y>',
    },
    request_timeout = 2000,
    finder = {
        quit = { 'q', '<Esc>', '<C-f>' },
    },
    definition = {
        quit = { 'q', '<Esc>', '<C-f>' },
    },
    code_action = {
        keys = {
            quit = { 'q', '<Esc>', '<C-f>' },
        },
    },
    lightbulb = {
        enable_in_insert = false,
        virtual_text = false,
    },
    diagnostic = {
        kyes = {
            quit_in_show = { 'q', '<Esc>', '<C-f>' },
        },
    },
    rename = {
        quit = { 'q', '<Esc>', '<C-f>' },
    },
    outlline = {
        keys = {
            quit = { 'q', '<Esc>', '<C-f>' },
        },
    },
    ui = {
        border = 'rounded',
        code_action = ' ',
    },
    symbol_in_winbar = {
        enable = false,
    },
})
