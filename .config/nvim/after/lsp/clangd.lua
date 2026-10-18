-- local query_driver = require('utils.by_os')({
--   macunix = '/usr/bin/clang++,/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++',
--   win = '$HOME\\scoop\\apps\\gcc\\current\\bin\\g++.exe,$HOME\\scoop\\apps\\mingw\\current\\bin\\g++.exe',
-- })

---@type vim.lsp.Config
return {
    single_file_support = true,
    workspace_required = false,
    cmd = {
        'clangd',
        '--background-index',
        '--pch-storage=memory',
        -- You MUST set this arg ↓ to your c/cpp compiler location (if not included)!
        -- query_driver,
        '--clang-tidy',
        '--all-scopes-completion',
        '--completion-style=detailed',
        '--header-insertion-decorators',
        '--header-insertion=iwyu',
        '--enable-config',
    },
}
