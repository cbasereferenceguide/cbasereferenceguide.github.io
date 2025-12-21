# BPP+ Preprocessor features

The extension highlights BPP+ preprocessor features in `.bpp` files.

## What is BPP+?

BPP+ is a preprocessor that adds modern programming features to Commodore 64 BASIC v2, including labels instead of line numbers, file includes, and namespaces. For complete BPP+ documentation, see the [BPP+ preprocessor documentation](../../bpp-plus-preprocessor/index.md).

## Labels

```cbmbas
main:
    gosub init
    gosub loop
    end

init:
    print "{clr}"
    return
```

The extension highlights label definitions (ending with `:`) and label references in goto/gosub statements.

Learn more: [BPP+ symbol resolution](../../bpp-plus-preprocessor/language-specification/symbol-resolution.md)

## Scopes

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

The extension highlights scope declarations, delimiters (`{` `}`), and scoped references.

Learn more: [BPP+ scope hierarchies](../../bpp-plus-preprocessor/language-specification/scope-hierarchies.md)

## Include directives

```cbmbas
!include source "lib/screen.bpp"
!include data "charset.bin"

ui: {
    !include source "ui-elements.bpp"
}
```

The extension highlights the `!include` keyword, type specifiers (`source`/`data`), and file paths.

Learn more: [BPP+ include directives](../../bpp-plus-preprocessor/language-specification/include-directives.md)

## Statement chaining

```cbmbas
print_header:
    print "{clr}";\
    print "{wht}System v1.0";\
    print "{down}{down}";\
    return
```

The extension highlights the backslash (`\`) continuation character.

Learn more: [BPP+ statement chaining](../../bpp-plus-preprocessor/language-specification/statement-chaining.md)

## Comments

```cbmbas
rem BASIC comment
; BPP+ comment
```

The extension highlights both `rem` and `;` comment styles.

Learn more: [BPP+ lexical structure](../../bpp-plus-preprocessor/language-specification/lexical-structure.md)

## String tokens

```cbmbas
print "{clr}{wht}Text"
print "{10 space}"
print "{a-z}"
```

The extension highlights token delimiters, content, repetition syntax, and ranges.

Learn more: [BPP+ PETSCII control codes](../../bpp-plus-preprocessor/language-specification/petscii-control-codes.md)

## Code snippets

The extension provides snippets for BPP+ features:

| Prefix            | Inserts                    | Description         |
| :---------------- | :------------------------- | :------------------ |
| `!include source` | `!include source "<path>"` | Include source file |
| `!include data`   | `!include data "<path>"`   | Include binary data |

See [Code snippets](../features/code-snippets.md) for the complete list.

## File types

- `.bpp` - BPP+ enhanced source files (full highlighting)
- `.bas` - Standard BASIC v2 files (BASIC highlighting only)

---

## See also

- [BPP+ preprocessor documentation](../../bpp-plus-preprocessor/index.md) - Learn how BPP+ works
- [Syntax highlighting](../features/syntax-highlighting.md) - BASIC v2 highlighting
- [BASIC v2 language reference](basic-v2-language.md) - BASIC v2 support
