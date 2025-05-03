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

# Puzzler

## Introduction
Puzzler is a single-player logic game. The goal is to solve a 3x3 matrix so that every tile shows a 1, except for the center, which must stay at 0.

If you like brain teasers, this one's for you.

## Gameplay
Each position on the grid is identified by row and column. For example, the top-right corner is 1,3. Here’s how the puzzle works:

- You can only change a 1 to a 0.
- When you change a 1 to 0, its immediate neighbors flip their state.
    - A 1 becomes a 0, and a 0 becomes a 1.
- Changing corner positions also flips the center tile.
- Changing the center position flips the middle tile on each side:
    - 1,2, 2,1, 2,3, and 3,2

There’s no penalty for experimenting. Try a few moves and observe how the board reacts. The solution is always logical—but not always obvious.

Solve it, and you'll earn 10 credits.

## Trivia
Converted by BOOTS BBS 414-494-6395, TSCS member. Converted to C\*Base v3.0 by Morgan at Midnight Flyer BBS (317) 293-8522

## Sources
This package includes the fully compiled module, the original and fixed BASIC source code, and all available game resources.

| Module       | C\*Base version        | Tested           | File                       |
| :----------- | :--------------------- | :--------------- | -------------------------- |
| Puzzler [^1] | C\*Base v3.1 Larry Mod | :material-check: | [ZIP](sources/puzzler.zip) |
|              | C\*Base v3.3.x Tao Mod | :material-minus: |                            |

[^1]: Decompiled, fixed and put together by [Larry/ROLE](https://csdb.dk/scener/?id=7207)