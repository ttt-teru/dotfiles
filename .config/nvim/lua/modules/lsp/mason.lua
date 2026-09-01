local config = {}

function config.setup()
    require('mason').setup({
        ui = {
            border = 'single',
            icons = {
                package_installed = '✓',
                package_pending = '➜',
                package_uninstalled = '✗',
            },
        },
    })
end

function config.lspconfig()
    require('mason-lspconfig').setup({
        ensure_installed = {
            'bashls',
            'clangd',
            'cmake',
            'cssls',
            'cssmodules_ls',
            'dockerls',
            'emmet_ls',
            'glsl_analyzer',
            'gopls',
            'html',
            'jdtls',
            'jsonls',
            'lua_ls',
            'pyright',
            'rust_analyzer',
            'tinymist',
            'ts_ls',
        },
    })
end

function config.null_ls()
    require('mason-null-ls').setup({
        ensure_installed = {
            'clang_format',
            'eslint_d',
            'prettierd',
            'stylelint',
            'stylua',
        },
        automatic_installation = true,
    })
end

return config
