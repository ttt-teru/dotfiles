require('nvim-treesitter').setup({
    install_dir = vim.fn.stdpath('data') .. '/site',
})

require('nvim-treesitter').install({
    'bash',
    'c',
    'cmake',
    'cpp',
    'css',
    'dockerfile',
    'gitignore',
    'glsl',
    'go',
    'gomod',
    'gowork',
    'html',
    'java',
    'javascript',
    'jsdoc',
    'json',
    'llvm',
    'lua',
    'make',
    'markdown',
    'markdown_inline',
    'python',
    'query',
    'rust',
    'toml',
    'tsx',
    'typescript',
    'typst',
    'vim',
    'vimdoc',
    'yaml',
})

local ignore_filetypes = {
    'NvimTree',
    'TelescopePrompt',
    'Trouble',
    'checkhealth',
    'lazy',
    'mason',
}

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('treesitter.setup', {}),
    callback = function(args)
        local buf = args.buf
        local filetype = args.match

        -- you need some mechanism to avoid running on buffers that do not
        -- correspond to a language (like oil.nvim buffers), this implementation
        if vim.tbl_contains(ignore_filetypes, filetype) then
            return
        end

        -- checks if a parser exists for the current language
        -- The alternative is "pcall(vim.treesitter.start)"
        local language = vim.treesitter.language.get_lang(filetype) or filetype
        if not vim.treesitter.language.add(language) then
            return
        end

        -- replicate `fold = { enable = true }`
        -- vim.wo.foldmethod = 'expr'
        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

        -- replicate `highlight = { enable = true }`
        vim.treesitter.start(buf, language)
        -- ?additional_vim_regex_highlighting = false,

        -- replicate `indent = { enable = true }`
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
