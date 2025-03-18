<style>
    table th:first-of-type {
        width: 55% ;
    }
    table th:nth-of-type(2) {
        width: 5%;
    }
    table th:nth-of-type(3) {
        width: 5%;
    }
    table th:nth-of-type(4) {
        width: 100%;
    }
    table th:nth-of-type(5) {
        width: 100%;
    }
</style>

# Tools

## Getting your hands dirty
A list of useful programs and utilities to help you work with PETSCII, SEQ files, DirArt, and, for those who dare (spooky, eh?), [HEX editing](#hex-editors-simple-tools-for-the-complex-tasks). While it might seem like a complex task, working with HEX editors is often simpler than you'd expect — especially when handling SEQ files, such as switching between character sets, and more.

### Commodore 64/128
| Name          | Version | Creator                                | Link                                       | File                               |
| :------------ | :------ | :------------------------------------- | :----------------------------------------- | ---------------------------------- |
| CGLinker [^1] | v1.0    | [Oneway](https://csdb.dk/group/?id=31) | [CSDB](https://csdb.dk/release/?id=163364) | [D64](tools/CG-Link-v1.0-1WAY.d64) |

### Multi platform
| Name                          | Version | Creator                                    | Link                                                                                        | File                     |
| :---------------------------- | :------ | :----------------------------------------- | :------------------------------------------------------------------------------------------ | ------------------------ |
| DART - Directory Art Importer | v1.2    | [Sparta](https://csdb.dk/scener/?id=29482) | [CSDB](https://csdb.dk/release/?id=236120), [GitHub](https://github.com/spartaomg/dart_cpp) | [ZIP](tools/dart1.2.zip) |
| DART - Directory Art Importer | v1.3    | [Sparta](https://csdb.dk/scener/?id=29482) | [CSDB](https://csdb.dk/release/?id=238418), [GitHub](https://github.com/spartaomg/dart_cpp) | [ZIP](tools/dart1.3.zip) |
| DART - Directory Art Importer | v1.4    | [Sparta](https://csdb.dk/scener/?id=29482) | [CSDB](https://csdb.dk/release/?id=248771), [GitHub](https://github.com/spartaomg/dart_cpp) | [ZIP](tools/dart1.4.ZIP) |

### Windows
| Name                          | Version | Creator                                    | Link                                                                                        | File                      |
| :---------------------------- | :------ | :----------------------------------------- | :------------------------------------------------------------------------------------------ | ------------------------- |
| DART - Directory Art Importer | v1.0    | [Sparta](https://csdb.dk/scener/?id=29482) | [CSDB](https://csdb.dk/release/?id=226262), [GitHub](https://github.com/spartaomg/dart_cpp) | [EXE](tools/DART_1.0.exe) |
| DART - Directory Art Importer | v1.1    | [Sparta](https://csdb.dk/scener/?id=29482) | [CSDB](https://csdb.dk/release/?id=226717), [GitHub](https://github.com/spartaomg/dart_cpp) | [EXE](tools/DART_1.1.exe) |

## HEX Editors: Simple tools for the ‘complex’ tasks
A HEX editor is an invaluable tool for cross-platform editing of SEQ files, especially for advanced modifications. Unlike standard text editors, it allows precise byte-level manipulation, making it essential for tasks such as:

### Common Uses:
- Switching between uppercase and lowercase character sets within a file.
- Injecting control codes or special PETSCII characters that aren’t easily accessible in a regular editor.
- Editing SEQ files for cross-platform development or C*Base, where direct HEX-level modifications can be particularly useful.

Using a HEX editor ensures you retain full control over the file’s contents, making it a crucial tool for working with SEQ files in specialized scenarios.

### Recommended HEX editors
| Name       | Version | Platform | Creator                                  | Link                                    |
| :--------- | :------ | :------- | ---------------------------------------- | --------------------------------------- |
| HexEd      |         | Webb     | [Jens Duttke](https://www.duttke.de/en/) | [Browser](https://hexed.it)             |
| HxD Editor |         | Windows  | [Maël Hörz](https://mh-nexus.de/en/)     | [Homepage](https://mh-nexus.de/en/hxd/) |

[^1]:
    This tool was originally created for [Jucke/Judas](https://csdb.dk/scener/?id=647) and later released to the public.
    It also includes some hilarious user feedback — check it out!

    **Quote from Jucke:**
:   I was getting requests to make longer openscreens for some usa boards, and they all had hell linking two digipaint screens together and removing the screen clear without corrupting the rest, so i asked skyflash to make this linker to me, that will take 2 or more digipaint 3.0 screens and put them after eachother WITHOUT clr. ENJOY. :)