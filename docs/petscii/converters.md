<style>
    table th:first-of-type {
        width: 29% ;
    }
    table th:nth-of-type(2) {
        width: 5%;
    }
    table th:nth-of-type(3) {
        width: 35%;
    }
    table th:nth-of-type(4) {
        width: 100%;
    }
    table th:nth-of-type(5) {
        width: 100%;
    }
</style>

# Converters

## PETSCII conversion - A tool in the right hands
Ah, PETSCII conversion — the ultimate shortcut or the ultimate sin? Some call it a travesty, an almost forbidden act, no better than tracing a masterpiece with a blunt crayon. Others see it as a practical tool, a stepping stone to refine and shape something new. After all, even the best artists start with a rough sketch, right?

So, whether you're committing an artistic felony or just looking for a creative jumpstart, conversion tools are here. Use them wisely.

### Multi platform
| Name        | Version | Creator    | Link                                                                                            | File |
| :---------- | ------- | ---------- | ----------------------------------------------------------------------------------------------- | ---- |
| Petsciiator |         | Egon Olsen | [Homepage](https://jpct.de/petscii-server), [GitHub](https://github.com/EgonOlsen71/WebPetscii) |      |

### Windows
| Name               | Version | Creator                                       | Link                                                                                                                  | File                                               |
| :----------------- | ------- | --------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------- |
| PETSCII Compositor | v1.10   | [Jason Page](https://csdb.dk/scener/?id=4121) | [CSDB](https://csdb.dk/release/?id=226078)                                                                            | [ZIP](converters/PETSCII%20Compositor%20V1.10.zip) |
| Bmp2pet            |         | [Algorithm](https://csdb.dk/scener/?id=10879) | [CSDB](https://csdb.dk/release/?id=123365)                                                                            | [ZIP](converters/bmp2pet.zip)                      |
| Img2petscii        |         | [Youth](https://csdb.dk/scener/?id=1130)      | [GitHub](https://github.com/micheldebree/c64-tools/tree/main/img2petscii), [CSDB](https://csdb.dk/release/?id=233356) | [ZIP](converters/c64-tools-main.zip)               |

## PETSCII to ASCII and vice versa
For converting PETSCII to ASCII and vice versa, **petcat**, included with [VICE](https://vice-emu.sourceforge.io/), is a powerful tool. You can find available commands by running:  

These commands ensure smooth conversions between PETSCII and ASCII formats, making **petcat** an essential tool for handling SEQ files.

Convert a SEQ file to an ASCII file:
```sh
petcat -text -o outputfile.txt -- inputfile.seq
```
Convert an ASCII file to a SEQ file:
```sh
petcat -text -w2 -o outputfile.seq -- inputfile.txt
```