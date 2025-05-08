return {
  {
    'cocopon/iceberg.vim',
    ft = { 'rust', 'toml', 'go' },
  },
  {
    'shaunsingh/nord.nvim',
    ft = { 'lua' },
  },
  {
    'svrana/neosolarized.nvim',
    dependencies = { 'tjdevries/colorbuddy.nvim' },
    ft = { 'html', 'css', 'scss', 'sass', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    ft = { 'cpp', 'markdown', 'python' },
  },
  {
    'marko-cerovac/material.nvim',
    ft = { 'java' },
  },

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
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
          require('modules.treesitter.context')
        end,
      },
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'windwp/nvim-ts-autotag',
      {
        'HiPhish/rainbow-delimiters.nvim',
        config = function()
          require('modules.rainbow-delimiters')
        end,
      },
      {
        'andymass/vim-matchup',
        config = function()
          vim.g.matchup_matchparen_enabled = 0
        end,
      },
      {
        'haringsrob/nvim_context_vt',
        config = function()
          require('modules.context_vt')
        end,
      },
      {
        'lukas-reineke/indent-blankline.nvim',
        tag = 'v2.20.8',
        config = function()
          require('modules.indent-blankline')
        end,
      },
    },
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('modules.treesitter')
    end,
  },
  {
    'nvim-treesitter/playground',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    cmd = {
      'TSPlaygroundToggle',
      'TSNodeUnderCursor',
    },
  },

  {
    'numToStr/Comment.nvim',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    event = { 'VeryLazy' },
    config = function()
      require('modules.comment')
    end,
  },

  {
    'williamboman/mason.nvim',
    config = function()
      require('modules.lsp.mason').setup()
    end,
    build = ':MasonUpdate',
    lazy = false,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
          'williamboman/mason.nvim',
        },
        config = function()
          require('modules.lsp.mason').lspconfig()
        end,
      },
      'ray-x/lsp_signature.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('modules.lsp.lspconfig')
    end,
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
    version = '^4', -- Recommended
    -- lazy = false, -- This plugin is already lazy
    ft = 'rust',
    -- config = function()
    --   require('modules.lsp.lspconfig').rust_setup()
    -- end,
  },
  {
    'timtro/glslView-nvim',
    opts = {
      viewer_path = 'glslViewer',
      args = { '-l' },
    },
    ft = 'glsl',
  },

  {
    'L3MON4D3/LuaSnip',
    -- version = 'v2.*',
    -- build = 'make install_jsregexp',
    config = function()
      require('modules.lsp.luasnip')
    end,
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
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },
    },
    event = 'InsertEnter',
    config = function()
      require('modules.lsp.cmp')
    end,
  },

  {
    'windwp/nvim-autopairs',
    dependencies = { 'nvim-cmp' },
    event = 'InsertEnter',
    config = function()
      require('modules.autopairs')
    end,
  },
  {
    'kylechui/nvim-surround',
    event = 'BufWinEnter',
    config = function()
      require('nvim-surround').setup()
    end,
  },
  {
    'phaazon/hop.nvim',
    event = 'BufWinEnter',
    config = function()
      require('modules.nvim-hop')
    end,
  },
  {
    'mfussenegger/nvim-treehopper',
    dependencies = {
      'phaazon/hop.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    event = 'BufWinEnter',
    config = function()
      require('modules.nvim-treehopper')
    end,
  },

  {
    'famiu/bufdelete.nvim',
    cmd = 'Bdelete',
    init = function()
      vim.keymap.set('n', '<leader>bd', ':Bdelete<CR>', { noremap = true, silent = true })
    end,
  },
  {
    'kwkarlwang/bufresize.nvim',
    event = 'BufWinEnter',
    config = function()
      require('bufresize').setup()
    end,
  },
  {
    'akinsho/bufferline.nvim',
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
    init = function()
      vim.keymap.set('n', '<leader>f', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
    end,
    config = function()
      require('modules.nvim-tree')
    end,
  },

  {
    'AckslD/nvim-neoclip.lua',
    config = function()
      require('modules.telescope.neoclip')
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-symbols.nvim' },
      { 'jvgrootveld/telescope-zoxide' },
      {
        'ahmedkhalf/project.nvim',
        config = function()
          require('project_nvim').setup({
            manual_mode = true,
          })
        end,
      },
    },
    init = function()
      local function builtin(name)
        return function(opt)
          return function()
            return require('telescope.builtin')[name](opt or {})
          end
        end
      end
      local function extensions(name, prop)
        return function(opt)
          return function()
            local telescope = require('telescope')
            telescope.load_extension(name)
            return telescope.extensions[name][prop](opt or {})
          end
        end
      end

      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<Leader>tf', builtin('find_files')(), opts)
      vim.keymap.set('n', '<Leader>tg', builtin('live_grep')(), opts)
      vim.keymap.set('n', '<Leader>to', builtin('oldfiles')(), opts)
      vim.keymap.set('n', '<Leader>tb', builtin('buffers')(), opts)
      vim.keymap.set('n', '<Leader>th', builtin('help_tags')(), opts)
      vim.keymap.set('n', '<Leader>tp', extensions('projects', 'projects')(), opts)
      vim.keymap.set('n', '<Leader>tc', extensions('neoclip', 'default')(), opts)
      vim.keymap.set('i', '<C-g>c', extensions('neoclip', 'default')(), opts)
      vim.keymap.set('n', '<Leader>cd', extensions('zoxide', 'list')(), opts)
      vim.keymap.set('n', '<Leader>ge', builtin('symbols')({ sources = { 'emoji' } }), opts)
      vim.keymap.set('i', '<C-g>e', builtin('symbols')({ sources = { 'emoji' } }), opts)
      vim.keymap.set('n', '<Leader>gi', builtin('symbols')({ sources = { 'gitmoji' } }), opts)
      vim.keymap.set('i', '<C-g>i', builtin('symbols')({ sources = { 'gitmoji' } }), opts)
    end,
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
    'iamcco/markdown-preview.nvim',
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = 'markdown',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    config = function()
      vim.g.mkdp_theme = 'light'
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
  },

  {
    'folke/zen-mode.nvim',
    dependencies = {
      { 'folke/twilight.nvim' },
    },
    cmd = 'ZenMode',
    config = function()
      require('zen-mode').setup()
    end,
  },

  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
  },
}
