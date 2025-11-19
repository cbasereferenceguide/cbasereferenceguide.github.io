# Symbol resolution

This page covers the syntax and rules for defining and referencing labels in BPP+. For the internal algorithm that resolves label references, see [Symbol resolution algorithm](../advanced-topics/symbol-resolution-algorithm.md). For organizing labels into scopes, see [Scope hierarchies](scope-hierarchies.md).

## Label definition

Labels are defined by appending `:` to an identifier:

```cbmbas
label_name: <statement>
```

Labels bind to the subsequent BASIC statement or scope block. BPP+ assigns each label a unique line number during code generation.

## Label reference

Labels can be referenced in GOTO, GOSUB, and THEN clauses:

```cbmbas
goto <label>
gosub <label>
if <condition> then <label>
on <expression> goto <label>, <label>, ...
on <expression> gosub <label>, <label>, ...
```

## Qualified references

References can be qualified with scope paths using dot notation:

```cbmbas
<scope>.<label>
<scope>.<subscope>.<label>
global.<label>
```

**Examples**

```cbmbas
goto main.loop
gosub graphics.clear
on x goto menu.opt1, menu.opt2, menu.opt3
if a$<>"" then gosub utils.exit
```

## Case-insensitive matching

Label names are case-insensitive. All of these refer to the same label:

```cbmbas
main:
    print "entry point"

gosub main          rem Matches
gosub Main          rem Matches
gosub MAIN          rem Matches
gosub MaIn          rem Matches
```

This applies to:

- Label definitions
- Label references
- Scope names
- Qualified paths

**Implication**

Choose a consistent casing style for readability, even though BPP+ treats all variations as identical. You cannot have labels that differ only in case:

```cbmbas
init:
    return          rem First definition

Init:
    return          rem ERROR: 'init' already defined
```

---

## See also

- [Scope hierarchies](scope-hierarchies.md) - Scope declaration and shadowing
- [Symbol resolution algorithm](../advanced-topics/symbol-resolution-algorithm.md) - Detailed resolution strategy
- [Control flow](control-flow.md) - Using labels in control flow statements