# Development and testing

Guide for extending, modifying, and testing the BPP+ Syntax Highlighting extension.

## Development setup

### Prerequisites

- [Visual Studio Code](https://code.visualstudio.com/) v1.105.0 or later
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
├── .vscode/                                # VS Code workspace settings
│   └── launch.json                         # Debug configurations
├── dist/                                   # Built extension packages
│   └── *.vsix                              # Installable extension file
├── docs/                                   # Documentation
│   ├── manual.md                           # User manual
│   └── overview.md                         # Short overview
├── snippets/                               # Code snippet definitions
│   └── bpp-plus-basic-v2.json              # All 100+ snippets
├── syntaxes/                               # TextMate grammar
│   └── bpp-plus-basic-v2.tmLanguage.json   # Syntax rules
├── .gitignore                              # Git ignore patterns
├── CHANGELOG.md                            # Version history
├── LICENSE.md                              # License terms
├── README.md                               # Project overview
├── language-configuration.json             # Language behavior config
└── package.json                            # Extension manifest
```

### Key files explained

**`package.json`** - Extension manifest defining:

- Extension metadata (name, version, publisher)
- Language registration and file associations
- Activation events (when extension loads)
- Contributed languages, grammars, and snippets

**`syntaxes/bpp-plus-basic-v2.tmLanguage.json`** - TextMate grammar containing:

- Regex patterns for tokenizing source code
- Scope names for semantic token classification
- Include rules for modular pattern composition

**`snippets/bpp-plus-basic-v2.json`** - Snippet definitions with:

- Trigger prefixes for each snippet
- Code patterns with placeholder variables
- Descriptions for IntelliSense

**`language-configuration.json`** - Language behavior settings:

- Comment delimiters (line and block)
- Bracket matching pairs
- Auto-closing pairs
- Word pattern definitions

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

The TextMate grammar in `syntaxes/bpp-plus-basic-v2.tmLanguage.json` uses regex patterns to classify code:

```json
{
  "match": "\\b(for|next|to|step)\\b",
  "name": "keyword.control.loop.cbmbas"
}
```

### Pattern structure

Each pattern rule contains:

- **`match`** - Regex pattern to match against source text
- **`name`** - Semantic token type (determines styling)
- **`captures`** (optional) - Named groups within the match
- **`begin`/`end`** (optional) - For multi-line patterns

### Scope naming conventions

VS Code uses hierarchical scope names that map to theme colors:

- `keyword.control` - Control flow keywords
- `entity.name.function` - Function declarations
- `entity.name.label` - Labels and targets
- `string.quoted.double` - String literals
- `comment.line` - Line comments
- `constant.numeric` - Numeric literals

### Testing grammar changes

After editing the grammar:

1. **Reload extension host:** Press `Ctrl+R` (or `Cmd+R` on Mac)
2. **Inspect tokens:** Use **Developer: Inspect Editor Tokens and Scopes** command
3. **Verify styling:** Check that tokens receive correct colors in various themes
4. **Test edge cases:** Try boundary conditions, nested patterns, etc.

### Grammar debugging tips

- Use online regex testers to validate patterns before adding them
- Test with minimal examples first, then expand
- Check for conflicts with existing patterns (order matters)
- Verify case-insensitive matching uses `(?i)` where needed
- Escape special regex characters

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
- `body` - Code pattern with `${n:placeholder}` for tab stops
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

**Common causes:**

- File extension mismatch (check exact spelling)
- Another extension claimed the file association
- VS Code cache corruption (reload window)

### Syntax highlighting fails

1. **Verify grammar file is valid JSON** - Use JSON validator or linter
2. **Check Developer Console for errors** - View → Developer Tools
3. **Reload extension host** - `Ctrl+R` or `Cmd+R`
4. **Test with minimal file** - Isolate problem patterns

**Common causes:**

- Invalid regex syntax in grammar patterns
- Circular include references
- Missing scope names
- Conflicting pattern precedence

### Snippets not appearing

1. **Verify snippet file is valid JSON** - Check for syntax errors
2. **Check `package.json` snippet contribution** - Ensure path is correct
3. **Reload VS Code** - Snippets may require full restart
4. **Test prefix trigger** - Type exact prefix and press `Tab`

**Common causes:**

- Typo in snippet prefix
- Invalid placeholder syntax
- Language ID mismatch
- VS Code snippet cache stale

### Grammar not matching expected patterns

Use **Developer: Inspect Editor Tokens and Scopes** command to debug:

1. Position cursor on problematic text
2. Run command from Command Palette
3. Inspect token scopes and matching rules
4. Verify scope hierarchy matches expectations

---

## Resources

- [VS Code extension API](https://code.visualstudio.com/api)
- [TextMate grammar guide](https://macromates.com/manual/en/language_grammars)
- [Snippet guide](https://code.visualstudio.com/docs/editor/userdefinedsnippets)
- [Scope naming conventions](https://www.sublimetext.com/docs/scope_naming.html)

## See also

- [Installation](../getting-started/installation.md)
- [Syntax highlighting](../language-support/syntax-highlighting.md)
