# Symbol resolution algorithm

This page details the internal algorithm BPP+ uses to resolve label references with hierarchical scoping. For basic label syntax and reference rules, see [Symbol resolution](../language-specification/symbol-resolution.md). For scope organization concepts, see [Scope hierarchies](../language-specification/scope-hierarchies.md).

## Resolution strategy

BPP+ implements a hierarchical symbol resolution algorithm with lexical scoping:

```
resolve(label_reference, current_scope):
    1. Search current scope for label
    2. If not found, search subscopes of current scope
    3. If not found, recursively search parent scope
    4. If not found at global scope, throw undefined reference error
```

## Detailed algorithm

```
function resolve_label(reference, scope):
    // Split qualified reference
    path_components = reference.split('.')
    
    if path_components.length > 1:
        // Qualified reference: navigate scope chain
        target_scope = resolve_scope(path_components[0..-2], scope)
        label_name = path_components[-1]
        return lookup_in_scope(label_name, target_scope)
    else:
        // Unqualified reference: hierarchical search
        label_name = reference
        
        // Check current scope
        if label_exists_in(label_name, scope):
            return get_label(label_name, scope)
        
        // Check subscopes
        for each subscope in scope.subscopes:
            if label_exists_in(label_name, subscope):
                return get_label(label_name, subscope)
        
        // Recursively check parent scopes
        if scope.parent != null:
            return resolve_label(reference, scope.parent)
        
        // Not found
        throw UndefinedReferenceError(reference)
```

## Resolution examples

```cbmbas
init: return                        rem Line 1 (global)

utils: {
    init: return                    rem Line 2 (utils.init)
    
    helper:
        gosub init                  rem Resolves to Line 2 (local precedence)
        gosub global.init           rem Resolves to Line 1 (explicit)
        return
}

main:
    gosub init                      rem Resolves to Line 1 (global scope search)
    gosub utils.init                rem Resolves to Line 2 (qualified)
```

### Scope shadowing

Local labels shadow outer labels with same name. More examples can be found in the [Shadowing and explicit scope reference](../language-specification/scope-hierarchies.md#shadowing-and-explicit-scope-reference) passage.

```cbmbas
done: return                rem Global done

task1: {
    done: return            rem Shadows global
    work: goto done         rem Jumps to task1.done
}

task2: {
    work: goto done         rem Jumps to global.done (no local shadow)
}
```

### Resolution failures

```cbmbas
main:
    gosub undefined_label           rem ERROR: could not resolve label 'undefined_label'

scope1: {
    local: return
}

scope2: {
    test: gosub local               rem ERROR: 'local' not in scope2 or parents
}
```

---

## See also

- [Symbol resolution](../language-specification/symbol-resolution.md) - Label references and qualified paths
- [Scope hierarchies](../language-specification/scope-hierarchies.md) - Shadowing and explicit scope reference
- [Static analysis & validation](static-analysis-and-validation.md) - Label validation and duplicate detection