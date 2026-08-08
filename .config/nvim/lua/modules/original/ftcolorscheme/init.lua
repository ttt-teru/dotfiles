local api = vim.api
local scheme = require('modules.original.ftcolorscheme.colorscheme_config')

local function ftCheck(currentFiletype, ftList)
    for _, filetype in pairs(ftList) do
        if currentFiletype == filetype then
            return true
        end
    end
    return false
end

function ftColorSchemeSet()
    local ft = vim.bo.filetype
    if ftCheck(ft, { 'c', 'sh' }) then
        scheme.default()
    elseif
        ftCheck(ft, {
            'html',
            'css',
            'scss',
            'sass',
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
        })
    then
        scheme.neosolarized()
    elseif ftCheck(ft, { 'rust', 'toml', 'go' }) then
        scheme.iceberg()
    elseif ftCheck(ft, { 'cpp', 'python', 'markdown', 'mdx' }) then
        scheme.catppuccin()
    elseif ftCheck(ft, { 'java' }) then
        scheme.material()
    elseif ftCheck(ft, { 'lua' }) then
        scheme.nord()
    else
        --
    end
end

scheme.default()

api.nvim_create_autocmd('BufEnter', {
    group = vim.api.nvim_create_augroup('BufReload', {}),
    callback = function()
        ftColorSchemeSet()
        require('nvim-web-devicons').set_up_highlights()
    end,
})

-- Color scheme change command.
api.nvim_create_user_command('Scheme', function(opts)
    require('modules.original.ftcolorscheme.colorscheme_config')[opts.args]()
end, {
    nargs = 1,
    complete = function(arg_lead, _, _)
        return vim.tbl_filter(function(item)
            return vim.startswith(item, arg_lead)
        end, {
            'default',
            'catppuccin',
            'neosolarized',
            'iceberg',
            'material',
            'nord',
        })
    end,
})
