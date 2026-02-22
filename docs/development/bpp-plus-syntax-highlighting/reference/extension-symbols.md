# Extension symbols

MCI commands and Prof. Plum extensions for C*Base BBS.

## Symbol reference

| Symbol | MCI Command | Prof. Plum Extension | BASIC Extension |
| :----- | :---------- | :------------------- | :-------------- |
| `@`    | Yes         | `print:print#5`      | No              |
| `←`    | Yes         | `print;:print#5;`     | Yes             |
| `£`    | Yes         | No                   | Yes             |

```cbmbas
@ "text"
← "text"
£ MCI Command
```

## Prof. Plum print shorthand

These symbols send output to both screen and modem simultaneously:

- `@` - Expands to `print:print#5` (statement separator with colon)
- `←` - Expands to `print;:print#5;` (statement separator with semicolon)

Both shortcuts eliminate the need to manually type the dual-output pattern in C\*Base source code context.

## PETSCII conversion character

`↑` (up arrow) is a BPP+ PETSCII conversion character, not a C*Base extension. See [PETSCII character conversion](bpp-plus-features.md#petscii-character-conversion).

---

## See also

- [BASIC v2 language reference](basic-v2-language.md)
- [BPP+ features](bpp-plus-features.md)
- [Syntax highlighting](../language-support/syntax-highlighting.md)
