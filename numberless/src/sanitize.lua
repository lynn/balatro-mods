local function hide(value)
    local kind = type(value)
    if kind == 'string' then
        return (value:gsub('%d', ' '))
    end
    if kind == 'number' then
        return (tostring(value):gsub('%d', ' '))
    end
    if kind == 'table' then
        -- ColoredText is a flat array of colour tables and strings. Copy the
        -- outer table so another mod never observes altered source data.
        local hidden = {}
        for key, part in pairs(value) do
            hidden[key] = type(part) == 'string' and part:gsub('%d', ' ') or part
        end
        return setmetatable(hidden, getmetatable(value))
    end
    return value
end

return hide
