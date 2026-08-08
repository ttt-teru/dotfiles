require('catppuccin').setup({
    dim_inactive = {
        enabled = true,
        shade = 'dark',
        percentage = 0.15,
    },
    integrations = {
        cmp = true,
        fidget = true,
        gitsigns = true,
        headlines = true,
        hop = true,
        lsp_saga = true,
        lsp_trouble = true,
        markdown = true,
        mason = true,
        nvimtree = true,
        telescope = {
            enabled = true,
            style = 'nvchad',
        },
        treesitter = true,
        treesitter_context = true,
        rainbow_delimiters = true,
    },
    indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
    },
    native_lsp = {
        enabled = true,
        virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
        },
        underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
        },
    },
})
