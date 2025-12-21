# PETSCII control characters

The extension provides snippets for Commodore 64 PETSCII control characters in two forms:

- **Token form:** `{wht}`, `{clr}`, `{down}` - Used inside strings
- **chr$ form:** `chr$(5)`, `chr$(147)`, `chr$(17)` - Function calls

## Available snippets

### Colors

`{wht}`, `{red}`, `{grn}`, `{blu}`, `{blk}`, `{cyn}`, `{pur}`, `{yel}`, `{orng}`, `{brn}`, `{lred}`, `{gry1}`, `{gry2}`, `{lgrn}`, `{lblu}`, `{gry3}`

```cbmbas
print "{wht}White text"
print chr$(5);"Also white"
```

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

The extension highlights these patterns inside strings:

- **Basic tokens:** `{clr}`, `{wht}`
- **Repetition:** `{10 space}`, `{5 down}`
- **Ranges:** `{a-z}`, `{0-9}`

```cbmbas
print "{clr}{5 down}{10 space}{wht}Title"
```

---

## Complete reference

For complete PETSCII character codes, descriptions, and BPP+ token syntax details, see:

- [BPP+ PETSCII control codes](../../bpp-plus-preprocessor/language-specification/petscii-control-codes.md) - Complete token reference
- [Code snippets](../features/code-snippets.md) - All available snippets

## See also

- [Code snippets](../features/code-snippets.md) - Complete snippet list
- [BASIC v2 language reference](basic-v2-language.md) - String and chr$ functions
