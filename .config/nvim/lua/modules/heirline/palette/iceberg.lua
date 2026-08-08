-- color2 = '#161821',
-- color3 = '#b4be82',
-- color4 = '#6b7089',
-- color5 = '#2e313f',
-- color8 = '#e2a478',
-- color9 = '#3e445e',
-- color10 = '#0f1117',
-- color11 = '#17171b',
-- color12 = '#818596',
-- color15 = '#84a0c6',

local M = {}

local utils = require('heirline.utils')
local palette = {
    green = utils.get_highlight('diffAdded').fg,
    orange = utils.get_highlight('diffNewFile').fg,

    base_fg = utils.get_highlight('StatusLineNC').bg,
    base_bg = utils.get_highlight('StatusLineNC').fg,

    main_fg = utils.get_highlight('StatusLine').fg,
    main_bg = utils.get_highlight('StatusLineNC').bg,

    sub_fg = utils.get_highlight('StatusLine').fg,
    sub_bg = utils.get_highlight('StatusLineNC').fg,

    modifier = utils.get_highlight('Directory').fg,

    mode_fg = utils.get_highlight('StatusLineNC').fg,
    mode_bg = utils.get_highlight('StatusLineNC').bg, -- separator
    normal_mode = '#818596',
    insert_mode = '#84a0c6',
    visual_mode = '#b4be82',
    replace_mode = '#e2a478',
    command_mode = '#818596',
    inactive_mode = '#0f1117',

    git_del = utils.get_highlight('diffDeleted').fg,
    git_add = utils.get_highlight('diffAdded').fg,
    git_change = utils.get_highlight('diffChanged').fg,

    diag_warn_fg = utils.get_highlight('DiagnosticWarn').fg,
    diag_error_fg = utils.get_highlight('DiagnosticError').fg,
    diag_info_fg = utils.get_highlight('DiagnosticInfo').fg,
    diag_hint_fg = utils.get_highlight('DiagnosticHint').fg,

    -- sub_bg
    diag_warn_bg = utils.get_highlight('StatusLineNC').fg,
    diag_error_bg = utils.get_highlight('StatusLineNC').fg,
    diag_info_bg = utils.get_highlight('StatusLineNC').fg,
    diag_hint_bg = utils.get_highlight('StatusLineNC').fg,

    winbar_fg = utils.get_highlight('StatusLine').fg,
    winbar_bg = utils.get_highlight('Normal').bg,
}

M.set = function()
    require('heirline').reset_highlights()
    require('heirline').clear_colors()
    require('heirline').load_colors(palette)
end

return M
