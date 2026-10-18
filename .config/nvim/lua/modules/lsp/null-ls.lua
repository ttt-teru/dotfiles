local null_ls = require('null-ls')
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
    sources = {
        require('none-ls.diagnostics.eslint_d').with({
            diagnostics_format = '[eslint] #{m}\n(#{c})',
        }),
        -- diagnostics.stylelint,
        completion.luasnip,
    },
})
