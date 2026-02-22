# Larry / Raiders of the lost Empire
Larry’s BBS journey began after years of mail swapping when a close friend acquired his first modem. Together, they started calling PC and Amiga "mailboxes" in Germany, and in 1990/91, Larry purchased a Dataphone S21d (300 baud) from a local enthusiast. This allowed him to access C64 boards, where C\*Base stood out with its PETSCII screens and cursor-driven menus. From that moment, he knew that if he ever ran a BBS, it would be with C\*Base.

## Raveolution: The rise and fall
In 1993, Larry launched his first BBS, [Raveolution](https://csdb.dk/bbs/?id=172), using a C64, two 1541 drives, and UCBBS. However, frequent crashes and disconnects led him to switch to Cyborg's modded C\*Base 3.1 with a Swiftlink cartridge. By 1996, his setup had evolved to include a CMD-HD, RamLink, C128D, SuperCPU, and a 14.4k modem running Moses' mod. The BBS operated until 1996, when military service forced its closure, though it briefly reopened in 1997. By that time, the rise of the internet had diminished the BBS scene, and Larry ultimately shut it down for good.

## From nostalgia to innovation: Larry Mod
Two decades later, Larry revived his C64 setup, integrating modern hardware like the Reloaded MK2 board and Moses' modded C\*Base. Over time, he documented his work, refined key components like the Midnight module, and developed his own modded version of C\*Base, which he named Larry Mod. Starting from a decompiled Villain mod, Larry quickly discovered that it was unstable and full of bugs. He went through the entire codebase, reworking almost every part.

The result was proper, maintainable source code: no line numbers, clear labels, and modular structure that allows code sections to be moved and extended freely. In practice, this meant rebuilding the system from the ground up while selectively integrating features from both C\*Base and UCBBS.

Larry also worked on improving transfer protocols, fixing and enhancing X-Modem, Punter, and Y-Modem batch, while reviving the Rainbow protocol, which supports REL files. Currently, he is working on integrating Turbo-Modem by [L.A.Style](https://csdb.dk/scener/?id=673), a brand-new protocol designed specifically for speed and efficiency on the C64. Due to size constraints, Z-Modem support is unlikely to be added.

His BBS now operates with modern hardware, including U64, SD2IEC, and Silversurfer, running seamlessly on TurboChameleon with a TCP/IP bridge.

Larry Modded C\*Base offers unparalleled hardware and protocol support while maintaining stability. For development, Larry relies on tools like VSCode, VICE, and custom build scripts, ensuring that his BBS and C\*Base mod remains a cutting-edge platform in the C64 scene.