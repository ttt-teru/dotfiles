local M = {}

function M.setup()
    local n = require('neosolarized').setup({
        comment_italics = true,
        background_set = true,
    })
    vim.cmd.colorscheme('neosolarized')

    local cb = require('colorbuddy.init')
    local Color = cb.Color
    local colors = cb.colors
    local Group = cb.Group
    local groups = cb.groups
    local styles = cb.styles

    Color.new('black', '#000000')
    Color.new('green', '#719e07')
    Color.new('orange', '#b58900')

    n.Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
    n.Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)
    n.Group.new('Visual', colors.none, colors.base03, styles.reverse)
    n.Group.new('MatchParen', colors.none, colors.base03, styles.reverse)
    n.Group.new('IndentBlanklineChar', colors.base01)
    n.Group.new('IndentBlanklineContextChar', colors.base1)
    n.Group.link('NormalFloat', groups.Normal)
    n.Group.link('FloatBorder', groups.Normal)
    n.Group.new('diffAdded', colors.green)
    n.Group.new('diffNewFile', colors.orange)

    local cError = groups.Error.fg
    local cInfo = groups.Information.fg
    local cWarn = groups.Warning.fg
    local cHint = groups.Hint.fg

    n.Group.new('DiagnosticVirtualTextError', cError, cError:dark():dark():dark():dark(), styles.NONE)
    n.Group.new('DiagnosticVirtualTextInfo', cInfo, cInfo:dark():dark():dark(), styles.NONE)
    n.Group.new('DiagnosticVirtualTextWarn', cWarn, cWarn:dark():dark():dark(), styles.NONE)
    n.Group.new('DiagnosticVirtualTextHint', cHint, cHint:dark():dark():dark(), styles.NONE)
    n.Group.new('DiagnosticUnderlineError', colors.none, colors.none, styles.undercurl, cError)
    n.Group.new('DiagnosticUnderlineWarn', colors.none, colors.none, styles.undercurl, cWarn)
    n.Group.new('DiagnosticUnderlineInfo', colors.none, colors.none, styles.undercurl, cInfo)
    n.Group.new('DiagnosticUnderlineHint', colors.none, colors.none, styles.undercurl, cHint)
end

return M
