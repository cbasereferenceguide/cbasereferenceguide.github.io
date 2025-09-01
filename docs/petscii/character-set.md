# Character set

## References
PETSCII (PET Standard Code of Information Interchange) is the character set developed by Commodore for their 8-bit computers, starting with the PET in 1977. It extends the original ASCII standard to include graphical symbols, allowing for the creation of text-based graphics and interfaces.

## Documents
- Slark's [Commodore 64 PETSCII & screen display characters chart](character-set/c64-petscii-screen-display-characters-chart.pdf) (PDF) [^1]
- Larry Anderson's [Commodore 8-bit multi-chart](character-set/cbm-character-byte-multichart.pdf) in (PDF)
:   This is a Commodore Multichart on steroids, it lists various byte representations in Commodore 8-bit computers, Character Symbols (using the VIC-20 character ROM for best representation w/grey borders) Character Codes of PETASCII, Screen Code, true ASCII, 6502 ML, and BASIC Tokens for most of the 8-bit Commodores. As one person put it, "a Commodore Rosetta Stone".
- Vladimir Lidovski's [C16/+4/116/64 Character generator and Unicode](character-set/c16-plus4-116-64-character-generator.pdf) in (PDF) [^2]
- Linus Walleij's [PETSCII C64 English uppercase to Unicode table](character-set/petscii_c64en_uc.txt) (TXT)
- Linus Walleij's [PETSCII C64 English lowercase to Unicode table](character-set/petscii_c64en_lc.txt) (TXT)
- Aivosto's [Commodore PETSCII character sets](character-set/commodore-petscii-character-sets.pdf) [^3]

## Links
- C64-Wiki's [Control character](https://www.c64-wiki.com/wiki/control_character)
- Ultimate Commodore 64 Reference's [Character Set · PETSCII · Keyboard](https://www.pagetable.com/c64ref/charset/)
- Style's [PETSCII Reference](https://style64.org/petscii/)
:    PETSCII to ASCII/Unicode/TrueType mappings + more. This PETSCII reference focuses on the C64 character set and control codes. The character matrix displays each PETSCII code point, showing the corresponding glyph or control effect, with reverse mode off by default.
- Joe Forster's [Commodore 64 PETSCII codes (with key combinations)](http://sta.c64.org/cbm64petkey.html)

## Encoding for other platforms
- [cbmcodecs2 - Python encodings for handling PETSCII and C64 Screencode text](https://github.com/irmen/cbmcodecs2)
:   The cbmcodecs2 package provides a number of encodings for handling text from Commodore 8-bit systems. Much of the credit for this package must go to Linus Walleij of Triad, as these codecs were built from his PETSCII to Unicode mappings. The screencodes codec was created by hand later and borrows from them.
:   [Current master branch as of 2023/09/07](character-set/cbmcodecs2-main.zip) (ZIP)

## Fonts for other platforms
- Kreative Korporation's [The Ultimate Commodore Font](character-set/petme.zip) (ZIP) [^4]
- Style's [C64 TrueType (TTF) Fonts](character-set/c64-truetype-v1.2.1-style.zip) (ZIP) [^5]
:   Style’s C64 TrueType package offers a comprehensive TrueType (TTF) representation of the C64 glyph set. The package includes two typefaces, each available in .ttf, .otf, .woff, .woff2, and .eot formats.

[^1]: Created by [slark.me](https://slark.me/c64-petscii-screen-display-characters-chart.html)
[^2]: Edited by [Csabo of LOD](https://demozoo.org/sceners/17597)
[^3]: Crated by [Aivosto Oy](https://www.aivosto.com/articles/charsets.html)
[^4]: Created by [Kreative Korporation](https://www.kreativekorp.com/software/fonts/c64)
[^5]: Created by [Style](https://style64.org/c64-truetype)