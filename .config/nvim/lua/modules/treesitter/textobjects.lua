require('nvim-treesitter-textobjects').setup({
    select = {
        enable = true,
        lookahead = true,
        keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
        },
        selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
        },
        include_surrounding_whitespace = false,
    },
    swap = {
        enable = true,
        swap_next = {
            ['<Leader>a'] = '@parameter.inner',
        },
        swap_previous = {
            ['<Leader>i'] = '@parameter.inner',
        },
    },
    move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
            [']]'] = '@function.outer',
            [']c'] = { query = '@class.outer', desc = 'Next class start' },
        },
        goto_previous_start = {
            ['[['] = '@function.outer',
            ['[c'] = '@class.outer',
        },
        goto_next_end = {
            [']}'] = '@function.outer',
            [']C'] = '@class.outer',
        },
        goto_previous_end = {
            ['[{'] = '@function.outer',
            ['[C'] = '@class.outer',
        },
    },
})
