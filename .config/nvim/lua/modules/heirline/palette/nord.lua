-- nord1  = '#3b4252',
-- nord3  = '#4c566a',
-- nord5  = '#e5e9f0',
-- nord6  = '#eceff4',
-- nord7  = '#8fbcbb',
-- nord8  = '#88c0d0',
-- nord13 = '#ebcb8b',

local M = {}

local utils = require('heirline.utils')
local palette = {
    green = utils.get_highlight('diffAdded').fg,
    orange = utils.get_highlight('diffNewFile').fg,

    base_fg = utils.get_highlight('StatusLineNC').fg,
    base_bg = utils.get_highlight('StatusLineNC').bg,

    main_fg = utils.get_highlight('StatusLine').fg,
    main_bg = utils.get_highlight('StatusLine').bg,

    sub_fg = utils.get_highlight('StatusLineNC').fg,
    sub_bg = utils.get_highlight('StatusLineNC').bg,

    modifier = utils.get_highlight('Directory').fg,

    mode_fg = utils.get_highlight('StatusLineNC').bg,
    mode_bg = utils.get_highlight('StatusLine').bg, -- separator
    normal_mode = '#81A1C1',
    insert_mode = '#d8dee9',
    visual_mode = '#8fbcbb',
    replace_mode = '#bf616a',
    command_mode = '#b48ead',
    inactive_mode = utils.get_highlight('StatusLineNC').bg,

    git_del = utils.get_highlight('diffDeleted').fg,
    git_add = utils.get_highlight('diffAdded').fg,
    git_change = utils.get_highlight('diffChanged').fg,

    diag_warn_fg = '#b48ead',
    diag_error_fg = '#bf616a',
    diag_info_fg = '#88c0d0', -- "#5e81ac"
    diag_hint_fg = '#ebcb8b',

    -- sub_bg
    diag_warn_bg = utils.get_highlight('StatusLineNC').bg,
    diag_error_bg = utils.get_highlight('StatusLineNC').bg,
    diag_info_bg = utils.get_highlight('StatusLineNC').bg,
    diag_hint_bg = utils.get_highlight('StatusLineNC').bg,

    winbar_fg = utils.get_highlight('StatusLineNC').fg,
    winbar_bg = utils.get_highlight('Normal').bg,
}

M.set = function()
    require('heirline').reset_highlights()
    require('heirline').clear_colors()
    require('heirline').load_colors(palette)
end

return M
