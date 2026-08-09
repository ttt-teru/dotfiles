local M = {}

local common_hl = {
    NormalFloat = { link = 'Normal' },
    FloatBorder = { link = 'Normal' },

    RainbowDelimiterRed = { link = 'rainbowcol3' },
    RainbowDelimiterOrange = { link = 'rainbowcol2' },
    RainbowDelimiterYellow = { link = 'rainbowcol7' },
    RainbowDelimiterGreen = { link = 'rainbowcol4' },
    RainbowDelimiterCyan = { link = 'rainbowcol5' },
    RainbowDelimiterBlue = { link = 'rainbowcol6' },
    RainbowDelimiterViolet = { link = 'rainbowcol1' },

    TreesitterContext = { link = 'Pmenu' },
}

local function common_fn()
    -- require('nvim-web-devicons').set_up_highlights()
    -- vim.cmd('redrawstatus')
end

M.iceberg = function()
    vim.g.heirlineDelimiters = {
        main_separators = { left = '', right = '', hl = { fg = 'fg', bg = 'bg' } },
        middle_separators = { left = '', right = '', hl = { fg = 'fg', bg = 'bg' } },
        sub_separators = { left = '|', right = '|', hl = { fg = 'sub_fg', bg = 'sub_bg' } },
    }
    vim.cmd.colorscheme('iceberg')
    require('highlight.iceberg').set_hl()
    require('utils.highlight').set_hl(table.merge(common_hl, {
        Comment = { ctermfg = 242, fg = '#6B7089', italic = true },
        diffNewFile = { fg = '#e2a478' },
    }))
    require('modules.heirline.palette.iceberg').set()
    require('modules.bufferline').setup({
        separator_style = 'slant',
    })
    common_fn()
end

M.neosolarized = function()
    vim.g.heirlineDelimiters = {
        main_separators = { left = '', right = '', hl = { fg = 'main_bg', bg = 'main_fg' } },
        middle_separators = { left = '', right = '', hl = { fg = 'fg', bg = 'bg' } },
        sub_separators = { left = '', right = '', hl = { fg = 'sub_fg', bg = 'sub_bg' } }, -- 
    }
    require('highlight.neosolarized').setup()
    require('modules.heirline.palette.neosolarized').set()
    require('modules.bufferline').setup({
        separator_style = 'slant',
    })
    common_fn()
end

M.nord = function()
    vim.g.heirlineDelimiters = {
        main_separators = { left = '', right = '', hl = { fg = 'main_bg', bg = 'base_bg' } },
        middle_separators = { left = '', right = '', hl = { fg = 'fg', bg = 'bg' } },
        sub_separators = { left = '', right = '', hl = { fg = 'fg', bg = 'bg' } },
    }
    require('nord').set()
    require('utils.highlight').set_hl(table.merge(common_hl, {
        MatchParen = { bg = '#434C5E', bold = true },
        Comment = { fg = '#616e88', cterm = italic, italic = true },
    }))
    require('modules.heirline.palette.nord').set()
    require('modules.bufferline').setup({
        separator_style = 'thin',
    })
    common_fn()
end

M.catppuccin = function()
    vim.g.heirlineDelimiters = {
        main_separators = { left = '', right = '', hl = { fg = 'main_bg', bg = 'base_bg', bold = true } },
        middle_separators = { left = '', right = '', hl = { fg = 'base_bg', bg = 'main_bg', bold = true } },
        sub_separators = { left = '', right = '', hl = { fg = 'base_bg', bg = 'main_bg', bold = true } },
    }
    require('highlight.catppuccin')
    vim.cmd.colorscheme('catppuccin-mocha')
    require('utils.highlight').set_hl({
        NormalFloat = { link = 'Normal' },
        FloatBorder = { link = 'Normal' },
        SagaFolderName = { link = 'Delimiter' },
        SagaFileName = { link = 'Delimiter' },
    })
    require('modules.heirline.palette.catppuccin').set()
    require('modules.bufferline').setup({
        separator_style = 'slant',
        highlights = require('catppuccin.special.bufferline').get_theme(),
    })
    require('lspsaga').setup({
        ui = {
            kind = require('catppuccin.groups.integrations.lsp_saga').custom_kind(),
        },
    })
    common_fn()
end

M.material = function()
    vim.g.heirlineDelimiters = {
        main_separators = { left = '', right = '', hl = { fg = 'main_bg', bg = 'base_bg' } },
        middle_separators = { left = '', right = '', hl = { fg = 'fg', bg = 'bg' } },
        sub_separators = { left = '', right = '', hl = { fg = 'sub_fg', bg = 'sub_bg' } }, -- 
    }
    vim.cmd.colorscheme('material-darker')
    require('modules.heirline.palette.material').set()
    require('modules.bufferline').setup({
        separator_style = 'slant',
    })
    common_fn()
end

M.default = function()
    vim.g.heirlineDelimiters = {
        main_separators = { left = '', right = '', hl = { fg = 'fg', bg = 'bg' } },
        middle_separators = { left = '', right = '', hl = { fg = 'fg', bg = 'bg' } },
        sub_separators = { left = '', right = '', hl = { fg = 'fg', bg = 'bg' } },
    }
    vim.cmd.colorscheme('ownDefault')
    require('utils.highlight').set_hl(common_hl)
    require('modules.heirline.palette.ownDefault').set()
    require('modules.bufferline').setup({
        separator_style = 'thin',
    })
    common_fn()
end

return M
