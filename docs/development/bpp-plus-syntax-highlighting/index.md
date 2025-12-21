# BPP+ Syntax Highlighting

<h2>Visual Studio Code extension for Commodore 64 BASIC v2 cross-development</h2>

BPP+ Syntax Highlighting transforms BASIC v2 code editing in VS Code with comprehensive syntax highlighting and intelligent code snippets.

It supports both raw Commodore 64 BASIC and the BPP+ preprocessor, making your code clearer and easier to write.

Part of the **C\*Base Larry Mod v3.1** development package.

---

Enhanced syntax highlighting shows

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
- 100+ code snippets for commands, functions, and PETSCII control characters
- Tab-navigable placeholders in snippets
- Works with `.bas` and `.bpp` files

## Getting started

New to BPP+ Syntax Highlighting? Start here:

1. [Installation](getting-started/installation.md) - Install the extension and verify setup
2. [Quick start](getting-started/quick-start.md) - Start using syntax highlighting and snippets

## Documentation

- [Syntax highlighting](features/syntax-highlighting.md) - What gets highlighted
- [Code snippets](features/code-snippets.md) - Available snippets
- [BASIC v2 reference](reference/basic-v2-language.md) - BASIC v2 support
- [BPP+ features](reference/bpp-plus-features.md) - BPP+ support
- [Control characters](reference/control-characters.md) - PETSCII tokens
- [Development and testing](advanced/development-testing.md) - Extending the extension

## GitHub repository

The BPP+ Syntax Highlighting source code, issue tracking, and release packages are available on [GitHub](https://github.com/cbase-larrymod/bpp-plus-syntax-highlighter).