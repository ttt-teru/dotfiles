require('conform').setup({
    notify_on_error = false,
    formatters_by_ft = {
        lua = { 'stylua' },

        c = { 'clang-format' },
        cpp = { 'clang-format' },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { 'rustfmt' },

        html = { 'prettierd' },
        css = { 'prettierd' },
        scss = { 'prettierd' },
        sass = { 'prettierd' },
        javascript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescript = { 'prettierd' },
        typescriptreact = { 'prettierd' },
    },
    formatters = {
        stylua = {
            append_args = {
                '--config-path',
                vim.fn.stdpath('config') .. '/utils/linter-config/.stylua.toml',
            },
        },
        ['clang-format'] = {
            append_args = { '--style=file:' .. vim.fn.stdpath('config') .. '/utils/linter-config/.clang-format' },
        },
        prettierd = {
            disabled_filetypes = { 'markdown' },
        },
    },
    default_format_opts = {
        lsp_format = 'fallback',
    },
    format_on_save = function()
        if vim.v.cmdbang == 1 then
            return nil
        end

        local ignore_filetypes = { 'sql', 'yaml', 'yml' }
        if vim.tbl_contains(ignore_filetypes, vim.bo[vim.api.nvim_get_current_buf()].filetype) then
            return
        end

        -- get current formatter names
        local formatters, use_lsp = require('conform').list_formatters_to_run()
        local fmt_names = {}

        if not vim.tbl_isempty(formatters) then
            fmt_names = vim.tbl_map(function(f)
                return f.name
            end, formatters)
        elseif use_lsp then
            fmt_names = { 'lsp' }
        else
            return
        end

        local fmt_info = 'fmt: ' .. table.concat(fmt_names, '/')
        local progress = require('fidget.progress').handle.create({
            title = fmt_info,
            message = 'running',
            lsp_client = { name = 'conform' },
            percentage = 0,
        })

        return {
            timeout_ms = 1500,
            lsp_format = 'fallback',
        }, function(err)
            if err then
                progress.percentage = nil
                progress:report({
                    title = 'Formatter failed',
                    message = '✘',
                })
                progress:cancel()
            else
                progress:finish()
            end
        end
    end,
})

local M = {}
function M.format()
    local have_fmt, fmt_util = pcall(require, 'conform')
    if have_fmt then
        -- get current formatter names
        local formatters, use_lsp = fmt_util.list_formatters_to_run()
        local fmt_names = {}

        if not vim.tbl_isempty(formatters) then
            fmt_names = vim.tbl_map(function(f)
                return f.name
            end, formatters)
        elseif use_lsp then
            fmt_names = { 'lsp' }
        else
            return
        end

        local fmt_info = 'fmt: ' .. table.concat(fmt_names, '/')
        local progress = require('fidget.progress').handle.create({
            title = fmt_info,
            message = 'running',
            lsp_client = { name = 'conform' },
            percentage = 0,
        })

        -- format with callback, and notify on err
        fmt_util.format({ acync = true, quiet = true, lsp_format = 'fallback' }, function(err)
            if err then
                progress.percentage = nil
                progress:report({
                    title = 'Formatter failed',
                    message = '✘',
                })
                progress:cancel()
            else
                progress:finish()
            end
        end)
    else
        vim.lsp.buf.format()
    end
end

return M
