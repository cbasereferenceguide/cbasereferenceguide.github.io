# C\*Base Reference Guide

Designed as a comprehensive tool and reference source, this guide is for users aiming to maximize the capabilities of their C\*Base setup. Whether you're setting up, managing, or running your own C\*Base BBS, this guide provides the essential information needed to make the most of your system.

## Purpose of the guide
The C\*Base Reference Guide serves as a resource for users at all levels. Like any reference book, its usefulness depends on your existing knowledge of the subject. It is designed to grow with you as your expertise with C\*Base expands.

If you're new to C\*Base, you may find that some sections require a deeper understanding of the system to fully grasp and apply. However, as you expand your familiarity with C\*Base, this guide will continue to be an invaluable resource.

## Practical and accessible information
This guide presents a wealth of detailed and practical C\*Base information in clear, plain English. Technical jargon often used by sysop's is thoroughly explained, ensuring accessibility for beginners. At the same time, experienced users will find all the details necessary to harness the full potential of the system effectively and efficiently.

# Covers (at the moment)
- Larry Mod v3.1
- Tao Mod v3.3.8

# Development environment

Prerequisites for MkDocs Material are Python 3.X
Check the [installation](https://squidfunk.github.io/mkdocs-material/getting-started/) guide from MkDocs Material.

### Installation
Create a virtual environment for Python, read more here https://docs.python.org/3/library/venv.

```
python -m venv <venv-name>

python -m pip install --upgrade pip
```

Install MkDocs Material, read more here https://squidfunk.github.io/mkdocs-material/getting-started/
```
Note: Inside <venv-name>

pip install mkdocs-material
```
Install the "mkdocs-minify-plugin"
https://github.com/byrnereese/mkdocs-minify-plugin

```
Note: Inside <venv-name>

pip install mkdocs-minify-plugin
```

### Activate the virtual environment
```
.\<venv-name>\Scripts\activate
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

### Deactivate a Virtual Environment
```
.\<venv-name>\Scripts\deactivate
```

---

Credits: Skyhawk/Triad