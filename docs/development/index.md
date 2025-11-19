# Development

<h2>Jack of all trades, master of C*Base</h2>

Tools for Commodore 64 BASIC v2 cross-development, part of the **C\*Base Larry Mod v3.1** package.

## BPP+ Preprocessor [^1]

BPP+ adds labels, scopes, and file includes to Commodore 64 BASIC v2. Write code with symbolic names instead of line numbers, organize code in scoped blocks, and split projects into multiple files. The preprocessor converts this enhanced syntax into standard BASIC v2.

### Features

- Labels instead of line numbers (`main:` instead of `100`)
- Scopes for organizing code (`screen: { init: ... }`)
- File includes (`!include source "lib/screen.bpp"`)
- Statement chaining with backslash (`\`)
- Hex (`$ff`) and binary (`%11111111`) number formats
- Semicolon (`;`) comments alongside `rem`

[BPP+ Preprocessor documentation](bpp-plus-preprocessor/index.md) | [GitHub repository](https://github.com/cbase-larrymod/bpp-plus)

[^1]: Extended from the [original BPP preprocessor](https://github.com/hbekel/bpp) by Henning Liebenau.
