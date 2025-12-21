# Installation

## Prerequisites

### Required

- [Visual Studio Code](https://code.visualstudio.com/) v1.60.0 or later

### Optional

- [BPP+ preprocessor](../../../development/bpp-plus-preprocessor/index.md) for enhanced BASIC development
- [Node.js](https://nodejs.org/) v16.0 or later (for building from source)
- [vsce](https://github.com/microsoft/vscode-vsce) package manager (for creating `.vsix` packages)

## Installation methods

### Method 1: Install from .VSIX file (recommended)

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

### Method 2: Install from VS Code Marketplace

Not yet available. The extension will be published to the marketplace in a future release.

### Method 3: Development installation

For development and testing:

1. Clone the repository
2. Open the repository folder in VS Code
3. Press `F5` to launch a development window

The extension loads automatically in the development window. See [Development and testing](../advanced-topics/development-and-testing.md) for details.

## Verification

```bash
# Open a test file
echo '10 print "hello world"' > test.bas
code test.bas
```

The extension activates automatically when you open `.bas` or `.bpp` files. Keywords like `print` appear highlighted.

### Manual language selection

If syntax highlighting does not activate:

1. Click the language selector (bottom-right corner)
2. Select **BPP+ BASIC v2**

## File associations

The extension automatically activates for:

- `.bas` - BASIC v2 files
- `.bpp` - BPP+ preprocessor files

---

## Next steps

Once installation is complete, proceed to [Quick start](quick-start.md) to learn how to use syntax highlighting and code snippets.
