# Installation

## Prerequisites

### Required

- [Visual Studio Code](https://code.visualstudio.com/) v1.105.0 or later

### Optional

- [BPP+ preprocessor](../../../development/bpp-plus-preprocessor/index.md) - Adds labels, scopes, and modular compilation to BASIC v2
- [Node.js](https://nodejs.org/) v16.0 or later - Required only for building from source or contributing to development
- [vsce](https://github.com/microsoft/vscode-vsce) package manager - Required for creating `.vsix` distribution packages from source

## Installation methods

### Method 1: Install from .VSIX file

```bash
# Clone repository
git clone https://github.com/cbase-larrymod/bpp-plus-syntax-highlighter.git
cd bpp-plus-syntax-highlighter

# Install vsce if needed
npm install -g vsce

# Build the extension package
npm run package
```

The package command creates `dist/bpp-plus-basic-v2-syntax-0.0.5.vsix`.

In VS Code:

1. Open Extensions panel (`Ctrl+Shift+X` or `Cmd+Shift+X`)
2. Click the `⋯` menu (top-right of Extensions panel)
3. Select **Install from VSIX**
4. Navigate to `dist/bpp-plus-basic-v2-syntax-0.0.5.vsix`
5. Click **Install**

### Method 2: Development installation

For development and testing:

1. Clone the repository
2. Open the repository folder in VS Code
3. Press `F5` to launch a development window

See [Development and testing](../advanced-topics/development-and-testing.md) for details.

## Verification

```bash
# Create a test file
echo '10 print "hello world"' > test.bas
code test.bas
```

Expected behavior:

- **Activation:** Extension loads when you open `.bas` or `.bpp` files
- **Syntax highlighting:** Keywords like `print` appear styled according to your color theme
- **Status bar indicator:** Bottom-right corner shows **BPP+ BASIC v2** as the language mode

### Verification checklist

1. **Keywords highlighted** - `print`, `for`, `gosub`, `if` appear styled
2. **Numbers highlighted** - Line numbers and numeric literals are distinct
3. **Strings highlighted** - Double-quoted text appears in string color
4. **Comments highlighted** - `rem` or `;` statements appear in comment color
5. **Snippets available** - Type `for` and press `Tab` to test snippet expansion

### Manual language selection

If syntax highlighting does not activate automatically:

1. Click the language selector (bottom-right corner of VS Code window)
2. Type or select **BPP+ BASIC v2** from the language list
3. Syntax highlighting activates

This may occur if:

- You opened a file without `.bas` or `.bpp` extension
- Another extension claimed the file association

## File associations

- `.bas` - Standard BASIC v2 source files (line-numbered or preprocessed)
- `.bpp` - BPP+ preprocessor source files (with labels, scopes, and includes)

### Extension precedence

If multiple extensions register for the same file type, VS Code determines precedence by:

1. User-configured file associations in `settings.json`
2. Most recently installed extension
3. Extension with higher activation priority

To set BPP+ Syntax Highlighting as the handler:

```json
// In VS Code settings.json
"files.associations": {
  "*.bas": "bpp+basicv2",
  "*.bpp": "bpp+basicv2"
}
```

### Language identifier

Language ID `bpp+basicv2` is used for:

- Programmatic language selection via VS Code API
- Workspace-specific language overrides
- Extension dependency declarations
- Language-specific settings configuration

---

## Next steps

See [Quick start](quick-start.md).
