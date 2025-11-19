# Include directives

## Syntax

```cbmbas
!include <type> "<filepath>"
```

### Exact syntax rules

The include directive must match this pattern:

- Start with `!include`
- One or more spaces
- Type name (`source` or `data`)
- One or more spaces
- Double-quoted file path

#### Valid

```cbmbas
!include source "file.bpp"
!include  source  "file.bpp"        rem Multiple spaces OK
!include data "charset.bin"
```

#### Invalid

```cbmbas
!include source file.bpp            rem Missing quotes
!include source 'file.bpp'          rem Single quotes not supported
!includesource "file.bpp"           rem Missing space after !include
```

### Types

- `source` - Include another .bpp source file
- `data` - Convert binary file to DATA statements

## Source includes

```cbmbas
!include source "utilities.bpp"
```

### Behavior

- File contents inserted verbatim at directive location
- Included file processed recursively
- Labels inherit current [scope context](scope-hierarchies.md)
- Relative paths resolved from including file's directory

### Example

``` cbmbas title="screen-lib.bpp"
clear:
    print "{clr}";
    return

init:
    poke 53280,0
    return
```

```cbmbas title="main.bpp"
screen: {
    !include source "screen-lib.bpp"
}

gosub screen.clear
gosub screen.init
```

## Data includes

```cbmbas
!include data "charset.bin"
```

### Behavior

- Binary file read as byte array
- Generates BASIC DATA statements
- 16 bytes per DATA line for optimal loading (last line may contain fewer bytes)
- Suitable for character sets, sprites, music data

### Generated output

```cbmbas
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 24,36,66,66,126,66,66,0,0,0,0,0,0,0,0,0
data ...
```

### Usage pattern

```cbmbas
charset: {
    !include data "myfont.bin"
}

load_charset:
    restore charset                             rem Position data pointer
    for i = 0 to 2047
        read b
        poke charset_base + i, b
    next i
    return
```

## Path resolution

### Relative paths

Resolved relative to including file's directory

```cbmbas
!include source "utils.bpp"                     rem ./utils.bpp
!include source "lib/core.bpp"                  rem ./lib/core.bpp
!include source "../shared/common.bpp"          rem ../shared/common.bpp
```

### Absolute paths

Used directly

```cbmbas
!include source "/usr/local/lib/c64/stdlib.bpp"
```

### Special case: stdin

When processing input from stdin (piped input), relative includes cannot be resolved since there is no source file directory:

```bash
# This will fail if main.bpp contains relative includes
cat main.bpp | bpp

# Workaround: Use file input instead
bpp main.bpp
```

If you need to process from stdin and use includes, only absolute paths will work:

```cbmbas
rem This works from stdin
!include source "/absolute/path/to/lib.bpp"

rem This will fail from stdin
!include source "lib.bpp"
```

## Recursive includes

Includes can nest to arbitrary depth:

```bash
main.bpp
  → includes lib/screen.bpp
      → includes lib/colors.bpp
      → includes lib/petscii.bpp
  → includes lib/sound.bpp
      → includes lib/sid-registers.bpp
```

BPP+ tracks include stack to detect circular dependencies (though not explicitly validated in current implementation - will cause stack overflow).

---

## See also

- [Lexical structure](lexical-structure.md) - Include directive syntax
- [Scope hierarchies](scope-hierarchies.md) - How included files inherit scope context
- [Static analysis & validation](../advanced-topics/static-analysis-and-validation.md) - Include directive validation