# BASIC v2 language reference

What the extension highlights in Commodore 64 BASIC v2 files.

## Control flow keywords

The extension highlights these control flow keywords:

`end`, `for`, `next`, `gosub`, `goto`, `if`, `then`, `step`, `stop`, `return`, `to`, `on`

```cbmbas
for i=1 to 10 step 2
    print i
next i

if x=5 then print "found"
on n gosub 100,200,300
gosub 1000
return
end
```

## Built-in functions

The extension highlights these BASIC v2 functions:

`abs`, `asc`, `atn`, `chr$`, `cos`, `exp`, `int`, `len`, `left$`, `mid$`, `peek`, `pos`, `rnd`, `right$`, `sgn`, `sin`, `sqr`, `tan`, `str$`, `usr`, `val`

```cbmbas
a = abs(-5)
b$ = chr$(65)
c = peek(53280)
d$ = left$("hello",2)
```

## User-defined functions

The extension highlights `def fn` declarations and `fn` function calls:

```cbmbas
def fn sq(x) = x * x
a = fn sq(5)
```

## I/O and disk keywords

The extension highlights these keywords:

`print`, `print#`, `input`, `input#`, `open`, `close`, `load`, `list`, `save`, `restore`, `read`, `get`, `get#`, `poke`, `peek`, `sys`, `run`, `verify`, `wait`

```cbmbas
print "Hello"
input "Name";n$
open 1,8,2,"file,s,w"
load "program",8
poke 53280,0
sys 49152
```

## Storage keywords

The extension highlights these keywords:

`dim`, `data`, `let`, `def`

```cbmbas
dim array(10)
data 1,2,3,4,5
read a,b,c
let x = 42
```

## Variables

The extension highlights variable names with optional type suffixes:

- Standard variables: `a`, `counter`
- String variables: `name$`, `text$`
- Integer variables: `x%`, `count%`

```cbmbas
a = 10
name$ = "hello"
count% = 100
```

## Operators

The extension highlights these operators:

- **Arithmetic:** `+`, `-`, `*`, `/`, `^`
- **Comparison:** `=`, `<>`, `<`, `>`, `<=`, `>=`
- **Logical:** `and`, `or`, `not`

```cbmbas
a = 5 + 3
if a>5 and b<10 then print "yes"
```

## Numbers

The extension highlights:

- **Line numbers:** At start of line (e.g., `10`, `100`)
- **Decimal:** `255`, `3.14159`
- **Hexadecimal:** `$ff`, `$c000` (BPP+ preprocessor feature)
- **Binary:** `%11111111`, `%10101010` (BPP+ preprocessor feature)

```cbmbas
10 a = 255
20 b = $ff
30 c = %11111111
```

## Comments

The extension highlights:

- **REM comments:** `rem This is a comment`
- **BPP+ semicolon comments:** `; This is also a comment`

```cbmbas
rem BASIC comment
10 rem Comment after line number
; BPP+ comment (stripped during preprocessing)
```

## Strings

The extension highlights double-quoted strings and embedded PETSCII tokens:

```cbmbas
a$ = "simple string"
b$ = "{clr}{wht}Hello"
c$ = "{10 space}Indented"
```

Token syntax inside strings:

- **Basic tokens:** `{clr}`, `{wht}`, `{down}`
- **Repetition:** `{10 space}`, `{5 down}`
- **Ranges:** `{a-z}`, `{0-9}`

## BPP+ statement chaining

The extension highlights the backslash (`\`) continuation character:

```cbmbas
print "{clr}";\
print "{wht}Hello";\
return
```

## Extension symbols

The extension highlights Prof. Plum extension symbols:

- `@` - DOS commands
- `←` - Arrow-left

```cbmbas
@ "dos command"
← variable
```

---

## See also

- [BPP+ features](bpp-plus-features.md) - BPP+ preprocessor syntax
- [Control characters](control-characters.md) - PETSCII tokens reference
- [Syntax highlighting](../features/syntax-highlighting.md) - Visual styling
