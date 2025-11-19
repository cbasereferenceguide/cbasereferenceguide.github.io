# Scope hierarchies

This page covers organizing labels using scope blocks for encapsulation and namespace management. For label definition and reference syntax, see [Symbol resolution](symbol-resolution.md). For the internal resolution algorithm, see [Symbol resolution algorithm](../advanced-topics/symbol-resolution-algorithm.md).

## Scope declaration

Scopes create lexical namespaces using brace delimiters:

```cbmbas
rem Anonymous scope

{
    <statements>
}

rem Named scope

<identifier>: {
    <statements>
}
```

## Scope properties

- **Encapsulation:** Labels defined in scope are local to that scope
- **Nesting:** Scopes can contain nested scopes to arbitrary depth
- **Visibility:** Inner scopes can reference outer scope labels
- **Shadowing:** Local labels shadow identically-named labels in outer scopes

## Scope chain example

```cbmbas
global_label:
    print "global"

outer: {
    outer_label:
        print "outer"
    
    inner: {
        inner_label:
            print "inner"
        
        test:
            gosub inner_label       rem Resolves to inner.inner_label
            gosub outer_label       rem Resolves to outer.outer_label
            gosub global_label      rem Resolves to global scope
            return
    }
}
```

## Shadowing and explicit scope reference

When a local label has the same name as a label in an outer scope, the local label **shadows** (hides) the outer one. The implicit global scope can be explicitly referenced using the `global.` prefix to access shadowed labels:

```cbmbas
done:
    print "global done"
    return                          rem Global label

outer: {
    done:
        print "outer done"
        return                      rem Local label (shadows global)
    
    exit:
        gosub done                  rem Calls local outer.done
        gosub global.done           rem Explicitly calls global done
        return
}
```

From within `outer.exit`, an unqualified reference to `done` resolves to the local label. To explicitly access the shadowed `done` label in global scope, use the qualified reference `global.done`.

More in depth information can be found in the [Symbol resolution algorithm](../advanced-topics/symbol-resolution-algorithm.md) chapter.

---

## See also

- [Symbol resolution](symbol-resolution.md) - Qualified references and dot notation
- [Symbol resolution algorithm](../advanced-topics/symbol-resolution-algorithm.md) - Detailed resolution strategy
- [Include directives](include-directives.md) - Scope context for included files