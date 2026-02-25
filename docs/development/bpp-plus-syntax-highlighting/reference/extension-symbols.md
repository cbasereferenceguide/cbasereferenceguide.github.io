# Extension symbols

Extension symbols highlighted by the extension.

## Symbols

| Symbol | MCI Command | Prof. Plum Extension |
| :----- | :---------- | :------------------- |
| `@`    | Yes         | `print:print#5`      |
| `←`    | Yes         | `print;:print#5;`    |
| `£`    | Yes         | No                   |

## Highlighting behavior

These symbols are highlighted when used outside print statements. Inside print statements, they are not highlighted.

```cbmbas
@ "text"            rem Highlighted
← "text"            rem Highlighted
£ MCI Command       rem Highlighted

print "@←£"         rem Not highlighted inside string
```

## C*Base extensions

`@` and `←` serve as Prof. Plum print shorthand in C*Base BBS context.

See [BPP+ Preprocessor - C*Base extension symbols](../../bpp-plus-preprocessor/language-specification/lexical-structure.md#cbase-extension-symbols) for complete documentation.

## PETSCII conversion

`↑` (up arrow) is NOT a C*Base extension.

See [PETSCII character conversion](bpp-plus-features.md#petscii-character-conversion).

---

## See also

- [BPP+ features](bpp-plus-features.md)
- [BASIC v2 language reference](basic-v2-language.md)
