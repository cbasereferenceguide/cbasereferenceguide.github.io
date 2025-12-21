# Syntax highlighting

The extension highlights BASIC v2 and BPP+ language elements.

## What gets highlighted

### Control flow keywords

`end`, `for`, `next`, `gosub`, `goto`, `if`, `then`, `step`, `stop`, `return`, `to`, `on`

```cbmbas
for i=1 to 10 step 2
    print i
next i

if x=5 then print "found"
on n gosub 100,200,300
```

### Built-in functions

**Math:** `abs`, `atn`, `cos`, `exp`, `int`, `log`, `rnd`, `sgn`, `sin`, `sqr`, `tan`

**String:** `asc`, `chr$`, `left$`, `len`, `mid$`, `right$`, `str$`, `val`

**System:** `peek`, `pos`, `usr`, `fre`

```cbmbas
a = abs(-5)
b$ = chr$(65)
c = peek(53280)
```

### User-defined functions

`def fn` declarations and `fn` function calls:

```cbmbas
def fn sq(x) = x * x
a = fn sq(5)
```

### I/O and disk keywords

`print`, `print#`, `input`, `input#`, `open`, `close`, `load`, `list`, `save`, `restore`, `read`, `get`, `get#`, `poke`, `sys`, `run`, `verify`, `wait`, `tab`, `spc`, `cmd`

```cbmbas
print "Hello"
input "Name";n$
open 1,8,2,"file,s,w"
poke 53280,0
```

### Data and storage keywords

`dim`, `data`, `let`, `def`, `read`, `restore`

```cbmbas
dim array(10)
data 1,2,3,4,5
read a,b,c
```

### Variables

Variable names with optional type suffixes:

- Standard: `a`, `counter`
- String: `name$`, `text$`
- Integer: `x%`, `count%`

```cbmbas
a = 10
name$ = "hello"
count% = 100
```

### Operators

**Arithmetic:** `+`, `-`, `*`, `/`, `^`

**Comparison:** `=`, `<>`, `<`, `>`, `<=`, `>=`

**Logical:** `and`, `or`, `not`

```cbmbas
a = 5 + 3
if a>5 and b<10 then print "yes"
```

### Numbers

- Line numbers (at start of line)
- Decimal: `255`, `3.14159`
- Hexadecimal: `$ff`, `$c000` (BPP+ only)
- Binary: `%11111111` (BPP+ only)

```cbmbas
10 a = 255
20 b = $ff
30 c = %11111111
```

### Comments

- `rem` - BASIC v2 comments
- `;` - BPP+ preprocessor comments

```cbmbas
rem BASIC comment
; BPP+ comment
```

### Strings and PETSCII tokens

Double-quoted strings with embedded PETSCII tokens:

```cbmbas
a$ = "simple string"
b$ = "{clr}{wht}Hello"
c$ = "{10 space}Text"
```

Token patterns highlighted:
- Basic tokens: `{clr}`, `{wht}`, `{down}`
- Repetition: `{10 space}`, `{5 down}`
- Ranges: `{a-z}`, `{0-9}`

### BPP+ features

BPP+ includes support for the Blitz! BASIC Compiler. For comprehensive information on Blitz! compilation, directives, and the `::` extension marker, see [Blitz! BASIC Compiler](../../bpp-plus-preprocessor/language-specification/blitz-basic-compiler.md).

**Labels:** Definitions (ending with `:`) and references

```cbmbas
main:
    gosub init
```

**Scopes:** Declarations and references

```cbmbas
screen: {
    init:
        return
}
gosub screen.init
```

**Includes:** `!include` keyword, type specifiers, file paths

```cbmbas
!include source "lib/screen.bpp"
```

**Statement chaining:** Backslash (`\`) continuation

```cbmbas
print "{clr}";\
print "{wht}Hello";\
```

### Extension symbols

Prof. Plum's C*Base extensions:

- `@` - Extended commands
- `←` - Arrow-left

```cbmbas
@ "dos command"
← variable
```

The `::` prefix prevents Blitz! compilation, forcing runtime interpretation. See [Blitz! BASIC Compiler](../../bpp-plus-preprocessor/language-specification/blitz-basic-compiler.md) for detailed information on the `::` extension marker and other Blitz! directives.

## Color schemes

The extension uses semantic token types that adapt to your VS Code color theme:

- Keywords
- Functions
- Operators
- Numbers
- Strings
- Comments
- Variables

Choose your preferred color theme in VS Code settings.

---

## See also

- [Code snippets](code-snippets.md) - Available snippets
- [BASIC v2 language reference](../reference/basic-v2-language.md) - BASIC v2 highlighting details
- [BPP+ features](../reference/bpp-plus-features.md) - BPP+ highlighting details
