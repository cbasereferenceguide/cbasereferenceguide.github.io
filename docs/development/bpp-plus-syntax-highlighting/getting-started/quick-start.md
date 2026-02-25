# Quick start

Two features:

- **Syntax highlighting** - Colors and styles for language elements
- **Code snippets** - Predefined snippets with placeholders

Both activate when you open `.bas` or `.bpp` files.

## Creating your first file

### Plain BASIC v2

Create a new file named `hello.bas`:

```cbmbas
10 print "{clr}"
20 poke 53280,0
30 poke 53281,0
40 print "{wht}hello bpp+"
```

What gets highlighted:

- **Line numbers:** `10`, `20`, `30`, `40`
- **Keywords:** `print`, `poke`
- **Strings:** `"{clr}"`, `"{wht}hello bpp+"`
- **PETSCII tokens:** `{clr}`, `{wht}`

### BPP+ syntax

Create a new file named `hello.bpp`:

```cbmbas

; bpp+ program

goto main

screen: {
    init:
        poke 53280,0\
        poke 53281,0\
        return

    welcome:
        print "{wht}hello bpp+"\
        return
}

main:
    gosub screen.init
    gosub screen.welcome
```

BPP+ features highlighted:

- **Labels:** `main:`, `init:`, `welcome:` - Styled as declarations and references
- **Scopes:** `screen: { ... }` - Styled as namespace delimiters
- **Scoped references:** `screen.init`, `screen.welcome` - Styled to show qualified access
- **Statement chaining:** Backslash (`\`) continuation character
- **Preprocessor comments:** Semicolon (`;`) comments in addition to standard `rem` syntax

## Working with BPP+ files

### What is BPP+?

BPP+ is a preprocessor that extends BASIC v2 with labels, scopes, and includes.

See [BPP+ Preprocessor documentation](../../bpp-plus-preprocessor/index.md) for language specification and [BPP+ features reference](../reference/bpp-plus-features.md) for highlighting details.

## Using code snippets

### Example: FOR loop

1. Type `for`
2. Press `Tab`
3. Inserts: `for <counter variable>=<start value> to <end value>:<expression>:next <counter variable>`
4. Press `Tab` to move between placeholders
5. Type your values

```cbmbas
for i=1 to 10:print i:next i
```

### Example: Color codes

1. Type `{wht}`
2. Press `Tab` or `Enter`
3. Inserts the white color token

Using chr$ function:

1. Type `chr`
2. Press `Tab`
3. Inserts: `chr$(<numeric expression>)`
4. Type `5` for white color

### Common snippets

| Type    | Result                                     |
| :------ | :----------------------------------------- |
| `print` | `print <expression>`                       |
| `gosub` | `gosub <line/label>`                       |
| `if`    | `if <condition> then <line or expression>` |
| `peek`  | `peek(<memory address>)`                   |
| `poke`  | `poke <memory address>,number`             |
| `{clr}` | Clear screen token                         |
| `{wht}` | White color token                          |

See [Code snippets](../language-support/code-snippets.md) for the complete list.

---

## Next steps

- [Syntax highlighting features](../language-support/syntax-highlighting.md)
- [Code snippets reference](../language-support/code-snippets.md)
- [BASIC v2 language reference](../reference/basic-v2-language.md)
