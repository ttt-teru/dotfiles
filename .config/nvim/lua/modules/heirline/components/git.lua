local M = {}

local utils = require('heirline.utils')
local conditions = require('heirline.conditions')

local delimiters = require('modules.heirline.components.delimiter')

M.GitBranch = {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
    end,

    delimiters.LeftMiddleSeparator,
    {
        provider = function(self)
            return '  ' .. self.status_dict.head .. ' '
        end,
    },
    delimiters.LeftMainSeparator,
}

return M
