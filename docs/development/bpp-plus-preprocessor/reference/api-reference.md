# API reference

## Command line interface

```
bpp [options] [input_file]
```

### Options

`-h, --help`

- Display help message
- Includes usage examples and feature descriptions

`-v, --version`

- Display version information

`-l <line_number>, --line <line_number>`

- **Debug mode:** Lookup source line for compiled BASIC line
- **Requires:** Input file argument
- **Output format:** Source file and line number
- **Exit code:** 0 on success, 1 if line not found

### Input methods

#### File input

```bash
bpp program.bpp
```

#### Standard input

```bash
cat program.bpp | bpp
echo 'main: print "test"' | bpp
```

#### Process substitution

```bash
bpp <(curl -s https://example.com/program.bpp)
```

### Output

- **Standard output:** Generated BASIC v2 code
- **Standard error:** Error messages and diagnostics
- **Exit code:** 0 on success, non-zero on error

## Integration patterns

### Shell pipeline

```bash
# Preprocess and tokenize in one command
bpp source.bpp | petcat -w2 -o program.prg --

# With character set conversion
bpp source.bpp | iconv -f UTF-8 -t ASCII | petcat -w2 -o program.prg --

# With validation
bpp source.bpp | tee output.bas | wc -l
```

### Error handling in scripts

```bash
#!/bin/bash

if bpp source.bpp > output.bas 2> errors.log; then
    echo "Compilation successful"
    petcat -w2 -o program.prg -- output.bas
else
    echo "Compilation failed:"
    cat errors.log
    exit 1
fi
```

### Parallel builds

```bash
# Process multiple files in parallel
find src -name '*.bpp' | parallel bpp {} \> build/{/.}.bas
```

---

## See also

- [Compilation pipeline](../getting-started/compilation-pipeline.md) - Standard build workflow
- [PETSCII control codes](../language-specification/petscii-control-codes.md) - Screen control and color codes
- [Build integration](build-integration.md) - Makefile and watch mode examples
- [Debugging & diagnostics](../advanced-topics/debugging-and-diagnostics.md) - Using the `-l` flag for source mapping