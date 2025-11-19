# BPP+ Preprocessor

<h2>Modern toolchain for Commodore 64 BASIC v2 cross-development</h2>

BPP+ is a source-to-source compiler that transpiles enhanced BASIC syntax into standard Commodore BASIC v2.

It provides label-based control flow, lexical scoping, modular compilation, and comprehensive static analysis. Extended from the [original BPP preprocessor](https://github.com/hbekel/bpp) by Henning Liebenau.

Part of the **C\*Base Larry Mod v3.1** development package.

---

## Quick example

**Source** - Enhanced syntax with labels, scopes and statement chaining (`.bpp`)

```cbmbas
main:
    gosub screen.init
    gosub screen.welcome

screen: {
    init:
        poke 53280,0\
        poke 53281,0\
        return
}

screen: {
    welcome:
        print "hello bpp+"\
        return
}
```

**Target** - Standard BASIC v2 with line numbers (`.bas`)

```cbmbas
1 gosub3
2 gosub4
3 poke53280,0:poke53281,0:return
4 print"hello bpp+":return
```

## Getting started

New to BPP+? Start here:

1. [Installation](getting-started/installation.md) - Set up BPP+ and verify your environment
2. [Compilation pipeline](getting-started/compilation-pipeline.md) - Learn the build workflow

## Documentation structure

- [Language Specification](language-specification/lexical-structure.md) - Syntax, scopes, labels, directives, and PETSCII codes
- [Advanced Topics](advanced-topics/symbol-resolution-algorithm.md) - Symbol resolution, debugging, and validation
- [Reference](reference/api-reference.md) - API, build integration, and error handling

## GitHub repository

The BPP+ source code, issue tracking, and release packages are available on [GitHub](https://github.com/cbase-larrymod/bpp-plus).

---

## Technical overview

### Problem domain

BASIC v2 (Commodore BASIC 2.0) is a line-number-based interpreted language with these limitations:

- **No symbolic addressing:** All control flow uses numeric line references
- **No scoping:** Single global namespace with no encapsulation
- **No modularity:** No include mechanism or separate compilation
- **Limited readability:** Minimal whitespace, single-statement-per-line constraint
- **Fragile refactoring:** Inserting lines requires manual renumbering of all references

### Solution architecture

BPP+ implements a preprocessing layer that:

1. **Tokenizes** enhanced BASIC syntax with symbolic labels
2. **Parses** hierarchical scope structures and include directives
3. **Resolves** label references to line numbers via static analysis
4. **Validates** symbol tables for duplicates and undefined references
5. **Transpiles** to standard BASIC v2 with generated line numbers
6. **Maintains** source mapping for debugging compiled programs

The output is standard BASIC v2 that can be tokenized by Petcat and executed on C64 hardware or emulators. For production use, compile the generated BASIC with the Blitz! compiler for 4x faster execution.

### Design principles

- **Zero runtime overhead:** All preprocessing happens at compile time
- **Lossless compilation:** Transpiled code is functionally identical to hand-written line-numbered BASIC
- **Source fidelity:** Line mapping preserves debugging capability
- **Unix philosophy:** Composable tool that works with standard pipes and build systems
- **Blitz compatibility:** Full support for Blitz! compiler directives and optimizations