return {
    {
        'cocopon/iceberg.vim',
        ft = { 'rust', 'toml', 'go' },
        priority = 1000,
    },
    {
        'shaunsingh/nord.nvim',
        ft = { 'lua' },
        priority = 1000,
    },
    {
        'svrana/neosolarized.nvim',
        dependencies = { 'tjdevries/colorbuddy.nvim' },
        ft = { 'html', 'css', 'scss', 'sass', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
        priority = 1000,
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        ft = { 'cpp', 'markdown', 'python' },
        priority = 1000,
    },
    {
        'marko-cerovac/material.nvim',
        ft = { 'java' },
        priority = 1000,
    },

    -- check
    {
        'nathom/filetype.nvim',
        lazy = false,
        config = function()
            vim.g.did_load_filetypes = 1
            require('filetype').setup({
                overrides = {
                    extensions = {
                        c = 'c',
                    },
                },
            })
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        lazy = false,
        config = function()
            require('modules.treesitter')
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        event = 'VeryLazy',
        config = function()
            require('modules.treesitter.context')
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('modules.treesitter.textobjects')
        end,
    },
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        opts = {
            enable = true,
            enable_autocmd = false,
        },
    },
    {
        'windwp/nvim-ts-autotag',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {
            -- enable_close = true, -- Auto close tags
            -- enable_rename = true, -- Auto rename pairs of tags
            -- enable_close_on_slash = false, -- Auto close on trailing </
        },
    },
    {
        'HiPhish/rainbow-delimiters.nvim',
        config = function()
            require('modules.rainbow-delimiters')
        end,
    },
    {
        'andymass/vim-matchup',
        event = 'VeryLazy',
        config = function()
            vim.g.matchup_matchparen_enabled = 0
            require('match-up').setup({
                treesitter = {
                    stopline = 500,
                },
            })
        end,
    },
    {
        'haringsrob/nvim_context_vt',
        event = 'VeryLazy',
        config = function()
            require('modules.context_vt')
        end,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {
            --char_list = { '│', '╎', '┆', '┊' },
            --context_char_list = { '│', '╎', '┆', '┊' },
            whitespace = {
                remove_blankline_trail = true,
            },
            -- show_first_indent_level = false,
        },
    },

    {
        'numToStr/Comment.nvim',
        dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
        event = 'VeryLazy',
        config = function()
            require('modules.comment')
        end,
    },

    {
        'mason-org/mason.nvim',
        build = ':MasonUpdate',
        cmd = {
            'Mason',
            'MasonInstall',
            'MasonUninstall',
            'MasonUninstallAll',
            'MasonLog',
        },
        config = function()
            require('modules.lsp.mason').setup()
        end,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
        },
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            require('modules.lsp.lspconfig')
        end,
    },
    {
        'mason-org/mason-lspconfig.nvim',
        dependencies = {
            'mason-org/mason.nvim',
            'neovim/nvim-lspconfig',
        },
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            require('modules.lsp.mason').lspconfig()
        end,
    },
    {
        'ray-x/lsp_signature.nvim',
        event = 'InsertEnter',
        opts = {},
    },

    {
        'nvimtools/none-ls.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'jay-babu/mason-null-ls.nvim',
                config = function()
                    require('modules.lsp.mason').null_ls()
                end,
            },
            'nvimtools/none-ls-extras.nvim',
        },
        event = 'LspAttach',
        config = function()
            require('modules.lsp.null-ls')
        end,
    },

    {
        'glepnir/lspsaga.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-treesitter/nvim-treesitter',
        },
        event = 'LspAttach',
        config = function()
            require('modules.lsp.lspsaga')
        end,
    },
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        cmd = { 'Trouble', 'TroubleToggle', 'TroubleRefresh' },
        config = function()
            require('modules.lsp.trouble')
        end,
    },
    {
        'j-hui/fidget.nvim',
        event = 'VeryLazy',
        opts = {
            progress = {
                display = {
                    progress_icon = {
                        pattern = 'meter',
                        period = 2,
                    },
                    done_ttl = 2,
                },
            },
        },
    },

    {
        'mrcjkb/rustaceanvim',
        version = '^9',
        lazy = false,
    },
    {
        'timtro/glslView-nvim',
        ft = 'glsl',
        opts = {
            viewer_path = 'glslViewer',
            args = { '-l' },
        },
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {
                'onsails/lspkind.nvim',
                config = function()
                    require('modules.lsp.lspkind')
                end,
            },
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lua',
        },
        event = 'InsertEnter',
        config = function()
            require('modules.lsp.cmp')
        end,
    },
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.5.0',
        event = 'InsertEnter',
        config = function()
            require('modules.lsp.luasnip')
        end,
    },

    {
        'windwp/nvim-autopairs',
        dependencies = { 'hrsh7th/nvim-cmp' },
        event = 'InsertEnter',
        config = function()
            require('modules.autopairs')
        end,
    },
    {
        'kylechui/nvim-surround',
        version = '^4.0.0',
        event = 'VeryLazy',
        opts = {},
    },

    {
        'famiu/bufdelete.nvim',
        cmd = 'Bdelete',
        keys = {
            {
                '<leader>bd',
                '<cmd>Bdelete<CR>',
                silent = true,
                desc = 'Delete Buffer',
            },
        },
    },
    {
        'kwkarlwang/bufresize.nvim',
        event = 'BufWinEnter',
        opts = {},
    },
    {
        'akinsho/bufferline.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        init = function()
            require('modules.bufferline').set_map()
        end,
    },
    {
        'rebelot/heirline.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'lewis6991/gitsigns.nvim',
            'glepnir/lspsaga.nvim',
        },
        event = 'UIEnter',
        config = function()
            require('modules.heirline')
        end,
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            {
                'stevearc/stickybuf.nvim',
                config = function()
                    require('stickybuf').setup()
                end,
            },
        },
        cmd = 'NvimTreeFindFileToggle',
        keys = {
            {
                '<leader>f',
                '<cmd>NvimTreeFindFileToggle<CR>',
                silent = true,
                desc = 'Explorer',
            },
        },
        config = function()
            require('modules.nvim-tree')
        end,
    },

    {
        'AckslD/nvim-neoclip.lua',
        dependencies = {
            { 'kkharji/sqlite.lua', module = 'sqlite' },
            -- you'll need at least one of these
            -- {'nvim-telescope/telescope.nvim'},
            -- {'ibhagwan/fzf-lua'},
        },
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('modules.telescope.neoclip')
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        version = 'v0.2.2',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
            { 'nvim-telescope/telescope-symbols.nvim' },
            { 'jvgrootveld/telescope-zoxide' },
        },
        keys = {
            {
                '<Leader>tf',
                function()
                    require('telescope.builtin').find_files()
                end,
                silent = true,
                desc = 'Find files',
            },
            {
                '<Leader>tg',
                function()
                    require('telescope.builtin').live_grep()
                end,
                silent = true,
                desc = 'Live grep',
            },
            {
                '<Leader>tb',
                function()
                    require('telescope.builtin').buffers()
                end,
                silent = true,
                desc = 'Buffers',
            },
            {
                '<Leader>to',
                function()
                    require('telescope.builtin').oldfiles()
                end,
                silent = true,
                desc = 'Old files',
            },
            {
                '<Leader>th',
                function()
                    require('telescope.builtin').help_tags()
                end,
                silent = true,
                desc = 'Help tags',
            },
            {
                '<Leader>tc',
                function()
                    require('telescope').load_extension('neoclip')
                    require('telescope').extensions.neoclip.default()
                end,
                silent = true,
                desc = 'Neoclip',
            },
            {
                '<C-g>c',
                function()
                    require('telescope').load_extension('neoclip')
                    require('telescope').extensions.neoclip.default()
                end,
                mode = 'i',
                silent = true,
                desc = 'Neoclip',
            },
            {
                '<Leader>cd',
                function()
                    require('telescope').load_extension('zoxide')
                    require('telescope').extensions.zoxide.list()
                end,
                silent = true,
                desc = 'Zoxide list',
            },
            {
                '<Leader>ge',
                function()
                    require('telescope.builtin').symbols({ sources = { 'emoji' } })
                end,
                silent = true,
                desc = 'Emoji symbols',
            },
            {
                '<C-g>e',
                function()
                    require('telescope.builtin').symbols({ sources = { 'emoji' } })
                end,
                mode = 'i',
                silent = true,
                desc = 'Emoji symbols',
            },
            {
                '<Leader>gi',
                function()
                    require('telescope.builtin').symbols({ sources = { 'gitmoji' } })
                end,
                silent = true,
                desc = 'Gitmoji symbols',
            },
            {
                '<C-g>i',
                function()
                    require('telescope.builtin').symbols({ sources = { 'gitmoji' } })
                end,
                mode = 'i',
                silent = true,
                desc = 'Gitmoji symbols',
            },
        },
        config = function()
            require('modules.telescope')
        end,
    },

    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('modules.gitsigns')
        end,
    },

    {
        'brenoprata10/nvim-highlight-colors',
        ft = {
            'vim',
            'lua',
            'html',
            'css',
            'scss',
            'sass',
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
        },
        config = function()
            require('modules.nvim-highlight-colors')
        end,
    },

    {
        'jghauser/mkdir.nvim',
        event = 'CmdlineEnter',
        -- event = 'VeryLazy',
    },

    {
        'folke/zen-mode.nvim',
        dependencies = {
            { 'folke/twilight.nvim' },
        },
        cmd = 'ZenMode',
        opts = {},
    },

    {
        'dstein64/vim-startuptime',
        cmd = 'StartupTime',
    },
}
