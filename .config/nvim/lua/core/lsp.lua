vim.diagnostic.config({
    underline = true,
    virtual_text = {
        spacing = 4,
        prefix = '●', -- Could be '■', '▎', 'x'
        severity = { min = vim.diagnostic.severity.WARN },
    },
    update_in_insert = false,
    float = {
        source = true, -- Or "if_many"
    },
    severity_sort = true,
    signs = {
        text = {
            -- Others symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            --                  { error = ' ', warn = ' ', info = '󰋇 ', hint = ' ' },
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.HINT] = '󰌵 ',
        },
    },
})
