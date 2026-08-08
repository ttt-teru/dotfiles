local conditions = require('heirline.conditions')

local others = require('modules.heirline.components.others')
local file = require('modules.heirline.components.file')
local ruler = require('modules.heirline.components.ruler')
local git = require('modules.heirline.components.git')
local lsp = require('modules.heirline.components.lsp')
local delimiters = require('modules.heirline.components.delimiter')

-- Filetypes where certain elements of the statusline will not be shown
local filetypes = {
    '^git.*',
    '^lazy$',
    '^lazyterm$',
    '^NvimTree$',
    '^TelescopePrompt$',
    'Trouble',
}

-- Buftypes which should cause elements to be hidden
local buftypes = {
    'nofile',
    'prompt',
    'help',
    'quickfix',
}

local StatusLine = {
    static = {
        filetypes = filetypes,
        buftypes = buftypes,
    },
    condition = function(self)
        return not conditions.buffer_matches({
            buftype = self.buftypes,
            filetype = self.filetypes,
        })
    end,
    hl = { fg = 'base_fg', bg = 'base_bg' },

    others.VimMode,
    {
        hl = { fg = 'main_fg', bg = 'main_bg' },
        git.GitBranch,
    },
    delimiters.LeftMiddleSeparator,
    {
        hl = { fg = 'sub_fg', bg = 'sub_bg' },
        file.FileNameBlock,
    },

    delimiters.Align,

    lsp.Diagnostics,
    {
        hl = { reverse = true },
        delimiters.RightMiddleSeparator,
    },
    {
        hl = { fg = 'sub_fg', bg = 'sub_bg' },
        file.FileEncoding,
        {
            hl = { reverse = true },
            delimiters.RightMiddleSeparator,
        },
        file.FileFormat,
    },
    delimiters.RightMiddleSeparator,
    {
        hl = { fg = 'main_fg', bg = 'main_bg' },
        delimiters.RightMainSeparator,
        ruler.Ruler,
        ruler.ScrollBar,
    },
}

return StatusLine
