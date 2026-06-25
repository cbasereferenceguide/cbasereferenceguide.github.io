# Viewer controls

Toolbar controls for the `.seq` and `.petmate` viewers. Controls marked **(.seq only)** or **(.petmate only)** are file-type specific; the rest are shared.

## Page navigation (.petmate only)

**Buttons:** `‹` (previous) / `›` (next)  
**Indicator:** `Page X/N`

Navigate between pages in the `.petmate` file. Buttons are disabled at the first and last page respectively.

## Charset toggle

**Button:** `Lowercase charset` / `Uppercase charset`

Switches between the two C64 character sets:

- **Lowercase charset** — lowercase letters, uppercase via Shift. Common for mixed-case BBS text.
- **Uppercase charset** — uppercase letters and graphics/symbol characters. Used for PETSCII art with block graphics.

**In `.seq` files:** the charset is auto-detected from `$0E` (lowercase) or `$8E` (uppercase) if either byte appears in the first 10 bytes of the file. When no indicator is present the file opens in lowercase.

**In `.petmate` files:** the charset is auto-detected from each page's `charset` field in the JSON (`"upper"` or `"lower"`) and applied when navigating to that page. Manual toggles are tracked per page within the session — navigating away and back restores the manual override if one was set, otherwise the page's stored charset is reapplied.

## MCI Commands

**Button:** `MCI Commands` (dimmed when hidden)

Shows or hides inline MCI command tokens. When hidden, tokens are stripped from the display and the remaining characters reflow to fill the row.

In `.petmate` files, detection uses screen-code equivalents and is charset-independent.

## Show CLS ($93) (.seq only)

**Button:** `Show CLS ($93)` (dimmed when hidden)

Marks `$93` (Clear Screen) boundaries with a fluorescent green dotted line spanning the full canvas width. The line appears at the top of the first row after each `$93` byte.

When hidden, `$93` is decoded silently with no visual effect.

## Palette selector

**Dropdown:** `CGTerm` / `Colodore` / `PALette` / `Pepto` / `Petmate` / `VICE`

Selects the color palette for all 16 C64 colors. See [Color palettes](../reference/color-palettes.md).

## Background color swatches

**16 colored squares** to the right of the palette selector.

Click any swatch to set the background color. The active swatch is highlighted with a white border.

In `.seq` files, the default is Black (index 0). In `.petmate` files, the click overrides the stored page background for the current session only — the file is not changed.

## Column width controls (.seq only)

The right side of the toolbar shows canvas dimensions, e.g. `40×120`.

**Drag to resize:** Drag the vertical handle on the right edge of the canvas to change the column count. The PETSCII stream re-decodes and reflows in real time. Range: 20–200 columns.

**Click to type:** Click the column number (underlined) to open an inline text field. Press `Enter` to commit, `Escape` to cancel.

**Reset icon (↺):** Appears left of the dimensions when column width differs from 40. Click to restore 40-column width.

---

## See also

- [PETSCII control codes](../reference/petscii-control-codes.md)
- [Color palettes](../reference/color-palettes.md)
