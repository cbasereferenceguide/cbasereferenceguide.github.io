# BASIC v2 language reference

Syntax highlighting support for Commodore 64 BASIC v2 (Commodore BASIC 2.0).

## Control flow keywords

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

BASIC v2 built-in functions categorized by purpose:

### Mathematical functions

`abs`, `atn`, `cos`, `exp`, `int`, `log`, `rnd`, `sgn`, `sin`, `sqr`, `tan`

- **`abs(x)`** - Absolute value
- **`atn(x)`** - Arc tangent (result in radians)
- **`cos(x)`** - Cosine (argument in radians)
- **`exp(x)`** - Exponential (e^x)
- **`int(x)`** - Integer portion (truncates toward zero)
- **`log(x)`** - Natural logarithm (base e)
- **`rnd(x)`** - Random number (0 ≤ result < 1)
- **`sgn(x)`** - Sign function (-1, 0, or 1)
- **`sin(x)`** - Sine (argument in radians)
- **`sqr(x)`** - Square root
- **`tan(x)`** - Tangent (argument in radians)

### String functions

`asc`, `chr$`, `left$`, `len`, `mid$`, `right$`, `str$`, `val`

- **`asc(str$)`** - Returns ASCII/PETSCII code of first character
- **`chr$(code)`** - Converts numeric code to character
- **`left$(str$,n)`** - Returns n leftmost characters
- **`len(str$)`** - Returns string length (0-255)
- **`mid$(str$,start,length)`** - Extracts substring
- **`right$(str$,n)`** - Returns n rightmost characters
- **`str$(num)`** - Converts number to string
- **`val(str$)`** - Converts string to number

### System functions

`fre`, `peek`, `pos`, `usr`

- **`fre(0)`** - Returns free BASIC memory in bytes
- **`peek(addr)`** - Reads byte from memory address
- **`pos(0)`** - Returns cursor column position (0-39)
- **`usr(x)`** - Calls machine language routine

```cbmbas
a = abs(-5)
b$ = chr$(65)
c = peek(53280)
d$ = left$("hello",2)
m = fre(0)
```

## User-defined functions

`def fn` declarations and `fn` function calls:

```cbmbas
def fn sq(x) = x * x
a = fn sq(5)
```

## I/O and disk keywords

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

`dim`, `data`, `let`, `def`

```cbmbas
dim array(10)
data 1,2,3,4,5
read a,b,c
let x = 42
```

## Variables

Variable names with optional type suffixes:

- **Standard (float):** `a`, `counter` - 40-bit floating point (default)
- **String:** `name$`, `text$` - Variable-length strings (up to 255 chars)
- **Integer:** `x%`, `count%` - 16-bit signed (-32768 to 32767)

```cbmbas
a = 10
name$ = "hello"
count% = 100
```

### Variable naming rules

BASIC v2 enforces these constraints:

- **First two characters significant** - `counter` and `count` are the same variable
- **Must start with letter** - Cannot begin with digit or special character
- **Type suffix last** - Dollar sign ($) or percent (%) must be final character
- **Case insensitive** - `NAME$` and `name$` refer to same variable
- **Reserved words forbidden** - Cannot use BASIC keywords as variable names

## Operators

- **Arithmetic:** `+`, `-`, `*`, `/`, `^`
- **Comparison:** `=`, `<>`, `<`, `>`, `<=`, `>=`
- **Logical:** `and`, `or`, `not`

```cbmbas
a = 5 + 3
if a>5 and b<10 then print "yes"
```

## Numbers

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

- **REM comments:** `rem This is a comment`
- **Semicolon comments:** `; BPP+ comment syntax`

```cbmbas
rem BASIC comment
10 rem Comment after line number
; BPP+ comment
```

BPP+ removes both comment types during preprocessing. Exception: Blitz! compiler directives (`rem **`) are preserved.

## Strings

Double-quoted strings and embedded PETSCII tokens:

```cbmbas
a$ = "simple string"
b$ = "{clr}{wht}Hello"
c$ = "{10 space}Indented"
```

Token syntax inside strings:

- **Basic tokens:** `{clr}`, `{wht}`, `{down}`
- **Repetition:** `{10 space}`, `{5 down}`
- **Ranges:** `{a-z}`, `{0-9}`

## Extension symbols

See [Extension symbols](extension-symbols.md) for MCI commands and Prof. Plum extensions.

---

## See also

- [BPP+ features](bpp-plus-features.md)
- [Control characters](control-characters.md)
- [Extension symbols](extension-symbols.md)
- [Syntax highlighting](../language-support/syntax-highlighting.md)
