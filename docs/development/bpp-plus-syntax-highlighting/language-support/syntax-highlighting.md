# Syntax highlighting

BASIC v2 and BPP+ language elements using TextMate grammar patterns.

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

See [BASIC v2 language reference](../reference/basic-v2-language.md#control-flow-keywords).

### Built-in functions

Math, string, and system functions:

```cbmbas
a = abs(-5)
b$ = chr$(65)
c = peek(53280)
```

See [BASIC v2 language reference](../reference/basic-v2-language.md#built-in-functions).

### Variables

Variable names with type suffixes (`$` for string, `%` for integer):

```cbmbas
a = 10
name$ = "hello"
count% = 100
```

See [BASIC v2 language reference](../reference/basic-v2-language.md#variables).

### Numbers

Line numbers, decimal, hexadecimal, and binary formats:

```cbmbas
10 a = 255
20 b = $ff
30 c = %11111111
```

Hexadecimal (`$`) and binary (`%`) are BPP+ extensions. See [BASIC v2 Numbers](../reference/basic-v2-language.md#numbers).

### Comments

`rem` (BASIC v2) and `;` (BPP+) comments:

```cbmbas
rem BASIC comment
; BPP+ comment
```

Both are removed during preprocessing. See [BASIC v2 Comments](../reference/basic-v2-language.md#comments) and [BPP+ Comments](../reference/bpp-plus-features.md#comments).

### Strings and PETSCII tokens

Double-quoted strings with embedded PETSCII control characters:

```cbmbas
print "{clr}{wht}Hello"
print "{10 space}Text"
print "{a-z}"
```

Tokens support basic codes (`{clr}`), repetition (`{10 space}`), and ranges (`{a-z}`). See [Control characters reference](../reference/control-characters.md).

### Labels

Label definitions and references:

```cbmbas
main:
    gosub init
    end

init:
    print "initialized"
    return
```

See [BPP+ features](../reference/bpp-plus-features.md#labels).

### Scopes

Hierarchical namespaces:

```cbmbas
screen: {
    init:
        poke 53280,0
        return
}

gosub screen.init
```

See [BPP+ features](../reference/bpp-plus-features.md#scopes).

### Includes

`!include` directives for source and data:

```cbmbas
!include source "lib/screen.bpp"
!include data "charset.bin"
```

See [BPP+ features](../reference/bpp-plus-features.md#include-directives).

### Statement chaining

Backslash continuation character:

```cbmbas
print "{clr}";\
print "{wht}Hello";\
return
```

See [BPP+ features](../reference/bpp-plus-features.md#statement-chaining).

### System variables

Reserved BASIC v2 system variables, distinguished from regular user variables:

```cbmbas
if st<>0 then print "i/o error"
t = ti
t$ = ti$
```

- **`st`** - I/O status word (updated after each I/O operation)
- **`ti`** - Jiffy clock counter (increments 60 times per second)
- **`ti$`** - Jiffy clock as six-digit time string (`HHMMSS`)

### Blitz! directives

Blitz! compiler control directives, all highlighted as preprocessor directives:

```cbmbas
rem ** se
rem ** ia
!blitz sp 1234
:: print "runtime only"
```

- **`rem **`** - Native Blitz! directive (matched before regular comments)
- **`!blitz`** - BPP+ alternative form, equivalent to `rem **`
- **`::`** - Extension marker, forces runtime interpretation of the following statement

See [BPP+ features](../reference/bpp-plus-features.md#blitz-compiler-control).

### Extension symbols

See [Extension symbols](../reference/extension-symbols.md) for MCI commands and Prof. Plum extensions.

## Color schemes

Semantic token types adapt to your VS Code color theme:

- Keywords
- Functions
- Operators
- Numbers
- Strings
- Comments
- Variables
- Preprocessor directives

Choose your preferred color theme in VS Code settings.

---

## See also

- [Code snippets](code-snippets.md)
- [BASIC v2 language reference](../reference/basic-v2-language.md)
- [BPP+ features](../reference/bpp-plus-features.md)
