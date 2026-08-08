local M = {}

local conditions = require('heirline.conditions')

local delimiters = require('modules.heirline.components.delimiter')

-- We're getting minimalists here!
M.Ruler = {
    -- %l = current line number
    -- %L = number of lines in the buffer
    -- %c = column number
    -- %P = percentage through file of displayed window
    -- provider = '%7(%l/%3L%):%2c %P',
    -- provider = ' %P% /%2L ',
    -- provider = ' %l:%c %P ',
    -- provider = '%5(%l/%2L%) :%2c %P ',
    provider = ' %l/%2L :%2c %P ',
}

-- I take no credits for this! :lion:
M.ScrollBar = {
    static = {
        -- sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' },
        sbar = { '█', '▇', '▆', '▅', '▄', '▃', '▂', '▁' },
        -- Another variant, because the more choice the better.
        -- sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
    },
    provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return string.rep(self.sbar[i], 2)
    end,
}

return M
