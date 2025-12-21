# Quick start

This guide shows how to use BPP+ Syntax Highlighting for BASIC v2 development in VS Code.

## Creating your first file

### Plain BASIC v2

Create a new file named `hello.bas`:

```cbmbas
10 rem Hello World Program
20 print "{clr}"
30 print "{wht}Hello, World!"
40 end
```

The extension highlights:

- Keywords: `rem`, `print`, `end`
- Line numbers: `10`, `20`, `30`, `40`
- Strings: `"{clr}"`, `"{wht}Hello, World!"`
- Control tokens: `{clr}`, `{wht}`

### BPP+ enhanced syntax

Create a new file named `hello.bpp`:

```cbmbas
rem Modern BASIC with BPP+ preprocessor

main:
    gosub screen.init
    gosub screen.message
    end

screen: {
    init:
        print "{clr}"\
        return

    message:
        print "{wht}Hello, BPP+ World!"\
        return
}
```

The extension highlights:

- **Labels:** `main:`, `init:`, `message:`
- **Scopes:** `screen: { ... }`
- **Label references:** `screen.init`, `screen.message`
- **Statement chaining:** backslash (`\`) line continuations
- **BPP+ comments:** semicolon (`;`) comments work alongside `rem`

## Using code snippets

Type a snippet prefix and press `Tab` to insert code.

### Example: FOR loop

1. Type `for`
2. Press `Tab`
3. Extension inserts: `for <var>=<start> to <end>:<expr>:next <var>`
4. Press `Tab` to move between placeholders
5. Type your values

```cbmbas
for i=1 to 10:print i:next i
```

### Example: Color codes

1. Type `{wht}`
2. Press `Tab` or `Enter`
3. Extension inserts the white color token

Alternative using chr$ function:

1. Type `chr`
2. Press `Tab`
3. Extension inserts: `chr$(<numeric expression>)`
4. Type `5` for white color

### Common snippets

| Type      | Press Tab | Result                          |
| :-------- | :-------- | :------------------------------ |
| `print`   | Tab       | `print <expression>`            |
| `gosub`   | Tab       | `gosub <line/label>`            |
| `if`      | Tab       | `if <condition> then <action>`  |
| `peek`    | Tab       | `peek(<memory address>)`        |
| `poke`    | Tab       | `poke <address>,<value>`        |
| `{clr}`   | Tab       | Clear screen token              |
| `{wht}`   | Tab       | White color token               |

See [Code snippets](../features/code-snippets.md) for the complete list.

## Working with BPP+ files

### What is BPP+?

BPP+ is a preprocessor that adds modern features to BASIC v2 (labels, file includes, namespaces). The extension highlights BPP+ syntax in `.bpp` files. Learn more: [BPP+ preprocessor documentation](../../bpp-plus-preprocessor/index.md)

### What gets highlighted

**Labels:** Definitions and references

```cbmbas
main:                    rem Highlighted
    gosub init           rem Highlighted
```

**Scopes:** Declarations and scoped references

```cbmbas
screen: {                rem Highlighted
    init: return
}
gosub screen.init        rem Highlighted
```

**Includes:** Keyword, type, and file path

```cbmbas
!include source "lib/screen.bpp"    rem All highlighted
```

**Statement chaining:** Backslash continuation

```cbmbas
print "{clr}";\          rem Backslash highlighted
```

See [BPP+ features reference](../reference/bpp-plus-features.md) for complete details.

---

## Next steps

- [Syntax highlighting features](../features/syntax-highlighting.md) - Learn what gets highlighted
- [Code snippets reference](../features/code-snippets.md) - Complete snippet catalog
- [BASIC v2 language reference](../reference/basic-v2-language.md) - Full language support details
