---- Darker --
-- background1 = #404040
-- background2 = #1a1a1a
-- background3 = #282828
-- orange1 = #F65016
-- blue    = #4F91FA
-- purple  = #9774ED
-- purple1 = #B537DB
-- red     = #D30536
-- cyan    = #55CACE
-- green   = #88BF3E
-- grenn   = #1FB429
-- green   = #76F310
-- carmine = #d70035
-- black   = #251026
-- yellow  = #E4F337

-- orange  = #ff9800
-- cyan    = #83ffff
-- green   = #009688
-- purple  = #ab47bc
-- blue    = #00bcd4

-- orange1 = #ffcc00
-- orange2 = #f78c6c
-- red     = #f07178
-- blue    = #82aaff
-- green   = #c3e88d
-- yellow  = #ffcb6b
-- purple  = #c792ea
-- cyan    = #89ddff

local M = {}

local utils = require('heirline.utils')
local palette = {
    green = utils.get_highlight('diffAdded').fg,
    orange = utils.get_highlight('diffNewFile').fg,

    base_fg = utils.get_highlight('StatusLine').fg,
    base_bg = utils.get_highlight('Folded').bg,

    main_fg = utils.get_highlight('StatusLine').fg,
    main_bg = '#282828',

    sub_fg = utils.get_highlight('StatusLine').fg,
    sub_bg = utils.get_highlight('Folded').bg,

    modifier = utils.get_highlight('Directory').fg,

    mode_fg = utils.get_highlight('Folded').bg,
    mode_bg = '#282828', -- separator
    normal_mode = '#ff9800',
    insert_mode = '#009688',
    visual_mode = '#ab47bc',
    replace_mode = '#f07178',
    command_mode = '#00bcd4',
    inactive_mode = '#282828',
    -- normal_mode = '#ff9800',
    -- insert_mode = '#c3e88d',
    -- visual_mode = '#c792ea',
    -- replace_mode = '#f07178',
    -- command_mode = '#89ddff',
    -- inactive_mode = '#282828',

    git_del = utils.get_highlight('diffDeleted').fg,
    git_add = utils.get_highlight('diffAdded').fg,
    git_change = utils.get_highlight('diffChanged').fg,

    -- base_bg
    diag_warn_fg = utils.get_highlight('Normal').bg,
    diag_error_fg = utils.get_highlight('Normal').bg,
    diag_info_fg = utils.get_highlight('Normal').bg,
    diag_hint_fg = utils.get_highlight('Normal').bg,

    diag_warn_bg = utils.get_highlight('DiagnosticWarn').fg,
    diag_error_bg = utils.get_highlight('DiagnosticError').fg,
    diag_info_bg = utils.get_highlight('DiagnosticInfo').fg,
    diag_hint_bg = utils.get_highlight('DiagnosticHint').fg,

    winbar_fg = utils.get_highlight('StatusLine').fg,
    winbar_bg = utils.get_highlight('Normal').bg,
}

M.set = function()
    require('heirline').reset_highlights()
    require('heirline').clear_colors()
    require('heirline').load_colors(palette)
end

return M
