# Static analysis & validation

## Label validation

### Naming rules

- Must match pattern: `[a-zA-Z_][a-zA-Z0-9_]*`
- Cannot be BASIC v2 keywords
- Case-insensitive uniqueness within scope

### Validation messages

```
error: line 5: label cannot start with a number: '1main'
error: line 8: label must start with a letter or underscore: '@label'
error: line 12: hyphens not allowed in labels: 'my-label'
error: line 15: special characters not allowed in labels: 'var$name'
error: line 20: label 'init' already defined in global scope
```

## Duplicate detection

Labels must be unique within their scope:

```cbmbas
init:
    print "first"
    return

init:
    print "second"
    return
```

!!! failure "Validation message"
    error: line 4: label 'init' already defined in global scope

Duplicates across different scopes are permitted:

```cbmbas
task1: {
    init:
        print "first"
        return
}

task2: {
    init:
        print "second"
        return
}
```

## Reference validation

All label references must resolve to defined labels:

```cbmbas
main:
    gosub undefined_routine
```

!!! failure "Validation message"
    error: could not resolve label 'undefined_routine'

### Label must be followed by code

Referenced labels must have BASIC code on the following line:

```cbmbas
main:
    gosub helper

helper:
    rem Label exists but no code follows
```

!!! failure "Validation message"
    error: line 4: referenced label 'helper' not followed by basic code

This error occurs when a label is defined and referenced, but has no executable BASIC statement after it. Labels must point to actual code, not just comments or other labels.

## Scope structure validation

### Too many closing braces

Attempting to close a scope that doesn't exist:

```cbmbas
main: {
    print "test"
}}
```

!!! failure "Validation message"
    error: unexpected '}' - no scope to close

!!! warning "Missing validation"
    BPP+ currently does **not** validate for missing closing braces at end of file. If you omit a closing brace, the parser may produce unexpected output or fail silently. Always ensure scopes are properly closed:

    ```cbmbas
    main: {
        print "test"
    }    rem Always close your scopes!
    ```

## Include validation

Include directives validated for:

- File existence
- File readability
- Type validity (`source` or `data` only)

```cbmbas
!include source "missing.bpp"
```

!!! failure "Validation message"
    error: line 1: include: file not found: 'missing.bpp'

```cbmbas
!include invalid "file.bpp"
```

!!! failure "Validation message"
    error: line 1: include: unknown type: 'invalid'

---

## See also

- [Lexical structure](../language-specification/lexical-structure.md) - Identifier syntax rules
- [Scope hierarchies](../language-specification/scope-hierarchies.md) - Scope structure and validation
- [Include directives](../language-specification/include-directives.md) - Include types and paths
- [Error handling](../reference/error-handling.md) - Error categories and messages