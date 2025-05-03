<style>
    table th:first-of-type {
        width: 40%;
    }
    table th:nth-of-type(2) {
        width: 100%;
    }
    table th:nth-of-type(3) {
        width: 100%;
    }
    table th:nth-of-type(4) {
        width: 100%;
    }
</style>

# Eliza

## Introduction
Eliza is a pioneering natural language processing computer application, developed by [Joseph Weizenbaum](https://en.wikipedia.org/wiki/Joseph_Weizenbaum) at MIT between 1964 and 1967. Even in those early days, it managed to create the illusion of understanding the user.

Naturally, C*Base had its own Eliza module. How closely it followed Weizenbaum’s original work is unclear, but the goal remained the same - to simulate a conversation and make users feel as if the computer was responding in a meaningful way.

![opening screen](/assets/images/cbase-games/eliza/opening-screen.png){ loading=lazy }

## Usage
By today’s standards, the module was extremely primitive. Yet, at the time, it was still "clever" enough to fool many teenagers into believing they were having a somewhat meaningful discussion with Eliza. One can only imagine the sheer amount of swearing and sexual harassment this poor chatbot had to endure.

There have been several versions and copycats of Eliza on the C64, possibly the earliest being developed by [ET Computing](https://www.lemon64.com/games/list.php?list_company=et-computing&list_max_players=1) back in 1982. The exact release year of the C\*Base module remains unknown.

## Sources
This package includes the fully compiled module, the original and fixed BASIC source code, and all available game resources.

| Module     | C\*Base version        | Tested           | File                     |
| :--------- | :--------------------- | :--------------- | ------------------------ |
| Eliza [^1] | C\*Base v3.1 Larry Mod | :material-check: | [ZIP](sources/eliza.zip) |

[^1]: Decompiled, fixed and put together by [Larry/ROLE](https://csdb.dk/scener/?id=7207)