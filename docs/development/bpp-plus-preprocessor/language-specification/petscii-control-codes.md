# PETSCII control codes

BPP+ supports PETSCII control codes using curly-brace notation `{code}` for screen control, colors, and special characters. These codes are automatically converted during preprocessing.

## Colors

### Text colors

| Code                        | Description      | Example                     |
| :-------------------------- | :--------------- | :-------------------------- |
| `{wht}` or `{white}`        | White            | `print "{wht}white text"`   |
| `{red}`                     | Red              | `print "{red}red text"`     |
| `{grn}` or `{green}`        | Green            | `print "{grn}green text"`   |
| `{blu}` or `{blue}`         | Blue             | `print "{blu}blue text"`    |
| `{blk}` or `{black}`        | Black            | `print "{blk}black text"`   |
| `{orng}` or `{orange}`      | Orange           | `print "{orng}orange text"` |
| `{brn}` or `{brown}`        | Brown            | `print "{brn}brown text"`   |
| `{lred}` or `{pink}`        | Light Red / Pink | `print "{lred}pink text"`   |
| `{gry1}` or `{dark gray}`   | Dark Gray        | `print "{gry1}dark gray"`   |
| `{gry2}` or `{gray}`        | Gray             | `print "{gry2}gray text"`   |
| `{lgrn}` or `{light green}` | Light Green      | `print "{lgrn}light green"` |
| `{lblu}` or `{light blue}`  | Light Blue       | `print "{lblu}light blue"`  |
| `{gry3}` or `{light gray}`  | Light Gray       | `print "{gry3}light gray"`  |
| `{pur}` or `{purple}`       | Purple           | `print "{pur}purple text"`  |
| `{yel}` or `{yellow}`       | Yellow           | `print "{yel}yellow text"`  |
| `{cyn}` or `{cyan}`         | Cyan             | `print "{cyn}cyan text"`    |

## Screen control

### Cursor movement

| Code                  | Description                             | Example          |
| :-------------------- | :-------------------------------------- | :--------------- |
| `{home}`              | Move cursor to home position (top-left) | `print "{home}"` |
| `{clr}` or `{clear}`  | Clear screen                            | `print "{clr}"`  |
| `{up}`                | Cursor up                               | `print "{up}"`   |
| `{down}`              | Cursor down                             | `print "{down}"` |
| `{left}`              | Cursor left                             | `print "{left}"` |
| `{rght}` or `{right}` | Cursor right                            | `print "{rght}"` |

### Repetition syntax

Certain PETSCII control codes can be repeated using a numeric prefix or suffix:

```cbmbas
print "{3 right}"       rem Same as {right}{right}{right}
print "{right*3}"       rem Same as above (alternative syntax)
print "{5 down}"        rem Same as {down}{down}{down}{down}{down}
print "{10 space}"      rem 10 spaces
print "{space*10}"      rem Same as above
```

Patterns: `{number code}` or `{code*number}`

Both formats produce identical output. Use whichever format you find more readable.

#### Important limitation

The repetition syntax ONLY works with predefined PETSCII control codes listed in this document. It does NOT work with regular keyboard characters like letters, numbers, or basic punctuation.

```cbmbas
rem WORKS: Repeating control codes (both syntaxes)
print "{40 space}"      rem 40 spaces
print "{space*40}"      rem Same as above
print "{20 down}"       rem Move down 20 lines
print "{down*20}"       rem Same as above
print "{home}{25 down}" rem Position cursor at line 25

rem WORKS: PETSCII graphic characters (CBM + key combinations)
print "{40 cbm-t}"      rem 40 horizontal line characters
print "{cbm-t*40}"      rem Same as above
print "{20 cbm-q}"      rem 20 vertical line characters
print "{10 shift-*}"    rem 10 filled circle characters

rem DOES NOT WORK: Regular keyboard characters
print "{20 *}"          rem ERROR: Plain * is not a control code
print "{10 a}"          rem ERROR: Plain letters don't work
print "{40 -}"          rem ERROR: Plain hyphen doesn't work
```

### Display control

| Code                                      | Description       | Example                   |
| :---------------------------------------- | :---------------- | :------------------------ |
| `{rvson}` or `{reverse on}`               | Reverse video on  | `print "{rvson}reversed"` |
| `{rvof}` or `{rvsoff}` or `{reverse off}` | Reverse video off | `print "{rvof}normal"`    |
| `{inst}` or `{insert}`                    | Insert character  | `print "{inst}"`          |
| `{del}` or `{delete}`                     | Delete character  | `print "{del}"`           |

### Character set control

| Code                       | Description                       | Example          |
| :------------------------- | :-------------------------------- | :--------------- |
| `{swlc}` or `{lower case}` | Switch to lowercase character set | `print "{swlc}"` |
| `{swuc}` or `{upper case}` | Switch to uppercase character set | `print "{swuc}"` |
| `{dish}`                   | Disable SHIFT+Commodore           | `print "{dish}"` |
| `{ensh}`                   | Enable SHIFT+Commodore            | `print "{ensh}"` |

## Function keys

| Code   | Description     | Example        |
| :----- | :-------------- | :------------- |
| `{f1}` | Function key F1 | `print "{f1}"` |
| `{f2}` | Function key F2 | `print "{f2}"` |
| `{f3}` | Function key F3 | `print "{f3}"` |
| `{f4}` | Function key F4 | `print "{f4}"` |
| `{f5}` | Function key F5 | `print "{f5}"` |
| `{f6}` | Function key F6 | `print "{f6}"` |
| `{f7}` | Function key F7 | `print "{f7}"` |
| `{f8}` | Function key F8 | `print "{f8}"` |

## Special characters

| Code                         | Description      | Example                      |
| :--------------------------- | :--------------- | :--------------------------- |
| `{space}`                    | Space character  | `print "word{space}word"`    |
| `{return}`                   | Return character | `print "line1{return}line2"` |
| `{sret}` or `{shift return}` | Shift+Return     | `print "{sret}"`             |
| `{stop}`                     | STOP key         | `print "{stop}"`             |
| `{esc}`                      | ESC key          | `print "{esc}"`              |

## Control characters (Low-level)

### CTRL sequences

BPP+ supports direct CTRL key combinations:

| Code                               | Description                   |
| :--------------------------------- | :---------------------------- |
| `{ctrl-a}` through `{ctrl-z}`      | Control + letter combinations |
| `{ctrl-3}`, `{ctrl-6}`, `{ctrl-7}` | Control + number combinations |

### CBM (Commodore) key sequences

| Code Pattern   | Description                                         |
| :------------- | :-------------------------------------------------- |
| `{cbm-letter}` | Commodore key + letter (e.g., `{cbm-a}`, `{cbm-z}`) |
| `{cbm-symbol}` | Commodore key + symbol (e.g., `{cbm-*}`, `{cbm-+}`) |

### SHIFT sequences

| Code Pattern     | Description                                     |
| :--------------- | :---------------------------------------------- |
| `{shift-letter}` | Shift + letter (e.g., `{shift-a}`, `{shift-z}`) |
| `{shift-symbol}` | Shift + symbol (e.g., `{shift-*}`, `{shift-@}`) |
| `{shift-space}`  | Shifted space                                   |

### Raw hex values

For direct character codes, use hex notation:

```cbmbas
print "{$00}"    rem Character code 0
print "{$1f}"    rem Character code 31
print "{$ff}"    rem Character code 255
```

## Usage examples

### Clear screen and set colors

```cbmbas
init:
    print "{clr}{blu}"              rem Clear screen, blue text
    print "{home}WELCOME{return}"   rem Title at top
    return
```

### Menu with colors

```cbmbas
menu:
    print "{clr}"
    print "{yel}MAIN MENU{wht}"
    print
    print "{grn}1.{wht} START GAME"
    print "{grn}2.{wht} OPTIONS"
    print "{grn}3.{wht} QUIT"
    return
```

### Reverse video highlight

```cbmbas
highlight:
    print "{rvson}>>> SELECTED <<<{rvof}"
    return
```

### Cursor positioning with repetition

```cbmbas
status:
    print "{home}{3 down}"           rem Move to line 4
    print "{5 right}"                rem Move 5 columns right
    print "SCORE: ";$sc
    return
```

### Character set switching

```cbmbas
init_screen:
    print "{clr}{swlc}"              rem Clear and switch to lowercase
    print "Mixed CASE text"
    print "{swuc}"                   rem Back to uppercase
    return
```

### Drawing patterns with PETSCII graphics

```cbmbas
border:
    print "{home}{40 cbm-t}"             rem Top border with repetition
    print "{home}{23 down}{40 cbm-t}"    rem Bottom border
    return

box:
    print "{home}{cbm-@}";               rem Top-left corner
    for i=1 to 38: print "{cbm-t}";: next i
    print "{cbm-i}"                      rem Top-right corner
    return
```

Common line drawing characters: `{cbm-t}` (horizontal), `{cbm-q}` (vertical), `{cbm-@}`, `{cbm-i}`, `{cbm-k}`, `{cbm-j}` (corners)

## Case insensitivity

Control codes are case-insensitive. These are equivalent:

```cbmbas
print "{clr}"     rem lowercase
print "{CLR}"     rem uppercase
print "{Clr}"     rem mixed case
```

## Alternative names

Many control codes have multiple aliases:

```cbmbas
{clr} = {clear}
{rvson} = {reverse on}
{wht} = {white}
{rght} = {right}
{del} = {delete}
```

Use whichever form is most readable in your code.

## Technical notes

### Internal processing

Control codes are processed during the preprocessing stage:

1. Codes are temporarily escaped to `~code~` format during parsing
2. Label resolution and line generation occurs
3. Codes are unescaped back to `{code}` format in output
4. Petcat converts them to actual PETSCII bytes during tokenization

### Conflicting with BASIC code

Control codes in string literals are safe:

```cbmbas
rem CORRECT: In strings
print "{clr}HELLO"

rem WRONG: Not in strings - will cause parse errors
a={clr}
```

Control codes should only appear in string literals, not in BASIC expressions.

---

## See also

- [Lexical structure](../language-specification/lexical-structure.md) - Token types including control codes
- [Compilation pipeline](../getting-started/compilation-pipeline.md) - How Petcat processes PETSCII codes
