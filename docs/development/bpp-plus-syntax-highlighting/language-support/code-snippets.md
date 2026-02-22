# Code snippets

Code snippets expand when you type a prefix and press Tab.

## How snippets work

Type a prefix and press `Tab`. The snippet expands with placeholders. Press `Tab` to move between placeholders. Press `Shift+Tab` to go back.

100+ snippets cover BASIC v2 keywords, functions, and PETSCII control characters.

Example:

```
Type:  for<Tab>
Expands to:  for <var>=<start> to <end>:<expr>:next <var>
Press Tab to move between placeholders
```

### Linked placeholders

Some snippets use linked placeholders that mirror changes:

```cbmbas
rem Type: for<Tab>
for i=1 to 10:print i:next i
    ^                      ^
    └────────────────────────┘
    Both "i" positions are linked
```

When you type the variable name at the first position, it automatically updates at the `next` statement.

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

## String functions

| Snippet  | Inserts                                    | Description        |
| :------- | :----------------------------------------- | :----------------- |
| `asc`    | `asc(<string>)`                            | Character to ASCII |
| `chr`    | `chr$(<numeric expression>)`               | ASCII to character |
| `left$`  | `left$(<string>,<integer number>)`         | Left substring     |
| `len`    | `len(<string>)`                            | String length      |
| `mid$`   | `mid$(<string>,<start>,<length optional>)` | Middle substring   |
| `right$` | `right$(<string>,<integer number>)`        | Right substring    |
| `str$`   | `str$(<number>)`                           | Number to string   |
| `val`    | `val(<string>)`                            | String to number   |

## Control flow

| Snippet | Inserts                                                    | Description            |
| :------ | :--------------------------------------------------------- | :--------------------- |
| `for`   | `for <var>=<start> to <end>:<expr>:next <var>`             | FOR loop               |
| `fors`  | `for <var>=<start> to <end> step <step>:<expr>:next <var>` | FOR loop with STEP     |
| `gosub` | `gosub <line/label>`                                       | Call subroutine        |
| `goto`  | `goto <line/label>`                                        | Jump to line           |
| `if`    | `if <condition> then/goto <line or expression>`            | Conditional            |
| `on`    | `on <index> gosub/goto <line>`                             | Computed GOSUB or GOTO |

## Variables and data

| Snippet | Inserts                               | Description         |
| :------ | :------------------------------------ | :------------------ |
| `data`  | `data <const>,<const>,<const>,...`    | Data statement      |
| `def`   | `def fn <name>(<param>)=<expression>` | Define function     |
| `dim`   | `dim <variable>(<d1>)`                | Dimension array     |
| `fn`    | `fn <function name>(<number>)`        | Call user function  |
| `let`   | `let <variable>=<expression>`         | Assign variable     |
| `read`  | `read <variable>`                     | Read DATA statement |

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

## Screen control

| Snippet | Inserts          | Description   |
| :------ | :--------------- | :------------ |
| `spc`   | `spc(<integer>)` | Print spaces  |
| `tab`   | `tab(<integer>)` | Tab to column |

## Comments

| Snippet | Inserts         | Description |
| :------ | :-------------- | :---------- |
| `rem`   | `rem <comment>` | Comment     |

## BPP+ preprocessor

| Snippet           | Inserts                    | Description               |
| :---------------- | :------------------------- | :------------------------ |
| `!include source` | `!include source "<path>"` | Include source file       |
| `!include data`   | `!include data "<path>"`   | Include binary data       |

## PETSCII control characters

All Commodore 64 control characters available as snippets in both token form (`{wht}`) and chr$ form (`chr$(5)`).

### Common PETSCII tokens

- **Colors:** `{wht}`, `{red}`, `{grn}`, `{blu}`, `{blk}`, `{cyn}`, `{pur}`, `{yel}`, `{orng}`, `{brn}`, `{lred}`, `{gry1}`, `{gry2}`, `{lgrn}`, `{lblu}`, `{gry3}`
- **Cursor:** `{up}`, `{down}`, `{left}`, `{rght}`, `{home}`, `{clr}`
- **Text modes:** `{rvon}`, `{rvof}`, `{swuc}`, `{swlc}`
- **Function keys:** `{f1}` through `{f8}`
- **Special:** `{return}`, `{space}`, `{pi}`, `{stop}`

See [Control characters reference](../reference/control-characters.md) for the complete list with chr$ codes and detailed descriptions.

---

## See also

- [Syntax highlighting](syntax-highlighting.md)
- [Control characters reference](../reference/control-characters.md)
