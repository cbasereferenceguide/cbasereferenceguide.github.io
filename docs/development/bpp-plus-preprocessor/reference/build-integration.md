# Build integration

## Makefile integration

```makefile title="Makefile"
# Variables
BPP := ./bpp
PETCAT := petcat
SRC_DIR := src
BUILD_DIR := build
SRC_FILES := $(wildcard $(SRC_DIR)/*.bpp)
BAS_FILES := $(patsubst $(SRC_DIR)/%.bpp,$(BUILD_DIR)/%.bas,$(SRC_FILES))
PRG_FILES := $(patsubst $(SRC_DIR)/%.bpp,$(BUILD_DIR)/%.prg,$(SRC_FILES))

# Default target
all: $(PRG_FILES)

# Preprocessing rule
$(BUILD_DIR)/%.bas: $(SRC_DIR)/%.bpp | $(BUILD_DIR)
	@echo "Preprocessing $<"
	$(BPP) $< > $@ || (rm -f $@; exit 1)

# Tokenization rule
$(BUILD_DIR)/%.prg: $(BUILD_DIR)/%.bas
	@echo "Tokenizing $<"
	$(PETCAT) -w2 -o $@ -- $<

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Clean build artifacts
clean:
	rm -rf $(BUILD_DIR)

# Phony targets
.PHONY: all clean

# Dependencies (force rebuild on include changes)
$(BUILD_DIR)/main.bas: $(SRC_DIR)/main.bpp \
                       $(wildcard $(SRC_DIR)/lib/*.bpp) \
                       $(wildcard $(SRC_DIR)/assets/*.bin)
```

## Watch mode script

```bash title="watch-build.sh"
#!/bin/bash
# Auto-rebuild on file changes

BPP="./bpp"
SRC_DIR="src"
BUILD_DIR="build"

echo "Watching $SRC_DIR for changes..."

while true; do
    inotifywait -r -e modify,create,delete \
        --exclude '.*\.swp' \
        "${SRC_DIR}"
    
    echo "[$(date '+%H:%M:%S')] Change detected, rebuilding..."
    
    if make all 2>&1 | tee build.log; then
        echo "✓ Build successful"
    else
        echo "✗ Build failed"
        tail -n 20 build.log
    fi
    
    echo "---"
done
```

---

## See also

- [Compilation pipeline](../getting-started/compilation-pipeline.md) - Basic build workflow
- [API reference](api-reference.md) - Command line interface details
- [Error handling](error-handling.md) - Handling build errors in scripts