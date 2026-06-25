# C\*Base PETSCII Viewer

## Visual Studio Code extension for Commodore 64 PETSCII files

Renders C64 BBS sequence files directly in VS Code using the embedded C64 character ROM — no font installation required.

Part of the **C\*Base Larry Mod v3.1** development package.

---

## Features

- C64 bitmap rendering via embedded character ROM — zero anti-aliasing, pixel-accurate output
- Full 16-color palette with six presets sourced from authoritative references
- Uppercase/graphics and lowercase charset toggle
- MCI command display toggle (`@`-commands and `←`-commands) [^1]
- MCI command display toggle (`£`-commands) [^1]
- CLS (`$93`) break indicator (`.seq` only)
- Variable column width with drag-to-resize (`.seq` only)
- VS Code theme-aware background
- Global settings persistence across all files in the workspace

## File types

- `.seq` — PETSCII sequence files from C64 BBS systems (C\*Base format)
- `.petmate` — Petmate JSON screen files with multi-page support

## Getting started

1. [Installation](getting-started/installation.md)
2. [Quick start](getting-started/quick-start.md)

## Documentation

- [.seq viewer controls](viewer-controls/seq-viewer.md)
- [.petmate viewer controls](viewer-controls/petmate-viewer.md)
- [Color palettes](reference/color-palettes.md)
- [PETSCII control codes](reference/petscii-control-codes.md)
- [MCI commands](reference/mci-commands.md)
- [Rendering](advanced-topics/rendering.md)
- [Development and testing](advanced-topics/development.md)

## Related tools

- [BPP+ Preprocessor](../bpp-plus-preprocessor/index.md) — Source-to-source compiler for C64 BASIC v2
- [BPP+ Syntax Highlighting](../bpp-plus-syntax-highlighting/index.md) — Syntax highlighting and snippets for BASIC v2 and BPP+

## GitHub repository

Source code, issue tracking, and releases: [GitHub](https://github.com/cbase-larrymod/cbase-petscii-viewer).

[^1]: Read more about these [MCI commands and Prof. Plum extensions](bpp-plus-preprocessor/language-specification/lexical-structure/#cbase-extension-symbols) here.
