# .seq viewer controls

Toolbar controls for PETSCII sequence files.

## Charset toggle

**Button:** `Lowercase charset` / `Uppercase charset`

Switches between the two C64 character sets:

- **Lowercase charset** — lowercase letters, uppercase via Shift. Common for mixed-case BBS text.
- **Uppercase charset** — uppercase letters and graphics/symbol characters. Used for PETSCII art with block graphics.

The charset is auto-detected from `$0E` (lowercase) or `$8E` (uppercase) if either byte appears in the first 10 bytes of the file. When no indicator is present the file opens in lowercase. The button reflects the detected state and can be toggled manually.

## MCI Commands

**Button:** `MCI Commands` (dimmed when hidden)

Shows or hides inline MCI command tokens embedded in the sequence. When hidden, tokens are stripped from the display and the remaining characters reflow to fill the row.

See [MCI commands](../reference/mci-commands.md) for recognized syntax.

## Show CLS ($93)

**Button:** `Show CLS ($93)` (dimmed when hidden)

Marks `$93` (Clear Screen) boundaries with a fluorescent green dotted line spanning the full canvas width. The line appears at the top of the first row after each `$93` byte.

When hidden, `$93` is decoded silently with no visual effect.

## Palette selector

**Dropdown:** `CGTerm` / `Colodore` / `PALette` / `Pepto` / `Petmate` / `VICE`

Selects the color palette for all 16 C64 colors. See [Color palettes](../reference/color-palettes.md).

## Background color swatches

**16 colored squares** to the right of the palette selector.

Click any swatch to set that color as the C64 background. The active swatch is highlighted with a white border. The default is Black (index 0).

## Column width controls

The right side of the toolbar shows canvas dimensions, e.g. `40×120`.

**Drag to resize:** Drag the vertical handle on the right edge of the canvas to change the column count. The PETSCII stream re-decodes and reflows in real time. Range: 20–200 columns.

**Click to type:** Click the column number (underlined) to open an inline text field. Press `Enter` to commit, `Escape` to cancel.

**Reset icon (↺):** Appears left of the dimensions when column width differs from 40. Click to restore 40-column width.

---

## See also

- [.petmate viewer controls](petmate-viewer.md)
- [MCI commands](../reference/mci-commands.md)
- [PETSCII control codes](../reference/petscii-control-codes.md)
