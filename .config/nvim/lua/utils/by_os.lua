return function(data)
    if vim.fn.has('macunix') == 1 then
        return data.macunix
    elseif vim.fn.has('win32') == 1 then
        return data.win
    end
	error('Data is incorrect.')
end
