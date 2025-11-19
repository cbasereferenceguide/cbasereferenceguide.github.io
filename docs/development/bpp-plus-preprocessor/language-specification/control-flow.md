# Control flow

BPP+ labels can be used anywhere BASIC v2 accepts line numbers for control flow. During transpilation, labels are replaced with their corresponding line numbers.

## Unconditional transfer

```cbmbas
goto <label>            rem Absolute jump
gosub <label>           rem Subroutine call with return
return                  rem Return from subroutine
```

## Conditional transfer

```cbmbas
if <condition> then goto <label>    rem Explicit GOTO
if <condition> then <label>         rem Implicit GOTO (just the label)
if <condition> then <statement>     rem Conditional execution (standard BASIC)
if <condition> then gosub <label>   rem Conditional subroutine call
```

### Implicit vs explicit GOTO

In BPP+ source, `if <condition> then <label>` transpiles to `if <condition> then <line_number>`. In BASIC v2, when the THEN clause contains only a number, BASIC interprets it as an implicit GOTO to that line number.

### Transpilation example

```cbmbas
rem Source (.bpp)

if x=1 then done                rem Implicit GOTO
if x=1 then goto done           rem Explicit GOTO

done:
    print "finished"

rem Output (.bas)

1 ifx=1then3                    rem Implicit form
2 ifx=1thengoto3                rem Explicit form
3 print"finished"
```

### Performance trade-off

The explicit form `if <condition> then goto <label>` is **faster** to execute, though it uses one extra token byte (the GOTO keyword). The implicit form `if <condition> then <label>` is more memory-efficient but slightly slower. Choose based on whether speed or memory is more critical for your application.

## Computed transfer

```cbmbas
on <expression> goto <label1>, <label2>, ...
on <expression> gosub <label1>, <label2>, ...
```

Expression evaluates to 1-based index. Out-of-range values fall through to next statement.

### Scope-qualified labels in ON statements

ON statements support fully-qualified label paths:

```cbmbas
menu: {
    opt1:
        print "option 1":return

    opt2:
        print "option 2":return

    opt3:
        print "option 3":return
}

main:
    input "choice (1-3)"; choice
    on choice gosub menu.opt1, menu.opt2, menu.opt3
    end
```

This transpiles to line numbers like any other label reference:

```cbmbas
1 input"choice (1-3)";choice
2 onchoicegosub3,4,5
3 end
4 print"option 1":return
5 print"option 2":return
6 print"option 3":return
```

## Performance considerations

### Branching overhead

All branching operations (GOTO, GOSUB, IF...THEN with line numbers) require the BASIC interpreter to search through program lines to find the target:

- **Forward jumps** search from the current position.
- **Backward jumps** search from the beginning of the program, making them progressively slower as program size increases.

### Loop performance

FOR...NEXT loops are faster than backward GOTO loops because NEXT stores the exact return address on the stack instead of performing a line search. When possible, prefer FOR...NEXT over GOTO-based loops.

---

## See also

- [Symbol resolution](symbol-resolution.md) - How labels are resolved to line numbers
- [Scope hierarchies](scope-hierarchies.md) - Organizing labels with scopes
- [Lexical structure](lexical-structure.md) - Label syntax and identifier rules