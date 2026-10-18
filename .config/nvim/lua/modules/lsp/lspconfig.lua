-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.offsetEncoding = { 'utf-8' } -- Resolving offset_encoding issues for several different clients (at null-ls)

-- UI Customization --------------------------------------------------
local border = {
    { '╭', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '╮', 'FloatBorder' },
    { '│', 'FloatBorder' },
    { '╯', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '╰', 'FloatBorder' },
    { '│', 'FloatBorder' },
}
-- LSP settings (for overriding per client)
local handlers = {
    ['textDocument/hover'] = vim.lsp.buf.hover({ border = border }),
    ['textDocument/signatureHelp'] = vim.lsp.buf.signature_help({ border = border }),
}
-- To instead override globally
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--   opts = opts or {}
--   opts.border = opts.border or border
--   return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '[e', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
    vim.keymap.set('n', ']e', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
    vim.keymap.set('n', '<leader>e', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
    vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
    vim.keymap.set('n', 'gc', '<Cmd>Lspsaga code_action<CR>', opts)
    vim.keymap.set('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
    vim.keymap.set('n', '<leader>o', '<Cmd>Lspsaga outline<CR>', opts)
    vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
    vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts)
end

-- mason-lspconfig: automatic_enable = true
vim.lsp.config('*', {
    handlers = handlers,
    capabilities = capabilities,
    on_attach = on_attach,
})
