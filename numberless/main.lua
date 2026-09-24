local mod = SMODS.current_mod
local make_sanitizer = assert(SMODS.load_file('src/sanitize.lua', mod.id))

Numberless = Numberless or {}
Numberless.hide = make_sanitizer()

-- LÖVE has two common text paths in Balatro: immediate print/printf calls and
-- cached Text objects. Sanitizing at construction covers DynaText's individual
-- glyph objects while leaving the strings used for UI measurement untouched.
if not Numberless.installed then
    Numberless.installed = true

    local graphics = love.graphics
    local original_print = graphics.print
    local original_printf = graphics.printf
    local original_new_text = graphics.newText

    graphics.print = function(text, ...)
        return original_print(Numberless.hide(text), ...)
    end

    graphics.printf = function(text, ...)
        return original_printf(Numberless.hide(text), ...)
    end

    graphics.newText = function(font, text)
        if text == nil then return original_new_text(font) end
        return original_new_text(font, Numberless.hide(text))
    end
end
