local autopairs = require('nvim-autopairs')

autopairs.setup({
    disable_filetype = { 'TelescopePrompt', 'vim' },
    check_ts = true,
    ts_config = {},
})
require('cmp').event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())

local Rule = require('nvim-autopairs.rule')
autopairs.add_rules({
    Rule(' ', ' '):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
    Rule('( ', ' )')
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match('.%)') ~= nil
        end)
        :use_key(')'),
    Rule('{ ', ' }')
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match('.%}') ~= nil
        end)
        :use_key('}'),
    Rule('[ ', ' ]')
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match('.%]') ~= nil
        end)
        :use_key(']'),
})
