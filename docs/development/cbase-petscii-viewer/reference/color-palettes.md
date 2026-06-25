# Color palettes

Six palette presets, each sourced from an authoritative reference. All define the same 16 C64 colors in the same index order — only the hex values differ.

## Presets

| Palette  | Source                                 | Description                                                                  |
| :------- | :------------------------------------- | :--------------------------------------------------------------------------- |
| CGTerm   | CGTerm-3.0 `src/gfx.c`                 | Default. Built-in palette from CGTerm 3.0 — identical to Pepto.              |
| Colodore | Petmate9 `src/utils/palette.ts`        | Analog simulation model by Philip "Pepto" Timmermann.                        |
| PALette  | VICE `data/C64/palette.vpl`            | Palette by PAL/Offence.                                                      |
| Pepto    | VICE `data/C64/pepto-pal.vpl`          | PAL calibration by Philip "Pepto" Timmermann. Authoritative measured values. |
| Petmate  | Petmate9 `src/utils/palette.ts`        | Colors from the Petmate C64 tool.                                            |
| VICE     | VICE `data/C64/palette_6569R5_v1r.vpl` | VICE internal palette — chip 6569R5 (Tobias measurements).                   |

The VICE internal palette is chip-model-dependent. The 6569R5 variant is the default for a standard PAL C64.

## Color index order

All palettes use the standard C64 color index order:

| Index | Color       |
| :---- | :---------- |
| 0     | Black       |
| 1     | White       |
| 2     | Red         |
| 3     | Cyan        |
| 4     | Purple      |
| 5     | Green       |
| 6     | Blue        |
| 7     | Yellow      |
| 8     | Orange      |
| 9     | Brown       |
| 10    | Light Red   |
| 11    | Dark Grey   |
| 12    | Grey        |
| 13    | Light Green |
| 14    | Light Blue  |
| 15    | Light Grey  |

The default foreground is Light Blue (index 14), matching the C\*Base BBS terminal default. The default background is Black (index 0).

## Settings persistence

The selected palette is saved to VS Code workspace state and restored when you reopen files. The `.seq` and `.petmate` viewers maintain separate settings.

---

## See also

- [Viewer controls](../viewer-controls/controls.md)
