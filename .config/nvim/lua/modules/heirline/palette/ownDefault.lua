-- black = '#000000',
-- white = '#c7c7c7',
-- lightgray = '#b2b2b2',

local M = {}

local utils = require('heirline.utils')

local palette = {
    green = utils.get_highlight('diffAdded').fg,
    orange = utils.get_highlight('diffNewFile').fg,

    base_fg = utils.get_highlight('Normal').bg,
    base_bg = utils.get_highlight('Normal').fg,

    main_fg = utils.get_highlight('Normal').bg,
    main_bg = utils.get_highlight('Normal').fg,

    sub_fg = utils.get_highlight('Normal').bg,
    sub_bg = utils.get_highlight('Normal').fg,

    modifier = utils.get_highlight('Normal').bg,

    mode_fg = utils.get_highlight('Normal').bg,
    mode_bg = utils.get_highlight('Normal').fg, -- separator
    normal_mode = utils.get_highlight('Normal').fg,
    insert_mode = utils.get_highlight('Normal').fg,
    visual_mode = utils.get_highlight('Normal').fg,
    replace_mode = utils.get_highlight('Normal').fg,
    command_mode = utils.get_highlight('Normal').fg,
    inactive_mode = utils.get_highlight('Normal').fg,

    git_del = utils.get_highlight('diffDeleted').fg,
    git_add = utils.get_highlight('diffAdded').fg,
    git_change = utils.get_highlight('diffChanged').fg,

    diag_warn_fg = utils.get_highlight('Normal').bg,
    diag_error_fg = utils.get_highlight('Normal').bg,
    diag_info_fg = utils.get_highlight('Normal').bg,
    diag_hint_fg = utils.get_highlight('Normal').bg,

    -- sub_bg
    diag_warn_bg = utils.get_highlight('Normal').fg,
    diag_error_bg = utils.get_highlight('Normal').fg,
    diag_info_bg = utils.get_highlight('Normal').fg,
    diag_hint_bg = utils.get_highlight('Normal').fg,

    winbar_fg = utils.get_highlight('Normal').fg,
    winbar_bg = utils.get_highlight('Normal').bg,
}

M.set = function()
    require('heirline').reset_highlights()
    require('heirline').clear_colors()
    require('heirline').load_colors(palette)
end

return M
