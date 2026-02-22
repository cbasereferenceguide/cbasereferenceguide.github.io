# PETSCII control characters

Snippets for all Commodore 64 PETSCII control characters in two forms:

- **Token form:** `{wht}`, `{clr}`, `{down}` - BPP+ syntax for string embedding
- **chr$ form:** `chr$(5)`, `chr$(147)`, `chr$(17)` - Standard BASIC v2 function calls

## Available snippets

### Colors

All 16 C64 color codes available as snippets:

`{wht}`, `{red}`, `{grn}`, `{blu}`, `{blk}`, `{cyn}`, `{pur}`, `{yel}`, `{orng}`, `{brn}`, `{lred}`, `{gry1}`, `{gry2}`, `{lgrn}`, `{lblu}`, `{gry3}`

```cbmbas
print "{wht}White text"
print chr$(5);"Also white"
```

#### Color code reference

| Token    | chr$ Code | Decimal | Color        |
| :------- | :-------- | :------ | :----------- |
| `{blk}`  | chr$(144) | 144     | Black        |
| `{wht}`  | chr$(5)   | 5       | White        |
| `{red}`  | chr$(28)  | 28      | Red          |
| `{cyn}`  | chr$(159) | 159     | Cyan         |
| `{pur}`  | chr$(156) | 156     | Purple       |
| `{grn}`  | chr$(30)  | 30      | Green        |
| `{blu}`  | chr$(31)  | 31      | Blue         |
| `{yel}`  | chr$(158) | 158     | Yellow       |
| `{orng}` | chr$(129) | 129     | Orange       |
| `{brn}`  | chr$(149) | 149     | Brown        |
| `{lred}` | chr$(150) | 150     | Light Red    |
| `{gry1}` | chr$(151) | 151     | Dark Gray    |
| `{gry2}` | chr$(152) | 152     | Medium Gray  |
| `{lgrn}` | chr$(153) | 153     | Light Green  |
| `{lblu}` | chr$(154) | 154     | Light Blue   |
| `{gry3}` | chr$(155) | 155     | Light Gray   |

Colors affect subsequent printed text until another color code is encountered.

### Cursor movement

`{up}`, `{down}`, `{left}`, `{rght}`, `{home}`, `{clr}`

```cbmbas
print "{home}{down}{down}Text"
print "{5 down}"          rem Repetition syntax
```

### Text modes

`{rvon}`, `{rvof}`, `{swuc}`, `{swlc}`

```cbmbas
print "{rvon}Reversed{rvof}"
```

### Editing

`{del}`, `{inst}`

### Function keys

`{f1}`, `{f2}`, `{f3}`, `{f4}`, `{f5}`, `{f6}`, `{f7}`, `{f8}`

### Special characters

`{return}`, `{space}`, `{pi}`, `{esc}`, `{stop}`, `{dish}`, `{ensh}`, `{sret}`

### Control key combinations

`{CTRL-A}` through `{CTRL-Z}` (excluding standard mappings above)

## Token syntax features

Advanced token patterns within strings. These are BPP+ preprocessor extensions that compile to equivalent chr$ codes or character sequences.

### Basic tokens

Single control characters enclosed in braces:

```cbmbas
"{clr}"     rem Clear screen
"{wht}"     rem White color
"{down}"    rem Cursor down
```

### Repetition syntax

Repeat a token multiple times using numeric prefix:

```cbmbas
"{10 space}"    rem 10 spaces
"{5 down}"      rem Move cursor down 5 times
"{3 rght}"      rem Move cursor right 3 times
```

Compiles to repeated characters.

### Range syntax

Generate character sequences using dash notation:

```cbmbas
"{a-z}"     rem Lowercase alphabet (26 characters)
"{0-9}"     rem Digits 0 through 9 (10 characters)
"{A-Z}"     rem Uppercase alphabet (26 characters)
```

Useful for initialization, testing, or character set display.

### Combining patterns

Multiple tokens can be combined in a single string:

```cbmbas
print "{clr}{5 down}{10 space}{wht}Title"
```

The preprocessor processes tokens left-to-right, converting each to its compiled form.

### Token constraints

- Tokens must use exact names (case-insensitive)
- Repetition count must be positive integer (1-255)
- Range endpoints must be valid characters
- Ranges generate characters in PETSCII order
- Token delimiters `{` and `}` must be balanced

---

## See also

- [BPP+ PETSCII control characters](../../bpp-plus-preprocessor/language-specification/petscii-control-codes.md)
- [Code snippets](../language-support/code-snippets.md)
- [BASIC v2 language reference](basic-v2-language.md)
