# Numberless

A Balatro mod that hides ASCII digits (`0` through `9`) in rendered text. It
replaces each digit with a space at the final rendering boundary, so scores,
prices, counters, seeds, calculations, saves, and other game data are unchanged.
Keeping one space per digit also preserves the UI's original text layout.

## Install

Install [Lovely](https://github.com/ethangreen-dev/lovely-injector) and
[Steamodded](https://github.com/Steamodded/smods), then copy this entire folder
to Balatro's `Mods` directory. The resulting path should look like:

```text
Mods/numberless/numberless.json
```

Restart Balatro after installing or removing the mod.

## Scope

Numberless handles Balatro's normal UI labels, animated `DynaText`, direct
`love.graphics.print` / `printf` calls, and compatible mod text routed through
those APIs. Numerals baked into image assets, such as playing-card rank artwork,
are images rather than text and are not changed.
