---@type vim.lsp.Config
return {
    ---@type lspconfig.settings.lua_ls
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME .. '/lua', -- Load vim keyword definitions. This will clear the warning.
                },
            },
            signatureHelp = { enabled = true },
        },
    },
}
