---@type vim.lsp.Config
return {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    ---@type lspconfig.settings.tinymist
    settings = {
        formatterMode = 'typstyle',
        formatterProseWrap = true, -- wrap lines in content mode
        formatterPrintWidth = 120, -- limit line length to 80 if possible
        formatterIndentSize = 4, -- indentation width
        exportPdf = 'never',
        semanticTokens = 'disable',
        -- outputPath = '$root/target/$dir/$name',
    },
}
