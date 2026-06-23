# Development and testing

Guide for building, modifying, and testing the C\*Base PETSCII Viewer extension.

## Prerequisites

- [Visual Studio Code](https://code.visualstudio.com/) v1.105.0 or later
- [Node.js](https://nodejs.org/) v24.0 or later
- [Git](https://git-scm.com/)

## Clone and install

```bash
git clone https://github.com/cbase-larrymod/cbase-petscii-viewer.git
cd cbase-petscii-viewer
npm install
```

## Project structure

```
cbase-petscii-viewer/
├── docs/
│   ├── manual.md                   # User manual
│   └── overview.md                 # Short overview
├── media/
│   ├── viewer.js                   # .seq webview renderer (canvas + ImageData)
│   └── petmateViewer.js            # .petmate webview renderer
├── src/
│   ├── extension.ts                # Extension entry point
│   ├── seqEditorProvider.ts        # CustomReadonlyEditorProvider for .seq
│   ├── petmateEditorProvider.ts    # CustomReadonlyEditorProvider for .petmate
│   ├── petsciiDecoder.ts           # PETSCII → DecodedChar[] row decoder
│   ├── petmateDecoder.ts           # Petmate JSON → PetmatePage[] decoder
│   ├── petsciiMaps.ts              # PETSCII byte → Unicode code point maps
│   └── colorPalette.ts             # C64 color palette definitions
├── CHANGELOG.md
├── package.json
└── tsconfig.json
```

### Key files

**`src/seqEditorProvider.ts`** — The `.seq` editor provider. Handles decoding, MCI stripping, toolbar state, and message passing to the webview.

**`src/petmateEditorProvider.ts`** — The `.petmate` editor provider. Reads Petmate JSON, handles page navigation and background color overrides.

**`src/petsciiDecoder.ts`** — Converts raw `.seq` bytes into rows of `DecodedChar` objects. Handles color state, reverse mode, row terminators, auto-wrap, and CLS boundaries.

**`src/colorPalette.ts`** — All six palette definitions and palette metadata. This is the only file to edit when adding or modifying palettes.

**`media/viewer.js`** — Webview script for the `.seq` viewer. Receives decoded character data from the provider, renders to canvas using `ImageData`.

**`media/petmateViewer.js`** — Webview script for the `.petmate` viewer. Same canvas pipeline, different data format.

## Testing the extension

### Launch development host

1. Open the repository in VS Code
2. Press `F5` (or **Run → Start Debugging**)
3. A new VS Code window opens with the extension loaded

The development window is labeled **[Extension Development Host]**.

### Test with real files

Open `.seq` files from the C\*Base asset directory:

```
cbase-3.1/assets/bbs/seq/
```

Do not modify files in this directory — they belong to the source repository and serve as reference test assets.

Cross-check rendering against VICE emulator output for ground truth. VICE → **Settings → Video → VICII → External Palette** to load the same palette for a direct comparison.

### Test .petmate files

Open `.petmate` files from `tmp/`. Verify page navigation, background color swatches, charset toggle, and MCI token visibility.

## Building

### Compile TypeScript

```bash
npm run compile
```

Output goes to `out/`.

### Create .vsix package

```bash
npm run package
```

Output: `dist/cbase-petscii-viewer-0.4.0-beta.vsix`

### Install from .vsix

```bash
code --install-extension dist/cbase-petscii-viewer-0.4.0-beta.vsix
```

Or via VS Code UI: Extensions panel → three-dot menu → **Install from VSIX**.

---

## See also

- [Quick start](../getting-started/quick-start.md)
- [Installation](../getting-started/installation.md)
- [How rendering works](rendering.md)
