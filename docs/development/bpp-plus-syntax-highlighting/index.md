# BPP+ Syntax Highlighting

## Visual Studio Code extension for Commodore 64 BASIC v2

Syntax highlighting and code snippets for standard BASIC v2 and the BPP+ preprocessor.

Part of the **C\*Base Larry Mod v3.1** development package.

---

Example:

```cbmbas
view_Opening:
    tl$="System setup"\
    print "{clr}{2 down}";\
    gosub ui_Elements.render_Logo\
    gosub ui_Elements.render_Swosh\
    print "{4 down}{7 rght}{wht}Press any key!{3 down}"\
    gosub func_PressAnyKey

    goto view_Information
```

## Features

- Syntax highlighting for all BASIC v2 keywords, functions, and operators
- BPP+ feature highlighting (labels, scopes, includes, statement chaining)
- Blitz! compiler directive support (`rem **`, `!blitz`, `::`)
- Extension symbols (MCI commands: `@`, `←`, `£`)
- 100+ code snippets for commands, functions, and PETSCII control characters
- Works with `.bas` and `.bpp` files

## Getting started

1. [Installation](getting-started/installation.md)
2. [Quick start](getting-started/quick-start.md)

## Documentation

- [Syntax highlighting](language-support/syntax-highlighting.md)
- [Code snippets](language-support/code-snippets.md)
- [BASIC v2 reference](reference/basic-v2-language.md)
- [BPP+ features](reference/bpp-plus-features.md)
- [Control characters](reference/control-characters.md)
- [Development and testing](advanced-topics/development-and-testing.md)

## Related tools

- [BPP+ Preprocessor](../bpp-plus-preprocessor/index.md) - Source-to-source compiler for enhanced Commodore 64 BASIC v2 development

## GitHub repository

Source code, issue tracking, and releases: [GitHub](https://github.com/cbase-larrymod/bpp-plus-syntax-highlighting).