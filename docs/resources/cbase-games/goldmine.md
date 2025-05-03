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

# Goldmine

## Introduction
Goldmine by Sam Lewit. Somewhere on a 9x9 grid, a box hides a stash of gold. Your goal is simple: find it. You have 10 tries to locate the gold. If you succeed, the game continues — only now, you’ll have one fewer try. The challenge increases with each round.

![opening screen](/assets/images/cbase-games/goldmine/opening-screen.png){ loading=lazy }

## Gameplay
You’ll navigate a 9x9 grid, choosing one box at a time to dig. With each guess, you get closer — or not. Find the gold within the limit to move on. Fail, and the game ends.

- Press Q at any time to quit early.
- Press R to redraw the screen if it becomes distorted.

Each round tests your luck and memory a little more. Can you keep going as the odds tighten?

**Important:** You must be in CBM Graphics Mode to play this game properly.

## Sources
This package includes the fully compiled module, the original and fixed BASIC source code, and all available game resources.

| Module        | C\*Base version        | Tested           | File                        |
| :------------ | :--------------------- | :--------------- | --------------------------- |
| Goldmine [^1] | C\*Base v3.1 Larry Mod | :material-check: | [ZIP](sources/goldmine.zip) |

[^1]: Decompiled, fixed and put together by [Larry/ROLE](https://csdb.dk/scener/?id=7207)