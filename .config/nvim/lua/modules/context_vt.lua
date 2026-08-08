require('nvim_context_vt').setup({
    enabled = true,
    highlight = 'ContextVt',
    disable_ft = { 'markdown' },

    -- Disable display of virtual text below blocks for indentation based languages like Python
    -- Default: false
    disable_virtual_lines = false,
    disable_virtual_lines_ft = { 'yaml' },

    -- How many lines required after starting position to show virtual text
    -- Default: 1 (equals two lines total)
    min_rows = 1,
})
