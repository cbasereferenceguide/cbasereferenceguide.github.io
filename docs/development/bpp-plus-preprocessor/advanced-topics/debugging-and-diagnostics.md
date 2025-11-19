# Debugging & diagnostics

## Source mapping

BPP+ maintains bidirectional mapping between source and output line numbers:

```
source_map = {
    basic_line → (source_file, source_line)
}
```

## Line number lookup

Query source location for compiled line:

```bash
bpp -l <line_number> <source_file>
```

### Example workflow

```bash
rem C64 runtime error
?SYNTAX ERROR IN 47
READY.
```

```bash
; Source lookup
$ bpp -l 47 game.bpp

BASIC line 47 corresponds to:
  Source file: game.bpp
  Source line: 23
```

### Line not found

If the requested line number doesn't exist in the compiled output:

```bash
$ bpp -l 999 game.bpp

BASIC line 999 not found in compiled output
```

This typically means the line number is outside the range of your program, or the program didn't compile successfully.

## Cross-file debugging

Works across include boundaries:

```bash
$ bpp -l 89 main.bpp

BASIC line 89 corresponds to:
  Source file: lib/collision.bpp
  Source line: 15
```

## Error reporting

BPP+ provides detailed error messages with context:

```
error: line 23: could not resolve label 'player.shoot'
  in file: game.bpp
  context: gosub player.shoot
```

## Diagnostic verbosity

Standard error stream used for all diagnostics:

```bash
bpp source.bpp > output.bas 2> errors.log
```

For exit codes and compilation status, see [Error handling](../reference/error-handling.md).

---

## See also

- [API reference](../reference/api-reference.md) - Command line options including `-l` flag
- [Error handling](../reference/error-handling.md) - Error categories and exit codes
- [Compilation pipeline](../getting-started/compilation-pipeline.md) - Standard build workflow