# .petmate viewer controls

Toolbar controls for Petmate JSON screen files.

## Page navigation

**Buttons:** `‹` (previous) / `›` (next)  
**Indicator:** `Page X/N`

Navigate between pages in the `.petmate` file. Buttons are disabled at the first and last page respectively.

## Charset toggle

**Button:** `Lowercase charset` / `Uppercase charset`

Switches the active glyph bank — equivalent to pressing Shift+C= on a C64. The file stores screen codes which are charset-independent; toggling selects which ROM bank to render them from.

The charset is auto-detected from each page's `charset` field in the JSON (`"upper"` or `"lower"`) and applied when navigating to that page. The button reflects the detected state. Manual toggles are tracked per page within the session — navigating away and back restores the manual override if one was set, otherwise the page's stored charset is reapplied.

## MCI Commands

**Button:** `MCI Commands` (dimmed when hidden)

Shows or hides MCI command tokens. Detection uses screen-code equivalents and is charset-independent.

See [MCI commands](../reference/mci-commands.md) for recognized syntax.

## Palette selector

**Dropdown:** `CGTerm` / `Colodore` / `PALette` / `Pepto` / `Petmate` / `VICE`

Selects the color palette for all 16 C64 colors. See [Color palettes](../reference/color-palettes.md).

## Background color swatches

**16 colored squares** to the right of the palette selector.

Click any swatch to override the background color for the current page. The override is session-only — the file's stored background color is not changed.

---

## See also

- [.seq viewer controls](seq-viewer.md)
- [MCI commands](../reference/mci-commands.md)
