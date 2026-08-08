-- base03  =  '#002b36',
-- base02  =  '#073642',
-- base01  =  '#586e75',
-- base00  =  '#657b83',
-- base0   =  '#839496',
-- base1   =  '#93a1a1',
-- base2   =  '#eee8d5',
-- base3   =  '#fdf6e3',
-- yellow  =  '#b58900',
-- orange  =  '#cb4b16',
-- red     =  '#dc322f',
-- magenta =  '#d33682',
-- violet  =  '#6c71c4',
-- blue    =  '#268bd2',
-- cyan    =  '#2aa198',
-- green   =  '#859900',

local M = {}

local utils = require('heirline.utils')
local palette = {
    green = utils.get_highlight('diffAdded').fg,
    orange = utils.get_highlight('diffNewFile').fg,

    base_fg = utils.get_highlight('StatusLineNC').fg,
    base_bg = utils.get_highlight('StatusLineNC').bg,

    main_fg = utils.get_highlight('StatusLine').bg,
    main_bg = utils.get_highlight('StatusLine').fg,

    sub_fg = utils.get_highlight('StatusLine').fg,
    sub_bg = utils.get_highlight('StatusLineNC').bg,

    modifier = utils.get_highlight('Directory').fg,

    mode_fg = utils.get_highlight('StatusLineNC').bg,
    mode_bg = utils.get_highlight('StatusLine').fg, -- separator
    normal_mode = '#268bd2',
    insert_mode = '#859900',
    visual_mode = '#d33682',
    replace_mode = '#dc322f',
    command_mode = '#268bd2',
    inactive_mode = '#073642',

    git_del = utils.get_highlight('diffDeleted').fg,
    git_add = utils.get_highlight('diffAdded').fg,
    git_change = utils.get_highlight('diffChanged').fg,

    diag_warn_fg = utils.get_highlight('DiagnosticWarn').fg,
    diag_error_fg = utils.get_highlight('DiagnosticError').fg,
    diag_info_fg = utils.get_highlight('DiagnosticInfo').fg,
    diag_hint_fg = utils.get_highlight('DiagnosticHint').fg,

    -- sub_bg
    diag_warn_bg = utils.get_highlight('StatusLineNC').bg,
    diag_error_bg = utils.get_highlight('StatusLineNC').bg,
    diag_info_bg = utils.get_highlight('StatusLineNC').bg,
    diag_hint_bg = utils.get_highlight('StatusLineNC').bg,

    winbar_fg = utils.get_highlight('StatusLine').fg,
    winbar_bg = utils.get_highlight('Normal').bg,
}

M.set = function()
    require('heirline').reset_highlights()
    require('heirline').clear_colors()
    require('heirline').load_colors(palette)
end

return M
