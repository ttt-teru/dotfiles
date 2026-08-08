table.copy = function(t)
    local new = {}
    for k, v in pairs(t) do
        new[k] = v
    end
    return new
end

table.merge = function(t1, t2)
    local new = table.copy(t1)

    for name, val in pairs(t2) do
        new[name] = val
    end
    return new
end
