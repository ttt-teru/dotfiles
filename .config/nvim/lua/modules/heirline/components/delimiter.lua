local M = {}

M.Spacer = { provider = ' ' }
M.Align = { provider = '%=' }

M.LeftMainSeparator = {
    init = function(self)
        self.separator_left = vim.g.heirlineDelimiters.main_separators.left
        self.hl = vim.g.heirlineDelimiters.main_separators.hl
    end,
    provider = function(self)
        return self.separator_left
    end,
    hl = function(self)
        return self.hl
    end,
}

M.RightMainSeparator = {
    init = function(self)
        self.separator_right = vim.g.heirlineDelimiters.main_separators.right
        self.hl = vim.g.heirlineDelimiters.main_separators.hl
    end,
    provider = function(self)
        return self.separator_right
    end,
    hl = function(self)
        return self.hl
    end,
}

M.LeftSubSeparator = {
    init = function(self)
        self.separator_left = vim.g.heirlineDelimiters.sub_separators.left
        self.hl = vim.g.heirlineDelimiters.sub_separators.hl
    end,
    provider = function(self)
        return self.separator_left
    end,
    hl = function(self)
        return self.hl
    end,
}

M.RightSubSeparator = {
    init = function(self)
        self.separator_right = vim.g.heirlineDelimiters.sub_separators.right
        self.hl = vim.g.heirlineDelimiters.sub_separators.hl
    end,
    provider = function(self)
        return self.separator_right
    end,
    hl = function(self)
        return self.hl
    end,
}

M.LeftMiddleSeparator = {
    init = function(self)
        self.separator_left = vim.g.heirlineDelimiters.middle_separators.left
        self.hl = vim.g.heirlineDelimiters.middle_separators.hl
    end,
    provider = function(self)
        return self.separator_left
    end,
    hl = function(self)
        return self.hl
    end,
}

M.RightMiddleSeparator = {
    init = function(self)
        self.separator_right = vim.g.heirlineDelimiters.middle_separators.right
        self.hl = vim.g.heirlineDelimiters.middle_separators.hl
    end,
    provider = function(self)
        return self.separator_right
    end,
    hl = function(self)
        return self.hl
    end,
}

return M
