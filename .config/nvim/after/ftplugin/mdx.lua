vim.opt.expandtab = false

vim.treesitter.language.register('markdown', 'mdx')

local ft = require('Comment.ft')
ft.mdx = '{/* %s */}'
