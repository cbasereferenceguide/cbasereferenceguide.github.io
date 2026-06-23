# Installation

## Prerequisites

### Required

- [Visual Studio Code](https://code.visualstudio.com/) v1.105.0 or later

### Optional (for building from source)

- [Node.js](https://nodejs.org/) v24.0 or later
- [vsce](https://github.com/microsoft/vscode-vsce)

## Installation methods

### Method 1: Install pre-compiled extension

```bash
git clone https://github.com/cbase-larrymod/cbase-petscii-viewer.git
cd cbase-petscii-viewer
```

**Via VS Code UI:**

1. Open Extensions panel (`Ctrl+Shift+X` or `Cmd+Shift+X`)
2. Click the `⋯` menu (top-right of the panel)
3. Select **Install from VSIX**
4. Navigate to `dist/cbase-petscii-viewer-0.4.0-beta.vsix`
5. Click **Install**

**Via command line:**

```bash
code --install-extension dist/cbase-petscii-viewer-0.4.0-beta.vsix
```

### Method 2: Build and install from source

```bash
git clone https://github.com/cbase-larrymod/cbase-petscii-viewer.git
cd cbase-petscii-viewer
npm install
npm run package
```

The package command creates `dist/cbase-petscii-viewer-0.4.0-beta.vsix`. Install using Method 1.

### Method 3: Development installation

1. Clone the repository
2. Open the folder in VS Code
3. Press `F5` to launch the extension development host

See [Development and testing](../advanced-topics/development.md) for details.

## Verification

Open any `.seq` or `.petmate` file. The viewer activates automatically and renders the content. The toolbar appears at the top of the editor panel.

---

## Next steps

See [Quick start](quick-start.md).
