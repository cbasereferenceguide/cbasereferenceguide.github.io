# Development and testing

Guide for extension development and testing.

## Development setup

### Prerequisites

- [Visual Studio Code](https://code.visualstudio.com/) v1.60.0 or later
- [Node.js](https://nodejs.org/) v16.0 or later
- [Git](https://git-scm.com/)

### Clone and install

```bash
git clone https://github.com/cbase-larrymod/bpp-plus-syntax-highlighter.git
cd bpp-plus-syntax-highlighter
npm install
```

## Project structure

```
bpp-plus-syntax-highlighter/
├── .vscode/
├── dist/
├── docs/
│   └── manual.md
├── snippets/
│   └── bpp-plus-basic-v2.json
├── syntaxes/
│   └── bpp-plus-basic-v2.tmLanguage.json
├── .gitignore
├── CHANGELOG.md
├── LICENSE.md
├── README.md
├── language-configuration.json
└── package.json
```

## Testing the extension

### Launch development host

1. Open repository in VS Code
2. Press `F5` (or select **Run -> Start Debugging**)
3. New window opens with extension loaded

The development window is labeled **[Extension Development Host]**.

### Test syntax highlighting

Create a test file in the development window:

```cbmbas
main:
    print "{clr}{wht}Testing syntax"
    gosub screen.init
    end

screen: {
    init:
        poke 53280,0\
        return
}
```

Verify keywords, labels, scopes, and tokens are highlighted.

### Test code snippets

1. Type snippet prefix (e.g., `for`)
2. Press `Tab`
3. Verify expansion
4. Press `Tab` to navigate placeholders

## Modifying the grammar

The TextMate grammar in `syntaxes/bpp-plus-basic-v2.tmLanguage.json` uses regex patterns:

```json
{
  "match": "\\b(for|next|to|step)\\b",
  "name": "keyword.control.loop.cbmbas"
}
```

After editing, reload the extension host (`Ctrl+R` or `Cmd+R`).

Use **Developer: Inspect Editor Tokens and Scopes** command to verify scope assignments.

## Modifying snippets

Snippet structure in `snippets/bpp-plus-basic-v2.json`:

```json
{
  "FOR Loop": {
    "prefix": "for",
    "body": [
      "for ${1:var}=${2:start} to ${3:end}:${4:expr}:next ${1:var}"
    ],
    "description": "FOR loop"
  }
}
```

- `prefix` - Trigger text
- `body` - Template with `${n:placeholder}` for tab stops
- `description` - Help text

## Building the extension

### Create .vsix package

```bash
npm install -g vsce
npm run package
```

Output: `dist/bpp-plus-basic-v2-syntax-0.0.5.vsix`

### Install from .vsix

```bash
code --install-extension dist/bpp-plus-basic-v2-syntax-0.0.5.vsix
```

Or via VS Code UI:

1. Open Extensions panel
2. Click three-dot menu
3. Select **Install from VSIX**

## Troubleshooting

### Extension not activating

Check `package.json` activation events:

```json
{
  "activationEvents": ["onLanguage:bpp+basicv2"]
}
```

Verify file extensions are mapped:

```json
{
  "contributes": {
    "languages": [{
      "extensions": [".bas", ".bpp"]
    }]
  }
}
```

### Syntax highlighting fails

1. Verify grammar file is valid JSON
2. Check Developer Console for errors
3. Reload extension host

### Snippets not appearing

1. Verify snippet file is valid JSON
2. Check `package.json` snippet contribution
3. Reload VS Code

---

## Resources

- [VS Code extension API](https://code.visualstudio.com/api)
- [TextMate grammar guide](https://macromates.com/manual/en/language_grammars)
- [Snippet guide](https://code.visualstudio.com/docs/editor/userdefinedsnippets)

## See also

- [Installation](../getting-started/installation.md) - Installing the extension
- [Syntax highlighting](../features/syntax-highlighting.md) - What gets highlighted
