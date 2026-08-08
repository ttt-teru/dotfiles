local M = {}

local utils = require('heirline.utils')
local conditions = require('heirline.conditions')

local delimiters = require('modules.heirline.components.delimiter')

-- Return the filename of the current buffer
local Init = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
    end,
}

local FileName = {
    init = function(self)
        self.lfilename = vim.fn.fnamemodify(self.filename, ':~:.')
        if vim.fn.fnamemodify(self.filename, ':t') == '' then
            self.lfilename = '[No Name]'
        end
    end,
    flexible = 2,

    {
        provider = function(self)
            return self.lfilename
        end,
    },
    {
        provider = function(self)
            return vim.fn.pathshorten(self.lfilename, 2)
        end,
    },
}

local FileFlags = {
    {
        condition = function()
            return vim.bo.modified
        end,
        -- provider = ' ', -- or ' ●'
        provider = ' [+]',
        hl = { fg = 'green' },
    },
    {
        condition = function()
            return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = ' ',
        hl = { fg = 'orange' },
    },
}

-- Now, let's say that we want the filename color to change if the buffer is
-- modified. Of course, we could do that directly using the FileName.hl field,
-- but we'll see how easy it is to alter existing components using a "modifier"
-- component

local FileNameModifier = {
    hl = function()
        if vim.bo.modified then
            -- use `force` because we need to override the child's hl foreground
            return { fg = 'modifier', force = true }
        end
    end,
}

-- Return information on the current buffers filetype
local FileIcon = {
    init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color =
            require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
    end,
    provider = function(self)
        return self.icon and (' ' .. self.icon .. ' ')
    end,
    hl = function(self)
        return { fg = self.icon_color }
    end,
}

local FileType = {
    provider = function()
        return string.lower(vim.bo.filetype)
    end,
}

-- let's add the children to our FileNameBlock component
M.FileNameBlock = utils.insert(
    Init,
    FileIcon,
    utils.insert(FileNameModifier, FileName), -- a new table where FileName is a child of FileNameModifier
    FileFlags,
    delimiters.Spacer,
    {
        hl = { reverse = true },
        delimiters.LeftMiddleSeparator,
    },
    { provider = '%<' } -- this means that the statusline is cut here when there's not enough space
)

--- Return information on the current file's encoding
M.FileEncoding = {
    condition = function(self)
        return not conditions.buffer_matches({
            filetype = self.filetypes,
        })
    end,
    {
        provider = function()
            local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc -- :h 'enc'
            return ' ' .. enc .. ' '
        end,
    },
    delimiters.RightSubSeparator,
}

M.FileFormat = {
    init = function(self)
        self.fmt = vim.bo.fileformat
    end,
    static = {
        formats = {
            unix = '',
            mac = '',
            dos = '',
        },
    },
    provider = function(self)
        return ' ' .. self.formats[self.fmt] .. ' '
    end,
}

M.FileProperty = utils.insert(Init, FileIcon, FileType)

return M
