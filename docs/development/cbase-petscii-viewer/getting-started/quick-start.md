# Quick start

Open any `.seq` or `.petmate` file — the viewer activates automatically.

## Default settings

| Setting         | Default / Behavior                                                    |
| :-------------- | :-------------------------------------------------------------------- |
| Charset         | Auto-detected from file; lowercase when no indicator present          |
| Palette         | CGTerm                                                                |
| Background      | Black (index 0)                                                       |
| MCI Commands    | Visible                                                               |
| Show CLS ($93)  | Hidden                                                                |
| Column width    | 40                                                                    |

Charset is determined fresh on each file open and is not saved. Palette, background, MCI visibility, and CLS toggle are saved globally and apply to all files you open.

## Opening a .seq file

1. Open a `.seq` file from the C\*Base BBS asset directory
2. The viewer renders immediately using the default settings
3. Use the toolbar to adjust charset, palette, MCI visibility, and column width

To open files via Command Palette: `Ctrl+Shift+P` → **C\*Base: Open .seq File...**

## Opening a .petmate file

1. Open a `.petmate` file
2. Use `‹` and `›` to navigate between pages
3. Use the toolbar to adjust charset, palette, and MCI visibility

To open files via Command Palette: `Ctrl+Shift+P` → **C\*Base: Open .petmate File...**

---

## Next steps

- [Viewer controls](../viewer-controls/controls.md)
- [Color palettes](../reference/color-palettes.md)
