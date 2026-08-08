-- blue = "#89b4fa",
-- crust = "#11111b",
-- flamingo = "#f2cdcd",
-- green = "#a6e3a1",
-- lavender = "#b4befe",
-- mantle = "#181825",
-- maroon = "#eba0ac",
-- mauve = "#cba6f7",
-- overlay0 = "#6c7086",
-- overlay1 = "#7f849c",
-- overlay2 = "#9399b2",
-- peach = "#fab387",
-- pink = "#f5c2e7",
-- red = "#f38ba8",
-- rosewater = "#f5e0dc",
-- sapphire = "#74c7ec",
-- sky = "#89dceb",
-- subtext0 = "#a6adc8",
-- subtext1 = "#bac2de",
-- surface0 = "#313244",
-- surface1 = "#45475a",
-- surface2 = "#585b70",
-- teal = "#94e2d5",
-- text = "#cdd6f4",
-- yellow = "#f9e2af"

local M = {}

local utils = require('heirline.utils')
local palette = {
    green = utils.get_highlight('diffAdded').fg,
    orange = utils.get_highlight('diffNewFile').fg,

    base_fg = utils.get_highlight('StatusLine').fg,
    base_bg = utils.get_highlight('Normal').bg,

    main_fg = utils.get_highlight('StatusLine').fg,
    main_bg = utils.get_highlight('Visual').bg,

    sub_fg = utils.get_highlight('StatusLine').fg,
    sub_bg = utils.get_highlight('Visual').bg,

    modifier = utils.get_highlight('Directory').fg,

    mode_fg = utils.get_highlight('Normal').bg,
    mode_bg = utils.get_highlight('Normal').bg, -- separator
    normal_mode = '#89b4fa',
    insert_mode = '#a6e3a1',
    visual_mode = '#cba6f7',
    replace_mode = '#f38ba8',
    command_mode = '#fab387',
    inactive_mode = '#181825',

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
