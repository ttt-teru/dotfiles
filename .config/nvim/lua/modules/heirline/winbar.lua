local conditions = require('heirline.conditions')

local others = require('modules.heirline.components.others')
local delimiters = require('modules.heirline.components.delimiter')

local WinBar = {
    hl = { fg = 'winbar_fg', bg = 'winbar_bg' },

    delimiters.Spacer,
    {
        init = function(self)
            self.symbol_winbar = require('lspsaga.symbol.winbar').get_bar()
        end,
        provider = function(self)
            return self.symbol_winbar
        end,
        update = 'CursorMoved',
    },

    delimiters.Align,

    others.MacroRecording,
    others.SearchCount,
}

return WinBar
