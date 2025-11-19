# Installation

## Prerequisites

### Required

- [Ruby](https://www.ruby-lang.org/) v2.0 or later (Ruby 2.7+ recommended)
- [VICE emulator](https://vice-emu.sourceforge.io/) v3.6.1 or later (includes the `petcat` utility)

### Optional

- Make (for automated builds)
- [Blitz! BASIC Compiler](https://csdb.dk/release/?id=173267) by Daniel Kahlin (see [version compatibility details](../language-specification/blitz-basic-compiler.md#about-blitz-compiler))
- Filesystem watching via [inotify-tools](https://github.com/inotify-tools/inotify-tools)

## Installation procedure

```bash
# Clone repository
git clone https://github.com/cbase-larrymod/bpp-plus.git
cd bpp-plus

# Set executable permissions
chmod +x bpp

# Verify installation
./bpp --version
```

## Verification

```bash
# Test basic functionality
echo 'main: print "test": end' | bpp
# Expected output:
# 1 print"test":end

# Test with petcat
echo 'main: print "test": end' | bpp | petcat -w2 -o test.prg --
# Should create test.prg without errors
```

---

## Next steps

Once installation is complete, proceed to the [Compilation pipeline](compilation-pipeline.md) to learn the full build workflow.