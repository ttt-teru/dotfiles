vim.cmd('autocmd!')

vim.cmd([[
    filetype plugin indent on

    " Other than xterm-256color
    "let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    "let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    " undercurl
    let &t_Cs = "\e[4:3m"
    let &t_Ce = "\e[4:0m"

    language en_US.UTF-8
    language message en_US.UTF-8
    "language ja_JP.UTF-8
    "language message ja_JP.UTF-8
]])

local opt = vim.opt

opt.synmaxcol = 300 -- Syntax highlighting limit
opt.updatetime = 300 -- Faster completion
opt.redrawtime = 10000
opt.maxmempattern = 20000

opt.encoding = 'utf-8'
opt.fileformats = { 'unix', 'mac', 'dos' }
opt.fileencodings = { 'utf-8', 'iso-2022-jp', 'euc-jp', 'sjis' }
opt.mouse = ''

opt.number = true
opt.relativenumber = true
opt.title = true
opt.showmode = false
opt.showmatch = true
opt.matchpairs = { '(:)', '{:}', '[:]', '<:>' }
opt.backspace = { 'indent', 'eol', 'start' }
opt.splitright = true
opt.termguicolors = true
opt.hidden = true
opt.showtabline = 2
opt.helpheight = 999
opt.scrolloff = 5
opt.sidescrolloff = 5
vim.api.nvim_create_autocmd('Filetype', {
    pattern = '*',
    command = 'setlocal formatoptions-=ro',
})
vim.g.completeopt = 'menu,menuone,noinsert,noselect'
vim.o.pumheight = 15
vim.o.cmdheight = 0
vim.o.laststatus = 3
vim.o.signcolumn = 'yes'

--vim.o.showbreak='↪'
opt.whichwrap = 'b,s,h,l'
opt.autoindent = true
opt.breakindent = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 0

opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = true
opt.hlsearch = true
