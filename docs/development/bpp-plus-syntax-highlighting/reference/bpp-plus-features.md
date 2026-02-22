# BPP+ Preprocessor features

BPP+ preprocessor features in `.bpp` files.

## What is BPP+?

BPP+ is a preprocessor that extends BASIC v2 with labels, scopes, and includes.

See [BPP+ preprocessor documentation](../../bpp-plus-preprocessor/index.md) for language specification and compilation.

## Labels

Labels provide symbolic names for control flow targets, replacing numeric line references:

```cbmbas
main:
    gosub init
    gosub loop
    end

init:
    print "{clr}"
    return
```

**Label definitions:** `main:`, `init:`
**Label references:** `gosub init`, `goto loop`

See [BPP+ symbol resolution](../../bpp-plus-preprocessor/language-specification/symbol-resolution.md).

## Scopes

Scopes provide hierarchical namespaces for organizing related labels:

```cbmbas
screen: {
    init:
        poke 53280,0
        return

    clear:
        print "{clr}"
        return
}

main:
    gosub screen.init
    gosub screen.clear
```

**Scope declarations:** `screen: {`
**Scope delimiters:** `{` and `}`
**Qualified references:** `screen.init`

See [BPP+ scope hierarchies](../../bpp-plus-preprocessor/language-specification/scope-hierarchies.md).

## Include directives

```cbmbas
!include source "lib/screen.bpp"
!include data "charset.bin"

ui: {
    !include source "ui-elements.bpp"
}
```

Highlights the `!include` keyword, type specifiers (`source`/`data`), and file paths.

See [BPP+ include directives](../../bpp-plus-preprocessor/language-specification/include-directives.md).

## Statement chaining

```cbmbas
print_header:
    print "{clr}";\
    print "{wht}System v1.0";\
    print "{down}{down}";\
    return
```

Highlights the backslash (`\`) continuation character.

See [BPP+ statement chaining](../../bpp-plus-preprocessor/language-specification/statement-chaining.md).

## Comments

```cbmbas
rem BASIC comment
; BPP+ comment
```

Highlights both `rem` and `;` comment styles.

See [BPP+ lexical structure](../../bpp-plus-preprocessor/language-specification/lexical-structure.md).

## Blitz! compiler control

```cbmbas
:: print "This line will not be compiled by Blitz!"
```

The `::` prefix prevents Blitz! compilation, forcing runtime interpretation.

See [Blitz! BASIC Compiler](../../bpp-plus-preprocessor/language-specification/blitz-basic-compiler.md).

## String tokens

```cbmbas
print "{clr}{wht}Text"
print "{10 space}"
print "{a-z}"
```

Highlights token delimiters, content, repetition syntax, and ranges.

See [BPP+ PETSCII control characters](../../bpp-plus-preprocessor/language-specification/petscii-control-codes.md).

## PETSCII character conversion

BPP+ automatically converts PETSCII characters to ASCII equivalents during preprocessing:

- `£` (pound sign, 0x5C) → `\` (backslash)
- `←` (left arrow, 0x5F) → `_` (underscore)
- `↑` (up arrow, 0x5E) → `^` (caret)

Both forms are highlighted. Files created with C64 editors are handled.

Note: `£` and `←` also serve as MCI commands and BASIC extensions. See [Extension symbols](extension-symbols.md).

See [PETSCII character conversion](../../bpp-plus-preprocessor/language-specification/lexical-structure.md#petscii-character-conversion).

## Code snippets

See [Code snippets](../language-support/code-snippets.md).

## File types

- `.bpp` - BPP+ enhanced source files (full highlighting)
- `.bas` - Standard BASIC v2 files (BASIC highlighting only)

---

## See also

- [BPP+ preprocessor documentation](../../bpp-plus-preprocessor/index.md)
- [Syntax highlighting](../language-support/syntax-highlighting.md)
- [BASIC v2 language reference](basic-v2-language.md)
- [Extension symbols](extension-symbols.md)
