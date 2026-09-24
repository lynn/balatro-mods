local hide = assert(loadfile('src/sanitize.lua'))()

assert(hide('Ante 12 / 8') == 'Ante    /  ')
assert(hide(123.5) == '   . ')

local colour = {1, 0.5, 0, 1}
local source = {colour, 'Level 10', {0, 1, 0, 1}, ' x2'}
local hidden = hide(source)
assert(hidden ~= source)
assert(hidden[1] == colour)
assert(hidden[2] == 'Level   ')
assert(hidden[4] == ' x ')
assert(source[2] == 'Level 10')

print('sanitize tests passed')
