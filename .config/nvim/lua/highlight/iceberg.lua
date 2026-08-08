-- Note: original config
-- highlight! CmpItemKindField guifg=#EED8DA guibg=#B5585F
-- highlight! CmpItemKindText guifg=#C3E88D guibg=#9FBD73
-- highlight! CmpItemKindConstant guifg=#FFE082 guibg=#D4BB6C
-- highlight! CmpItemKindVariable guifg=#C5CDD9 guibg=#7E8294
-- highlight! link CmpItemKindUnit
-- highlight! CmpItemKindMethod guifg=#DDE5F5 guibg=#6C8ED4
-- highlight! link CmpItemKindInterface

local M = {}

local conf = {
    CmpItemAbbrDeprecated = { fg = '#808080', bg = 'NONE', strikethrough = true },
    CmpItemAbbrMatch = { fg = '#82AAFF', bg = 'NONE', bold = true },
    CmpItemAbbrMatchFuzzy = { fg = '#82AAFF', bg = 'NONE', bold = true },
    CmpItemMenu = { fg = '#C792EA', bg = 'NONE', italic = true },

    CmpItemKindField = { link = 'TSField' },
    CmpItemKindProperty = { link = 'CmpItemKindField' },
    CmpItemKindEvent = { link = 'CmpItemKindField' },

    CmpItemKindText = { link = 'TSText' },
    CmpItemKindEnum = { link = 'CmpItemKindText' },
    CmpItemKindKeyword = { link = 'CmpItemKindText' },

    CmpItemKindConstant = { link = 'Constant' },
    CmpItemKindConstructor = { link = 'CmpItemKindConstant' },
    CmpItemKindReference = { link = 'CmpItemKindConstant' },

    -- CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
    CmpItemKindFunction = { link = 'Function', default },
    CmpItemKindStruct = { link = 'CmpItemKindFunction' },
    CmpItemKindClass = { link = 'CmpItemKindFunction' },
    CmpItemKindModule = { link = 'CmpItemKindFunction' },
    CmpItemKindOperator = { link = 'CmpItemKindFunction' },

    CmpItemKindVariable = { link = 'TSVariable' },
    CmpItemKindFile = { link = 'CmpItemKindVariable' },

    CmpItemKindUnit = { fg = '#F5EBD9', bg = '#D4A959' },
    CmpItemKindSnippet = { link = 'CmpItemKindUnit' },
    CmpItemKindFolder = { link = 'CmpItemKindUnit' },

    CmpItemKindMethod = { link = 'TSMethod' },
    CmpItemKindValue = { link = 'CmpItemKindMethod' },
    CmpItemKindEnumMember = { link = 'CmpItemKindMethod' },

    CmpItemKindInterface = { fg = '#D8EEEB', bg = '#58B5A8' },
    CmpItemKindColor = { link = 'CmpItemKindInterface' },
    CmpItemKindTypeParameter = { link = 'CmpItemKindInterface' },

    IndentBlanklineChar = { fg = '#242940', nocombine = true },
    IndentBlanklineContextChar = { fg = '#84a0c6', nocombine = true },
    IndentBlanklineSpaceCharBlankline = { fg = '#242940', nocombine = true },
    IndentBlanklineSpaceChar = { fg = '#242940', nocombine = true },
    IndentBlanklineContextStart = { sp = '#84a0c6', underline = true },

    rainbowcol1 = { fg = '#A093C7', bg = 'NONE' },
    rainbowcol2 = { fg = '#E2A478', bg = 'NONE' },
    rainbowcol3 = { fg = '#E27878', bg = 'NONE' },
    rainbowcol4 = { fg = '#B4BE82', bg = 'NONE' },
    rainbowcol5 = { fg = '#89B8C2', bg = 'NONE' },
    rainbowcol6 = { fg = '#84A0C6', bg = 'NONE' },
    rainbowcol7 = { fg = '#BFBB82', bg = 'NONE' },
}

M.set_hl = function()
    require('utils.highlight').set_hl(conf)
end

return M
