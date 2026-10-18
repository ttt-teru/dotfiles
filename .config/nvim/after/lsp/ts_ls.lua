local cmd = require('utils.by_os')({
    macunix = { 'typescript-language-server', '--stdio' },
    win = { 'typescript-language-server.cmd', '--stdio' },
})

---@type vim.lsp.Config
return {
    -- filetypes = { "typescript" , "typescriptreact" },
    cmd = cmd,
}
