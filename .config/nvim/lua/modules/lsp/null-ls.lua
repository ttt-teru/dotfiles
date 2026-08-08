local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
    sources = {
        formatting.prettierd.with({
            disabled_filetypes = { 'markdown' },
        }),
        require('none-ls.diagnostics.eslint_d').with({
            diagnostics_format = '[eslint] #{m}\n(#{c})',
        }),
        diagnostics.stylelint,
        formatting.clang_format.with({
            extra_args = { '--style=file:' .. vim.fn.stdpath('config') .. '/utils/linter-config/.clang-format' },
        }),
        formatting.stylua.with({
            extra_args = { '--config-path', vim.fn.stdpath('config') .. '/utils/linter-config/.stylua.toml' },
        }),
        completion.luasnip,
    },
})

vim.keymap.set('n', '==', vim.lsp.buf.format, { noremap = true, silent = true })
