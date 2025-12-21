# Code snippets

Code snippets provide rapid code entry with tab-navigable placeholders.

## How to use snippets

1. Type the snippet prefix
2. Press `Tab` or `Enter`
3. The snippet expands with placeholders
4. Press `Tab` to move between placeholders
5. Type your values

Example:

```
Type:  for<Tab>
Expands to:  for <var>=<start> to <end>:<expr>:next <var>
Press Tab:   Move to each placeholder and type your values
```

## Mathematical functions

| Snippet | Inserts                     | Description       |
| :------ | :-------------------------- | :---------------- |
| `abs`   | `abs(<numeric expression>)` | Absolute value    |
| `atn`   | `atn(<numeric expression>)` | Arc tangent       |
| `cos`   | `cos(<numeric expression>)` | Cosine            |
| `exp`   | `exp(<number>)`             | Exponential       |
| `int`   | `int(<number>)`             | Integer portion   |
| `log`   | `log(<number>)`             | Natural logarithm |
| `rnd`   | `rnd(<number>)*<number>`    | Random number     |
| `sgn`   | `sgn(<number>)`             | Sign (-1, 0, 1)   |
| `sin`   | `sin(<numeric expression>)` | Sine              |
| `sqr`   | `sqr(<number>)`             | Square root       |
| `tan`   | `tan(<number>)`             | Tangent           |

### Example usage

```cbmbas
rem Type: sqr<Tab>
a = sqr(16)

rem Type: rnd<Tab>
x = rnd(1)*100

rem Type: int<Tab>
b = int(3.7)
```

## String functions

| Snippet  | Inserts                                 | Description        |
| :------- | :-------------------------------------- | :----------------- |
| `asc`    | `asc(<string>)`                         | Character to ASCII |
| `chr`    | `chr$(<numeric expression>)`            | ASCII to character |
| `left$`  | `left$(<string>,<integer number>)`      | Left substring     |
| `len`    | `len(<string>)`                         | String length      |
| `mid$`   | `mid$(<string>,<start>,<end optional>)` | Middle substring   |
| `right$` | `right$(<string>,<integer number>)`     | Right substring    |
| `str$`   | `str$(<number>)`                        | Number to string   |
| `val`    | `val(<string>)`                         | String to number   |

### Example usage

```cbmbas
rem Type: chr<Tab>
a$ = chr$(65)

rem Type: left$<Tab>
b$ = left$("hello",2)

rem Type: mid$<Tab>
c$ = mid$("hello",2,2)
```

## Control flow

| Snippet | Inserts                                                    | Description            |
| :------ | :--------------------------------------------------------- | :--------------------- |
| `for`   | `for <var>=<start> to <end>:<expr>:next <var>`             | FOR loop               |
| `fors`  | `for <var>=<start> to <end> step <step>:<expr>:next <var>` | FOR loop with STEP     |
| `gosub` | `gosub <line/label>`                                       | Call subroutine        |
| `goto`  | `goto <line/label>`                                        | Jump to line           |
| `if`    | `if <condition> then/goto <line or expression>`            | Conditional            |
| `on`    | `on <index> gosub/goto <line>`                             | Computed GOSUB or GOTO |

### Example usage

```cbmbas
rem Type: for<Tab>
for i=1 to 10:print i:next i

rem Type: fors<Tab>
for i=10 to 1 step -1:print i:next i

rem Type: if<Tab>
if x=5 then print "found"

rem Type: on<Tab>
on n gosub 100,200,300
```

## Variables and data

| Snippet | Inserts                               | Description         |
| :------ | :------------------------------------ | :------------------ |
| `data`  | `data <const>,<const>,<const>,...`    | Data statement      |
| `def`   | `def fn <name>(<param>)=<expression>` | Define function     |
| `dim`   | `dim <variable>(<d1>)`                | Dimension array     |
| `fn`    | `fn <function name>(<number>)`        | Call user function  |
| `let`   | `let <variable>=<expression>`         | Assign variable     |
| `read`  | `read <variable>`                     | Read DATA statement |

### Example usage

```cbmbas
rem Type: data<Tab>
data 1,2,3,4,5,6,7,8

rem Type: dim<Tab>
dim array(100)

rem Type: def<Tab>
def fn sq(x)=x*x

rem Type: fn<Tab>
a = fn sq(5)
```

The `data` snippet provides 8 placeholders for common data entry patterns.

## Input/Output

| Snippet  | Inserts                           | Description           |
| :------- | :-------------------------------- | :-------------------- |
| `cmd`    | `cmd <logical file>,<expression>` | Redirect output       |
| `get`    | `get <variable>`                  | Get character         |
| `get#`   | `get#<logical file>,<variable>`   | Get from file         |
| `input`  | `input <string>;<variable>`       | Input with prompt     |
| `input#` | `input#<logical file>,<variable>` | Input from file       |
| `print`  | `print <expression>`              | Print to screen       |
| `print#` | `print#<logical file>,<variable>` | Print to file         |

### Example usage

```cbmbas
rem Type: print<Tab>
print "hello world"

rem Type: input<Tab>
input "enter name";n$

rem Type: get<Tab>
get k$
```

## File operations

| Snippet  | Inserts                                    | Description  |
| :------- | :----------------------------------------- | :----------- |
| `close`  | `close <logical file number>`              | Close file   |
| `load`   | `load <filename>,<device>,<secondary>`     | Load program |
| `open`   | `open <logical file>,<device>,<secondary>` | Open file    |
| `save`   | `save <filename>,<device>,<secondary>`     | Save program |
| `verify` | `verify <filename>,<device>`               | Verify file  |

### Example usage

```cbmbas
rem Type: open<Tab>
open 1,8,2,"data,s,w"

rem Type: close<Tab>
close 1

rem Type: load<Tab>
load "program",8,1
```

## Memory and system

| Snippet | Inserts                                 | Description       |
| :------ | :-------------------------------------- | :---------------- |
| `fre`   | `fre(<dummy argument>)`                 | Free memory       |
| `peek`  | `peek(<memory address>)`                | Read memory       |
| `poke`  | `poke <memory address>,<number>`        | Write memory      |
| `pos`   | `pos(<dummy argument>)`                 | Cursor position   |
| `sys`   | `sys <address>`                         | Call machine code |
| `usr`   | `usr(<number>)`                         | User function     |
| `wait`  | `wait <address>,<and mask>,<flip mask>` | Wait for memory   |

### Example usage

```cbmbas
rem Type: poke<Tab>
poke 53280,0

rem Type: peek<Tab>
a = peek(53280)

rem Type: sys<Tab>
sys 49152
```

## Screen control

| Snippet | Inserts          | Description   |
| :------ | :--------------- | :------------ |
| `spc`   | `spc(<integer>)` | Print spaces  |
| `tab`   | `tab(<integer>)` | Tab to column |

### Example usage

```cbmbas
rem Type: tab<Tab>
print tab(10);"text"

rem Type: spc<Tab>
print spc(5);"text"
```

## Comments

| Snippet | Inserts         | Description |
| :------ | :-------------- | :---------- |
| `rem`   | `rem <comment>` | Comment     |

### Example usage

```cbmbas
rem Type: rem<Tab>
rem This is a comment
```

## BPP+ preprocessor

| Snippet           | Inserts                    | Description               |
| :---------------- | :------------------------- | :------------------------ |
| `!include source` | `!include source "<path>"` | Include source file       |
| `!include data`   | `!include data "<path>"`   | Include binary data       |

### Example usage

```cbmbas
rem Type: !include source<Tab>
!include source "lib/screen.bpp"

rem Type: !include data<Tab>
charset: {
    !include data "myfont.bin"
}
```

## PETSCII control characters

All Commodore 64 control characters available as snippets in both token form (`{wht}`) and chr$ form (`chr$(5)`).

Quick reference for common tokens:

- **Colors:** `{wht}`, `{red}`, `{grn}`, `{blu}`, `{blk}`, `{cyn}`, `{pur}`, `{yel}` (plus 8 more)
- **Cursor:** `{up}`, `{down}`, `{left}`, `{rght}`, `{home}`, `{clr}`
- **Text modes:** `{rvon}`, `{rvof}`, `{swuc}`, `{swlc}`
- **Function keys:** `{f1}` through `{f8}`
- **Special:** `{return}`, `{space}`, `{pi}`, `{stop}`

```cbmbas
rem Type: {clr}<Tab>
print "{clr}"

rem Type: {wht}<Tab>
print "{wht}Hello"

rem Combining tokens
print "{clr}{wht}{down}{down}Welcome!"
```

See [Control characters reference](../reference/control-characters.md) for the complete list with chr$ codes.

---

## See also

- [Syntax highlighting](syntax-highlighting.md) - Visual styling details
- [Control characters reference](../reference/control-characters.md) - Complete PETSCII character reference
