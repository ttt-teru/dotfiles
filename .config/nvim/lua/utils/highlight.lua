local M = {}

M.set_hl = function(opts)
    for name, value in pairs(opts) do
        vim.api.nvim_set_hl(0, name, value)
    end
end

return M
