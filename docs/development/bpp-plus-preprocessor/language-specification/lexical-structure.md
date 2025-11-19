# Lexical structure

## Tokens

BPP+ recognizes the following token types:

- **Label definitions:** `<identifier>:`
- **Label references:** `<identifier>` or `<scope-path>.<identifier>`
- **Scope delimiters:** `{` `}`
- **Statement separator:** `:`
- **Line continuation:** `\`
- **Comments:** `rem <text>` or `; <text>`
- **Directives:** `!include <type> "<path>"` or `!blitz <directive>`
- **Extension marker:** `::` (Blitz! runtime interpretation)
- **Build tokens:** `{builddate}`, `{buildtime}`, `{buildstamp}`
- **String literals:** Quoted text including empty strings `""`
- **BASIC keywords:** All standard BASIC v2 keywords (preserved as-is)

## Identifier syntax

```
identifier := [a-zA-Z_][a-zA-Z0-9_]*
```

### Constraints

- Must start with alphabetic character or underscore
- May contain alphanumeric characters and underscores
- Case-insensitive (normalized to lowercase internally)
- Cannot be BASIC v2 reserved keywords
- No hyphens or special characters permitted

### Valid identifiers

```cbmbas
main
loop_1
_private
playerX
INIT_SCREEN
```

### Invalid identifiers

```cbmbas
1main                       rem starts with digit
player-x                    rem contains hyphen
init$                       rem contains special character
for                         rem BASIC keyword
@label                      rem starts with special character
```

## Comments

Two comment syntaxes supported:

```cbmbas
rem This is a BASIC comment (stripped from output)
; This is a BPP+ comment (stripped during preprocessing)
```

### Comment syntax rules

####  REM comments

- Must match pattern: `rem` followed by space, then comment text
- `rem foo` → removed from output
- `rem **` → preserved (Blitz! directive, requires space before `**`)
- `rem  **` → preserved (multiple spaces OK)
- `rem**` → removed (no space before `**`)

#### Semicolon comments

- Start with `;` character
- Always removed during preprocessing
- No exceptions (cannot be preserved like Blitz! directives)

### Comment placement

#### Important

Both REM and `;` comments can only appear as separate statements, not inline after code:

```cbmbas
rem CORRECT: Comment as separate statement
poke 53280,0
gosub main

rem CORRECT: Comment on its own line with colon separator
poke 53280,0:               rem set border color

rem WRONG: This causes a SYNTAX ERROR in BASIC v2!
poke 53280,0                rem this will fail

rem WRONG: Semicolon also cannot be inline
poke 53280,0                ; this will also fail
```

#### Why the colon works

In BASIC v2, the colon (`:`) is a statement separator. So `poke 53280,0: rem comment` is actually two statements: `poke 53280,0` and `rem comment`.

#### BPP+ preprocessing

BPP+ removes both `rem` and `;` comments during preprocessing (except Blitz! `rem **` directives), so they never appear in the final `.bas` output.

!!! warning "Comments and Line Continuation"
    Do NOT use REM or `;` comments with line continuation (`\`). This causes unexpected behavior. See [Comments and line continuation](statement-chaining.md#comments-and-line-continuation) for details.

### Exception

Special `rem **` directives for Blitz! compiler are preserved in output (see [Blitz! BASIC Compiler](blitz-basic-compiler.md)). Both standard comment types are removed during compilation to minimize output size.

## Build tokens

BPP+ replaces three build token types during preprocessing:

- `{builddate}` - Current date in YYYY-MM-DD format
- `{buildtime}` - Current time in HH:MM format (24-hour)
- `{buildstamp}` - Full timestamp in YYYY-MM-DD HH:MM format: 

BPP+ replaces these tokens at preprocessing time with the actual build date and time. Your build script can optionally add mode-specific prefixes (like "Release:", "Beta:" or "Dev:") based on the build configuration.

### Token format

- Case-insensitive: `{builddate}`, `{BUILDDATE}`, `{BuildDate}` all work
- 24-hour time format without seconds
- BPP+ replaces these before BASIC parsing, so they work anywhere in your code

#### Usage in source

```cbmbas
main:
    print "{clr}BPP+ Program v1.0"
    print "Build: {builddate}"
    end
```

#### BPP+ output

```cbmbas
1 print"{clr}BPP+ Program v1.0"
2 print"Build: 2025-10-31"
3 end
```

#### Build script processing (optional) [^1]

```bash
# For Release builds: Add "Release:" prefix and remove time
sed -i 's/\([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\) [0-9]\{2\}:[0-9]\{2\}/\1/g' output.bas
sed -i "s/\([^a-zA-Z:]\)\([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\)/\1Release: \2/g" output.bas

# For Dev builds: Add "Dev:" prefix, keep time
sed -i "s/\([^a-zA-Z:]\)\([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}[^0-9]*[0-9]\{2\}:[0-9]\{2\}\)/\1Dev: \2/g" output.bas
```

[^1]: Examples of modification via a Bash build script.

## Reserved keywords

The following BASIC v2 keywords cannot be used as label identifiers:

```
end      for      next     data     input#   input    dim      read
let      goto     run      if       restore  gosub    return   rem
stop     on       wait     load     save     verify   def      poke
print#   print    cont     list     clr      cmd      sys      open
close    get      get#     new      tab(     to       fn       spc(
then     not      step     +        -        *        /        ^
and      or       >        =        <        sgn      int      abs
usr      fre      pos      sqr      rnd      log      exp      cos
sin      tan      atn      peek     len      str$     val      asc
chr$     left$    right$   mid$     ti$      ti       st       go
π
```

If you use a keyword as a label, BPP+ will not recognize it as a label. It will pass it through as BASIC code, which causes a syntax error in Petcat.

### Example of what NOT to do

```cbmbas
for:
    print "hello"           rem ERROR: 'for' is a keyword

goto:
    return                  rem ERROR: 'goto' is a keyword
```

BPP+ will generate:

```cbmbas
1 for:print"hello"
2 goto:return
```

Petcat will then reject this with a syntax error because `for:` and `goto:` are invalid BASIC statements.

## String literals

String literals are enclosed in double quotes:

```cbmbas
print "hello world"
a$ = "test"
print ""                    rem Empty string is valid
```

### Empty strings are supported

```cbmbas
if a$="" then print "empty"
```

## Statement separator: Single vs Double Colon

### Single colon (`:`)

Used as a statement separator in BASIC:

```cbmbas
poke 53280,0:poke 53281,0:print "done"
```

BPP+ recognizes `:` as a delimiter between statements.

### Double colon (`::`)

Reserved for Blitz! compiler extension marker (see [Blitz! BASIC Compiler](blitz-basic-compiler.md)):

```cbmbas
:: sys 49152                rem Interpreted at runtime, not compiled
```

The parser treats `::` specially to avoid conflicts with single colon parsing.

---

## See also

- [Symbol resolution](symbol-resolution.md) - Label definition and reference syntax
- [Statement chaining](statement-chaining.md) - Line continuation with backslash
- [Blitz! BASIC Compiler](blitz-basic-compiler.md) - Special comment preservation and extension marker
- [Control flow](control-flow.md) - Using labels in GOTO/GOSUB statements
- [PETSCII control codes](petscii-control-codes.md) - Screen control and color codes