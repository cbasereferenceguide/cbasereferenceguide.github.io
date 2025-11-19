# Statement chaining

## Syntax

Use backslash `\` for line continuation:

```cbmbas
<statement>\
<statement>\
<statement>
```

## Compilation

Chained statements are compiled to single-line BASIC with colon separators:

```cbmbas
rem Source
poke 53280,0\
poke 53281,0\
poke 646,1

rem Output
poke53280,0:poke53281,0:poke646,1
```

## Advantages

- **Source readability:** Break complex sequences into logical lines
- **Output efficiency:** Single-line execution is faster on C64
- **Space optimization:** Reduces line number overhead
- **Debugging:** Each source line maps to single output line

## Constraints

- Continuation must be last character on line (trailing spaces after `\` are automatically removed)
- Cannot chain across scope boundaries
- Cannot chain label definitions
- Final statement in chain must **not** have trailing `\`
- Cannot include REM or `;` comments in chains - see warning below

### Automatic whitespace trimming

BPP+ automatically removes trailing whitespace before processing line continuation:

```cbmbas
poke 53280,0  \         rem Spaces after \ are automatically removed
poke 53281,0
```

Result: `poke 53280,0:poke 53281,0`

This means you don't need to worry about accidental trailing spaces breaking your line continuations.

## Comments and line continuation

!!! warning "Do not use comments in statement chains"
    Comments (REM and `;`) should NOT be used with line continuation (`\`). This creates either removal of the entire chain or code that doesn't execute. Always place comments before or after the chain, never inside.

See [Comment placement](lexical-structure.md#comment-placement) for detailed explanation of REM behavior and why this occurs.

## Line-length and string limits

- **Native editor limit:** BASIC lines longer than ~80 characters may be truncated or become uneditable
- **String limit:** A single string literal (e.g., in print) can be up to 255 characters
- **Chaining impact:** Since chained statements compile into a single BASIC line, long chains or large print strings can exceed the editor limit. Keep chains reasonably short

---

## See also

- [Lexical structure](lexical-structure.md) - Line continuation syntax `\` and comment placement
- [Scope hierarchies](scope-hierarchies.md) - Chaining constraints across scope boundaries