# Blitz! BASIC Compiler

BPP+ provides full compatibility with the Blitz! BASIC Compiler through special directives and syntax extensions. These directives control runtime behavior and compiler optimizations.

## Almost full speed ahead!

**Blitz!** [^1] is a BASIC compiler for the Commodore 64 that translates BASIC programs into faster-executing P-Code. Originally developed by Skyles Electric Works and later enhanced by Commodore Buromaschinen GmbH (as Austro-Comp) and Daniel Kahlin.

**BPP+** and **C\*Base Larry Mod v3.1 development package** uses the Blitz!/Austro-Comp compiler v0.1 by Daniel Kahlin as the default compiler. The table below lists multiple compiler variants and tools available for different development environments and workflows.

- **Video overview:** [The 8-Bit Theory - Blitz! BASIC Compiler](https://www.youtube.com/watch?v=5thXpk_hv54) (YouTube)
- **Related:** [BLITZ! 128 Manual](../blitz-basic-compiler/blitz-basic-compiler-for-the-commodore-128-1985-skyles-electrical-works.pdf) (PDF)

### Compilers and tools
| Name                           | Version | Description                                                        | Link                                                                                | File                                                                                       |
| :----------------------------- | :------ | :----------------------------------------------------------------- | :---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| Blitz!/Austro-Comp compiler    | v0.1    | Cross-compiler by Daniel Kahlin (default for BPP+/C\*Base)         | [CSDB](https://csdb.dk/release/?id=173267)                                          | [ZIP](../blitz-basic-compiler/blitz-0.1.zip)                                          |
| Blitz!/Austro-Speed decompiler | v0.1    | Decompiler for Blitz!-compiled programs back to BASIC              | [CSDB](https://csdb.dk/release/?id=165744)                                          | [ZIP](../blitz-basic-compiler/deblitz-0.1.zip)                                        |
| Reblitz64                      | -       | JavaScript port of Blitz! compiler (extremely fast, browser-based) | [GitHub](https://github.com/c1570/Reblitz64)                                        | [ZIP](../blitz-basic-compiler/Reblitz64-master.zip)                                   |
| BC64                           | -       | Cross-compiler with C128-style forced integer support              | [GitHub](https://github.com/mvr70702/BC64-Blitz-crosscompiler-for-the-Commodore-64) | [ZIP](../blitz-basic-compiler/BC64-Blitz-crosscompiler-for-the-Commodore-64-main.zip) |

[^1]:
    Authors: Skyles Electric Works, Commodore Buromaschinen GmbH and Daniel Kahlin

### Why use Blitz! compilation?

Blitz! compilation provides significant advantages over interpreted BASIC:

#### Performance improvements

- Provides 3-5x performance improvements over interpreted BASIC
- Pre-stored variable and array locations (no runtime searching)
- Pre-stored line number destinations for GOTO/GOSUB (no runtime searching)
- Pre-converted numeric constants (no runtime conversion)
- Compilation-time syntax checking (no runtime checking)
- True integer arithmetic for integer expressions
- Optimized expression evaluation with minimal intermediate storage

#### Code size benefits
- Compiled P-Code typically reduces program size to **60-70%** of the original
- Runtime routines add overhead, but programs 30KB+ usually become smaller overall
- More efficient memory usage for larger programs

#### Development benefits

- Syntax errors caught at compile-time, not runtime
- Better performance for production releases
- Copy protection options (STOP key disable, dongle support)
- Compiled programs cannot be listed (automatic protection)

## Directive syntax

Two equivalent syntaxes are supported in BPP+:

### Native Blitz! syntax (preserved verbatim)

```cbmbas
rem ** se                   rem Enable STOP key
rem ** sa                   rem Disable STOP key (default)
rem ** ie                   rem Enable INPUT command
rem ** ia                   rem Disable INPUT command (default)
rem ** sp [number]          rem Specify dongle number
rem ** ne                   rem No extension listing
```

### BPP+ alternative syntax (converted to native form)

```cbmbas
!blitz se                   rem Converted to: rem ** se
!blitz sa                   rem Converted to: rem ** sa
!blitz ie                   rem Converted to: rem ** ie
!blitz ia                   rem Converted to: rem ** ia
!blitz sp 1234              rem Converted to: rem ** sp 1234
!blitz ne                   rem Converted to: rem ** ne
```

## Blitz! directives reference

| #   | BASIC directive | BPP+ directive  | Purpose               |
| :-- | :-------------- | :-------------- | :-------------------- |
| 1   | `rem ** se`     | `!blitz se`     | Enable STOP key       |
| 2   | `rem ** sa`     | `!blitz sa`     | Disable STOP key      |
| 3   | `rem ** ie`     | `!blitz ie`     | Enable INPUT command  |
| 4   | `rem ** ia`     | `!blitz ia`     | Disable INPUT command |
| 5   | `rem ** sp [n]` | `!blitz sp [n]` | Check dongle          |
| 6   | `rem ** ne`     | `!blitz ne`     | No extension listing  |
| 7   | `::`            | `::`            | Extension marker      |

## Directive details

### 1. Enable STOP key

Allows program to be interrupted with **RUN/STOP** key.

#### Directive
- `rem ** se` / `!blitz se`

#### Use cases

- Development and debugging
- Testing compiled programs
- Allowing user to exit long-running operations

#### Default state

- Interpreted BASIC: STOP key enabled
- Compiled programs: STOP key disabled (must use this directive to re-enable)

#### Example

```cbmbas
!blitz se                   rem Enable STOP key for debugging

main:
    gosub test_routine
    print "tests complete"
    end

test_routine:
    rem User can press STOP to interrupt during testing
    for i=1 to 10000
        print i
    next i
    return
```

### 2. Disable STOP key

Prevents program interruption with **RUN/STOP** key.

#### Directive

-  `rem ** sa` / `!blitz sa`

#### Use cases

- Production releases
- Copy protection
- Preventing user interruption during critical operations
- Kiosk or demo programs

#### Default state

- Compiled programs have STOP key disabled by default
- This directive explicitly documents the behavior

#### Example

```cbmbas
rem ** sa                   rem Disable STOP key (production)

main:
    gosub init
    gosub game_loop
    end
```

### 3. Enable INPUT command

Allows runtime `INPUT` statements if supported by Blitz! version.

#### Directive

- `rem ** ie` / `!blitz ie`

#### Trade-offs

- Increases compiled program size
- Adds INPUT command support to runtime routines

#### Use cases

- Programs requiring user text input
- Interactive applications
- Data entry programs

#### Example

```cbmbas
!blitz ie                   rem Enable INPUT command

main:
    print "enter your name:"
    input nm$
    print "hello, ";nm$
    end
```

### 4. Disable INPUT command

Removes `INPUT` command support from compiled program.

#### Directive

- `rem ** ia` / `!blitz ia`

#### Benefits

- Reduces compiled program size
- Removes unused runtime code

#### Default state

- INPUT command not supported by default (must explicitly enable with `rem ** ie`)

#### Use cases

- Programs that don't need INPUT
- Size-optimized programs
- Games and demos using GET instead of INPUT

#### Example

```cbmbas
rem ** ia                   rem Disable INPUT (default, explicit)

main:
    gosub get_keypress      rem Use GET instead of INPUT
    end

get_keypress:
    get k$
    if k$="" then get_keypress
    return
```

### 5. Check dongle

Verifies presence of copy protection dongle.

#### Directive

- `rem ** sp [number]` / `!blitz sp [number]`

#### Parameters

- `number` = Dongle ID (specific hardware identifier)

#### Behavior

- Program terminates if specified dongle not detected
- Used for commercial software copy protection

#### Example

```cbmbas
!blitz sp 1234              rem Require dongle #1234

main:
    rem Program only runs with correct dongle present
    gosub game_loop
    end
```

### 6. No extension listing

Suppresses line number output during compilation. Compiled programs cannot be listed anyway - attempting to LIST will only show `SYS` address or "compiled by blitz" message.

#### Directive

- `rem ** ne` / `!blitz ne`

#### Use cases

- Cleaner compilation output (no line numbers printed)
- Faster compilation (skips line number display)
- Quieter build process

#### Example

```cbmbas
rem ** ne                   rem Suppress line numbers during compilation

main:
    gosub main_loop
    end
```

### 7. Extension marker

Forces statement to be passed to the BASIC interpreter at runtime rather than being compiled. Allows non-BASIC V2 commands (BASIC extensions) to be used without causing syntax errors during compilation.

#### Directive

- `::`

#### Syntax

```cbmbas
:: statement                rem Single statement
:: statement1: statement2   rem Multiple statements (up to next line)
```

#### Use cases

- **BASIC extensions** - Commands from Plum's Extensions, Simon's BASIC, JiffyDOS, etc.
- **Kernal enhancements** - Extended commands provided by ML routines
- **Non-standard commands** - Any command not recognized by Blitz! compiler
- Machine code routine calls (SYS)
- Self-modifying code that changes at runtime
- Dynamic calculations that cannot be compile-time resolved
- Debugging statements in compiled code
- Intentional delay loops that should not be optimized

#### Why use extension marker?

Without `::`, the compiler will throw a **SYNTAX ERROR** when encountering commands it doesn't recognize (anything beyond standard BASIC V2). The extension marker tells Blitz! to skip compilation and pass the command to the BASIC interpreter at runtime, where ML-based extensions can handle it.

#### Important note

If a BASIC command is treated as extension, all related commands must also be extensions. For example:

- `FOR-NEXT` pairs must both be extensions or both be compiled
- `OPEN-PRINT#-CLOSE` groups should all be extensions or all compiled

#### Example

```cbmbas
main:
    :: @                    rem JiffyDOS directory command (extension)
    :: dload"file",8        rem JiffyDOS fast load (extension)
    :: sys 49152            rem Machine code call (extension)
    poke 53281,0            rem Standard BASIC (compiled - faster)
    return

dynamic_loop:
    rem Runtime-calculated loop (cannot optimize)
    :: for i=1 to x: print i: next i
    return
```

#### Performance impact

- Extension marker bypasses Blitz! optimization
- Interpreted statements execute at normal BASIC speed (much slower than compiled P-Code)
- Use sparingly to maintain performance benefits
- Extensions handled by ML routines may still be fast despite interpretation

## Practical examples

### Development vs production configuration

#### Development build

```cbmbas
!blitz se                   rem Enable STOP key for debugging
!blitz ie                   rem Enable INPUT for testing

main:
    :: poke 53280,0         rem Debug statement (interpreted)
    input "continue (y/n)";a$
    end
```

#### Production build

```cbmbas
rem ** sa                   rem Disable STOP key
rem ** ia                   rem Disable INPUT (smaller size)
rem ** ne                   rem No extension listing

main:
    poke 53280,0            rem All compiled for maximum speed
    get k$                  rem Use GET instead of INPUT
    end
```

### Integer optimization

```cbmbas
rem Standard floating point (slower)
for i=1 to 100
    poke 1024+i,i
next i

rem Optimized with integers (faster)
for i%=1 to 100
    poke 1024+i%,i%
next i%
```

### Extension marker usage

```cbmbas
main:
    poke 53280,0            rem Compiled (fast)
    :: sys 49152            rem Extension (interpreted at runtime)
    :: for i=1 to x: next i rem Dynamic loop (runtime only)
    end
```

## Comment preservation

Standard BPP+ comment removal does **not** affect Blitz! directives. This ensures the compiler receives all necessary control directives while minimizing program size.

#### Comment handling

```cbmbas
; This BPP+ comment is REMOVED during preprocessing
rem This regular comment is REMOVED

rem ** se           rem This directive is PRESERVED
!blitz sa           rem Converted and PRESERVED as: rem ** sa
```

#### Result after preprocessing

```cbmbas
rem ** se
rem ** sa
```

This behavior ensures:

- Blitz! compiler receives all directives
- Program size minimized by removing unnecessary comments
- Source code remains clean and maintainable

## Blitz-specific constraints

When writing BPP+ code for Blitz! compilation, observe these requirements:

### Array dimensioning

All multi-dimensional arrays **must** be explicitly dimensioned with DIM statements.

#### Rules

- Single-dimensional arrays: DIM optional (defaults to 11 elements)
- Multi-dimensional arrays: DIM required (compilation fails without it)
- Integer arrays: Use `%` suffix for better performance

#### Examples

```cbmbas
rem Single-dimensional arrays
dim a(10)               rem Explicit dimension (recommended)
a(5)=100                rem Without DIM, defaults to DIM a(10)

rem Multi-dimensional arrays - DIM REQUIRED
dim b(10,10)            rem Must use DIM
dim c(5,5,5)            rem Must use DIM

rem Integer arrays for performance
dim px%(255)            rem Integer array (faster)
dim py%(255)            rem Integer array (faster)
```

#### Error example

```cbmbas
rem ERROR: Multi-dimensional array without DIM
b(5,5)=100              rem Compilation fails - missing DIM statement

rem CORRECT: Use DIM first
dim b(10,10)
b(5,5)=100              rem OK
```

### Integer optimization

Integer variables provide significant speed improvement in compiled programs.

#### Benefits

- True integer arithmetic (no float conversion)
- Faster FOR-NEXT loops
- Reduced memory overhead
- Better performance in array indexing

#### Usage

```cbmbas
rem Standard floating point loop (slower)
for i=1 to 100
    print i
next i

rem Optimized integer loop (faster with Blitz!)
for i%=1 to 100
    print i%
next i%

rem Integer variables in calculations
x%=10
y%=20
z%=x%*y%                rem Integer arithmetic (fast)

rem Mixing types (avoid for best performance)
x%=10
y=20
z=x%*y                  rem Mixed types (slower due to conversion)
```

#### Best practices

- Use integer variables for loop counters
- Use integer variables for array indices
- Use integer variables for simple calculations
- Use floating point only when decimals needed

### Reserved identifier

The array name `z*%` is reserved by Blitz! internally and must be avoided.

#### Forbidden

```cbmbas
dim z*%(100)            rem ERROR: reserved array name
```

#### Alternatives

```cbmbas
dim z(100)              rem OK: standard array
dim zz%(100)            rem OK: integer array
dim za%(100)            rem OK: different name
dim arr_z%(100)         rem OK: prefixed name
```

### Performance optimization guidelines

#### Compile these for maximum speed

- Simple POKE/PEEK operations
- FOR-NEXT loops (especially with integer variables)
- Arithmetic calculations
- Array access
- GOSUB/GOTO branching
- Variable assignments

#### Use extensions (::) for

- SYS calls to machine code
- Self-modifying code
- Dynamic runtime calculations
- Commands not recognized by compiler
- Debugging statements
- Intentional delays that shouldn't be optimized

#### Example showing optimal compilation strategy

```cbmbas
main:
    rem Compiled statements (fast)
    for i%=1 to 1000
        poke 1024+i%,i%
    next i%

    rem Extension for machine code call
    :: sys 49152

    rem Compiled statements (fast)
    for i%=1 to 1000
        poke 55296+i%,1
    next i%

    end
```

## Integration with BPP+ features

Blitz! directives work seamlessly with all BPP+ features:

```cbmbas
game: {
    !blitz se                       rem Enable STOP during development

    init:
        dim px%(255), py%(255)      rem Integer arrays for speed
        for i%=0 to 255
            px%(i%)=i%*2
        next i%
        :: sys 49152                rem Extension for sprite routine
        return
}
```

---

## See also

- [Compilation pipeline](../getting-started/compilation-pipeline.md) - Blitz! compiler workflow
- [Lexical structure](lexical-structure.md) - Comment preservation rules
