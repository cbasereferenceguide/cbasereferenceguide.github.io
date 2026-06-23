# How rendering works

The viewer does not use a font. Glyphs are drawn pixel-by-pixel from an embedded C64 character ROM.

## Character ROM

An unmodified copy of the C64 character ROM (4096 bytes) is bundled with the extension.

**Layout:**

| Bytes     | Contents                                |
| :-------- | :-------------------------------------- |
| 0–2047    | Uppercase/graphics charset — 256 glyphs |
| 2048–4095 | Lowercase charset — 256 glyphs          |

Each glyph occupies 8 bytes — one byte per pixel row. Within each byte, bit 7 is the leftmost pixel. A `1` bit is foreground color; a `0` bit is background color.

## PETSCII to screen code conversion

For `.seq` files, raw PETSCII byte values do not map directly to ROM glyph positions. The decoder converts each byte to a screen code before looking up the glyph.

Conversion formula (from CGTerm / C64 kernal):

```
SCCONV = [128, 0, -64, -32, 64, -64, -128, -128]
screen_code = (byte + SCCONV[byte >> 5]) & 0xFF
Special case: byte $FF → screen code 94
```

`.petmate` files store screen codes directly (0–255) — no conversion step is needed.

## Canvas pipeline

Each character cell is rendered as an 8×8 block of pixels written to an `ImageData` buffer. The buffer is then drawn to an HTML `<canvas>` element and scaled 2× via CSS `image-rendering: pixelated`, producing 16×16 pixel cells on screen with no interpolation.

**Canvas dimensions:**

| Dimension | Formula                         |
| :-------- | :------------------------------ |
| Width     | column count × 8 pixels         |
| Height    | row count × 8 pixels            |
| On screen | both dimensions × 2 (CSS scale) |

## Color application

Each character cell has a foreground color index (0–15) resolved from the active palette. Background color is the global background index. Reverse mode (`$12`/`$92`) swaps foreground and background for that cell only.

Palette hex values are converted to RGBA and written per-pixel into `ImageData`. Switching palettes redraws the entire canvas from the already-decoded character data — the PETSCII stream is not re-decoded.

## Charset switching

The charset toggle selects which half of the ROM to read glyphs from. Re-rendering on a charset switch re-draws all cells using the new ROM bank. The decoded character data (screen codes, colors, reverse flags) is unchanged.

---

## See also

- [Color palettes](../reference/color-palettes.md)
- [PETSCII control codes](../reference/petscii-control-codes.md)
- [.seq viewer controls](../viewer-controls/seq-viewer.md)
