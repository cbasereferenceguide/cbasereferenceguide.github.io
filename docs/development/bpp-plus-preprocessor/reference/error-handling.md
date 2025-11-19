# Error handling

## Error categories

### Syntax errors

```
error: line 5: unexpected token: '}'
error: line 12: unterminated scope (missing '}')
error: line 18: invalid label syntax: '123invalid'
```

### Semantic errors

```
error: line 23: label 'main' already defined in global scope
error: line 34: could not resolve label 'undefined_label'
error: line 45: circular include detected: a.bpp → b.bpp → a.bpp
```

### File system errors

```
error: line 0: file not found: 'source.bpp'
error: line 0: not a file: '/etc'
error: line 7: include: file not found: 'missing.bpp'
error: line 12: include: permission denied: '/root/protected.bpp'
```

## Error output format

```
error: line <number>: <message>
  in file: <filename>
  context: <code_snippet>
```

## Exit codes

Standard Unix exit codes:

| Code | Meaning | Use Case                               |
| :--- | :------ | :------------------------------------- |
| 0    | Success | Compilation completed without errors   |
| 1    | Error   | Syntax, semantic, or file system error |
| 130  | SIGINT  | Interrupted by user (Ctrl+C)           |

**Note:** Invalid command line arguments are handled by Ruby's OptionParser, which displays usage information and exits automatically.

## Error recovery

**BPP+ implements fail-fast error handling:**

- BPP+ halts compilation when it encounters the first error
- No attempt at error recovery or continuation
- Rationale: BASIC v2 programs are typically small; fix-and-retry is efficient

## Validation strategies

**Static validation at compile time:**

- All labels must be defined before use
- All scopes must be properly closed
- All includes must be resolvable
- No undefined references permitted

**No runtime validation:**

- BPP+ assumes generated BASIC v2 is correct
- BPP+ may not catch invalid BASIC syntax (it passes it through to Petcat)

---

## See also

- [Static analysis & validation](../advanced-topics/static-analysis-and-validation.md) - Validation rules and messages
- [Debugging & diagnostics](../advanced-topics/debugging-and-diagnostics.md) - Source mapping and error tracking
- [API reference](api-reference.md) - Exit codes and error output