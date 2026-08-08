local M = {}

local utils = require('heirline.utils')
local conditions = require('heirline.conditions')

local delimiters = require('modules.heirline.components.delimiter')

---Return the current vim mode
M.VimMode = {
    init = function(self)
        self.mode = vim.fn.mode(1)
        self.mode_color = self.mode_colors[self.mode:sub(1, 1)]
    end,
    static = {
        mode_names = {
            n = 'NORMAL',
            no = 'NORMAL',
            nov = 'NORMAL',
            noV = 'NORMAL',
            ['no\22'] = 'NORMAL',
            niI = 'NORMAL',
            niR = 'NORMAL',
            niV = 'NORMAL',
            nt = 'NORMAL',
            v = 'VISUAL',
            vs = 'VISUAL',
            V = 'VISUAL',
            Vs = 'VISUAL',
            ['\22'] = 'VISUAL',
            ['\22s'] = 'VISUAL',
            s = 'SELECT',
            S = 'SELECT',
            ['\19'] = 'SELECT',
            i = 'INSERT',
            ic = 'INSERT',
            ix = 'INSERT',
            R = 'REPLACE',
            Rc = 'REPLACE',
            Rx = 'REPLACE',
            Rv = 'REPLACE',
            Rvc = 'REPLACE',
            Rvx = 'REPLACE',
            c = 'COMMAND',
            cv = 'Ex',
            r = '...',
            rm = 'M',
            ['r?'] = '?',
            ['!'] = '!',
            t = 'TERM',
        },
        mode_colors = {
            n = 'normal_mode',
            i = 'insert_mode',
            v = 'visual_mode',
            V = 'visual_mode',
            ['\22'] = 'visual_mode',
            c = 'command_mode',
            s = 'visual_mode',
            S = 'visual_mode',
            ['\19'] = 'visual_mode',
            r = 'replace_mode',
            R = 'replace_mode',
            ['!'] = 'command_mode',
            t = 'command_mode',
        },
    },
    {
        hl = function(self)
            return { fg = 'mode_fg', bg = self.mode_color, bold = true }
        end,
        provider = function(self)
            return '%2( ' .. self.mode_names[self.mode] .. '%) '
        end,
    },
    {
        init = function(self)
            if not conditions.is_git_repo() then
                self.separator_color_bg = 'base_bg'
            else
                self.separator_color_bg = 'mode_bg'
            end
        end,
        hl = function(self)
            return { fg = self.mode_color, bg = self.separator_color_bg, bold = true, force = true }
        end,
        delimiters.LeftMainSeparator,
    },
    -- update = {
    --   'ModeChanged',
    --   pattern = '*:*',
    --   callback = vim.schedule_wrap(function()
    --     vim.cmd('redrawstatus')
    --   end),
    -- },
}

M.SearchCount = {
    condition = function()
        return vim.v.hlsearch ~= 0
    end,
    init = function(self)
        local ok, search = pcall(vim.fn.searchcount)
        if ok and search.total then
            self.search = search
        end
    end,
    provider = function(self)
        local search = self.search
        return string.format('[%d/%d]', search.current, math.min(search.total, search.maxcount))
    end,
}

M.MacroRecording = {
    condition = function()
        return vim.fn.reg_recording() ~= ''
    end,
    provider = '  ',
    hl = { fg = 'orange' },
    {
        provider = function()
            return '[' .. vim.fn.reg_recording() .. ']'
        end,
        hl = { fg = 'green' },
    },
    update = {
        'RecordingEnter',
        'RecordingLeave',
    },
}

return M
