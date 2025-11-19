# Compilation pipeline

## Standard workflow

```bash
# Stage 1: Preprocess .bpp to .bas
bpp source.bpp > output.bas

# Stage 2: Tokenize .bas to .prg
petcat -w2 -o program.prg -- output.bas

# Stage 3: Execute on target platform
x64 program.prg
```

### Automatic line numbering

BPP+ assigns line numbers during preprocessing:

- First line receives line number `1`
- Each subsequent line increments by `1` (2, 3, 4, ...)
- No gaps in numbering
- No customization or renumbering needed

#### Source (.bpp)

```cbmbas
main:
    print "hello"
    gosub helper
    end

helper:
    print "world"
    return
```

#### Output (.bas)

```cbmbas
1 print"hello"
2 gosub4
3 end
4 print"world"
5 return
```

This eliminates the need for manual line number management in BASIC v2 programs.

## Blitz! BASIC Compiler workflow

For production builds requiring better performance, add Blitz! compilation to your pipeline. [Blitz!](../language-specification/blitz-basic-compiler.md) is a BASIC compiler that translates tokenized programs into faster-executing P-Code, delivering 3-5x performance improvements while reducing program size to 60-70% of the original.

```bash
# Stage 1: Preprocess with Blitz directives
bpp source.bpp > output.bas

# Stage 2: Tokenize .bas to .prg
petcat -w2 -o program.prg -- output.bas

# Stage 3: Compile with Blitz!
blitz -c <type> -o blitzed.prg program.prg

# Stage 4: Execute on target platform
x64 blitzed.prg
```

Blitz! compilation offers significant advantages: programs run 3-5x faster through optimizations like pre-stored variable locations, pre-converted constants, and true integer arithmetic. Compiled code is typically smaller than the original, syntax errors are caught at compile-time, and compiled programs cannot be listed (providing automatic protection).

BPP+ preserves all Blitz! directives during preprocessing and handles multi-dimensional array constraints automatically. For complete details on directives, optimizations, and compiler-specific features, see the [Blitz! BASIC Compiler reference](../language-specification/blitz-basic-compiler.md).

## Pipeline with character set conversion

Some systems require character encoding adjustments for PETSCII compatibility:

```bash
# Syntax:
# bpp source.bpp | sed 's/OLD/NEW/g' > output.bas

# Example:
bpp source.bpp | sed 's/£/\\/g;s/←/_/g' > output.bas
```

## Integrated build script

```bash
#!/bin/bash
set -euo pipefail

SRC="src/main.bpp"
BAS="build/main.bas"
PRG="build/main.prg"

# Create build directory
mkdir -p build

# Stage 1: Preprocess
bpp "${SRC}" > "${BAS}" || {
    echo "ERROR: BPP+ preprocessing failed" >&2
    exit 1
}

# Stage 2: Tokenize
petcat -w2 -o "${PRG}" -- "${BAS}" || {
    echo "ERROR: Petcat tokenization failed" >&2
    exit 1
}

# Stage 3: Verify output
if [[ ! -f "${PRG}" ]]; then
    echo "ERROR: Build failed to produce ${PRG}" >&2
    exit 1
fi

echo "Build successful: ${PRG}"
ls -lh "${PRG}"
```

---

## See also

- [Blitz! BASIC Compiler](../language-specification/blitz-basic-compiler.md) - Control runtime behavior and optimizations
- [Build integration](../reference/build-integration.md) - Makefile examples and watch mode scripts
- [Error handling](../reference/error-handling.md) - Understanding compilation errors