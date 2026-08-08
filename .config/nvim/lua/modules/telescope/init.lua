local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
require('telescope').setup({
    defaults = {
        preview = {
            treesitter = true,
            filesize_limit = 15,
            timeout = 100,
        },
        layout_config = {
            width = 0.8,
            preview_width = 0.5,
            prompt_position = 'bottom',
            scroll_speed = 1,
        },
        winblend = 0,
        sorting_strategy = 'descending',
        prompt_prefix = '  ',
        selection_caret = '  ',
        entry_prefix = '   ',
        set_env = { ['COLORTERM'] = 'truecolor' }, -- Default: nil
        vimgrep_arguments = {
            'rg',
            '--hidden',
            '--follow',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--glob=!{.git,node_modules,.next}/*',
            '--glob=!package-lock.json',
        },
        mappings = {
            i = {
                ['<Esc>'] = actions.close,
                ['<C-f>'] = actions.close,
                ['<C-u>'] = false,
                ['<C-d>'] = false,
                ['<C-y>'] = actions.preview_scrolling_up,
                ['<C-e>'] = actions.preview_scrolling_down,
            },
        },
    },
    pickers = {
        find_files = {
            find_command = {
                'fd',
                '--type=file',
                '--hidden',
                '--follow',
                -- '--strip-cwd-prefix',
                '--exclude=.git',
                '--exclude=node_modules',
                '--exclude=.next',
            },
        },
        registers = {
            theme = 'cursor',
            layout_config = { height = 0.4, width = 0.2 },
        },
        symbols = {
            theme = 'cursor',
            layout_config = { height = 0.5 },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        zoxide = {
            mappings = {
                ['<C-o>'] = {
                    keepinsert = true,
                    action = function(selection)
                        builtin.find_files({ cwd = selection.path })
                    end,
                },
            },
        },
    },
})

require('telescope').load_extension('fzf')
