# C\*Base Reference Guide

The ultimate guide to the C*Base BBS system for Commodore 64 +

**Covers:**
- Larry v3.1
- Tao v3.3.8

## General notes etc.

## Work in progress
- Prompts (Each page covering both Larry v3.1 and Tao v3.3.8)

## Ideas about chapters
- Getting started
- Hardware
- Prompts
- BBS Files
- Setting up CMD HD in WinVice
- Configuring TCPSer (Linux/Windows)
- Translate all charts to AsciiDoc
- Section with links to tools like CMD Diredit, HD-Tools, JiffyDOS etc
- Page with links to different releases on csdb.dk
- Translate and improve the three parts of TAOs manual for 3.3? (Question for Larry, update to current setting)
- Go over Larrys readme file with bugfixes and add a page that includes them, more verbose text?

## PETSCII References
- https://style64.org/petscii/
- https://c64os.com/post/c64petsciicodes
- https://www.aivosto.com/articles.html
- https://en.wikipedia.org/wiki/PETSCII
https://sta.c64.org/cbm64pet.html

### Documents from Larry Anderson and Vladimir Lidovski
- CBM character/byte multichart (source)
- C16/+4/116/64 character generator (source)
  https://dflund.se/~triad/krad/recode/petscii.html

### PETSCII character maps
Scanned from Handic C64 documentation, Swedish translation of the C64 programmers reference guide
- PETSCII Map part 1
- PETSCII Map part 2
- PETSCII Map part 3

### PETSCII Screen codes
Scanned from Handic C64 documentation, Swedish translation of the C64 programmers reference guide
- PETSCII Screen codes part 1
- PETSCII Screen codes part 2
- PETSCII Screen codes part 3

## C64 Colors in HEX
https://c64online.com/commodore-64-color-codes/

## Links & Stuff
https://pinacolada64.github.io/ImageBBS3-docs.github.io/12b-updated.html?fbclid=IwAR2ToD6SkLnR7dcwr1RGil1Unhps-tnH1MCdmXVunZOl6iRo5nOVGw3hgl4#trueintroduction[Image BBS 3 Documentation]


## Development environment

Prerequisites for MkDocs Material are Python 3.X
Check the [installation](https://squidfunk.github.io/mkdocs-material/getting-started/) guide from MkDocs Material.

### Installation
Create a virtual environment for Python, read more here https://docs.python.org/3/library/venv.

```
python -m venv [name]

python -m pip install --upgrade pip

.\[name]\Scripts\activate
deactivate
```

Install MkDocs Material, read more here https://squidfunk.github.io/mkdocs-material/getting-started/
```
pip install mkdocs-material
```
Install the "mkdocs-minify-plugin"
https://github.com/byrnereese/mkdocs-minify-plugin

```
pip install mkdocs-minify-plugin
```

### Running local site

Run site locally at http://localhost:8000:
```
mkdocs serve
```

To run the site on a different port, such as 8080:
```
mkdocs serve --dev-addr=127.0.0.1:8080
```

---

Credits: Skyhawk/Triad