# Development

<h2>Jack of all trades, master of C*Base</h2>

Tools for Commodore 64 BASIC v2 cross-development, part of the **C\*Base Larry Mod v3.1** package.

## C\*Base PETSCII Viewer [^1]

C\*Base PETSCII Viewer renders Commodore 64 BBS sequence files directly in VS Code. Uses the embedded C64 character ROM for pixel-accurate bitmap output — no font installation required. Activates automatically when opening `.seq` or `.petmate` files.

### Features

- C64 bitmap rendering via embedded character ROM (no anti-aliasing)
- Full 16-color C64 palette with six presets (CGTerm, Colodore, PALette, Pepto, Petmate, VICE)
- Charset auto-detection — `.seq` from file bytes; `.petmate` per page
- MCI command display toggle (`£`-commands and `@:`-commands)
- CLS (`$93`) break indicator — fluorescent green dotted line (`.seq` only)
- Drag-to-resize column width, 20–200 columns (`.seq` only)
- `.petmate` multi-page viewer with page navigation

[C\*Base PETSCII Viewer documentation](cbase-petscii-viewer/overview.md) | [GitHub repository](https://github.com/cbase-larrymod/cbase-petscii-viewer)

## BPP+ Preprocessor [^2]

BPP+ adds labels, scopes, and file includes to Commodore 64 BASIC v2. Write code with symbolic names instead of line numbers, organize code in scoped blocks, and split projects into multiple files. The preprocessor converts this enhanced syntax into standard BASIC v2.

### Features

- Labels instead of line numbers (`main:` instead of `100`)
- Scopes for organizing code (`screen: { init: ... }`)
- File includes (`!include source "lib/screen.bpp"`)
- Statement chaining with backslash (`\`)
- Hex (`$ff`) and binary (`%11111111`) number formats
- Semicolon (`;`) comments alongside `rem`

[BPP+ Preprocessor documentation](bpp-plus-preprocessor/index.md) | [GitHub repository](https://github.com/cbase-larrymod/bpp-plus)

## BPP+ Syntax Highlighting [^1]

Syntax highlighting and code snippets for standard BASIC v2 and the BPP+ preprocessor.

### Features

- Syntax highlighting for all BASIC v2 keywords, functions, and operators
- BPP+ feature highlighting (labels, scopes, includes, statement chaining)
- 100+ code snippets for commands, functions, and PETSCII control characters
- Works with `.bas` and `.bpp` files

[BPP+ Syntax Highlighting documentation](bpp-plus-syntax-highlighting/index.md) | [GitHub repository](https://github.com/cbase-larrymod/bpp-plus-syntax-highlighting)

[^1]: For [Visual Studio Code](https://code.visualstudio.com/)
[^2]: Extended from the [original BPP preprocessor](https://github.com/hbekel/bpp) by Henning Liebenau.
