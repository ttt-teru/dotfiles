local conditions = require('heirline.conditions')

local StatusLine = require('modules.heirline.statusline')
local WinBar = require('modules.heirline.winbar')

require('heirline').setup({
    statusline = StatusLine,
    winbar = WinBar,
    opts = {
        disable_winbar_cb = function(args)
            return conditions.buffer_matches({
                buftype = { 'nofile', 'prompt', 'help', 'quickfix' },
                filetype = { '^git.*', 'Trouble' },
            }, args.buf)
        end,
    },
})
