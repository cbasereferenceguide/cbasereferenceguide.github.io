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
# LIFE

## Introduction
**Life** is a financial simulation game where players build wealth through investments and career choices. Starting with education, they enter the workforce and grow their net worth. The game ends when a player reaches the target wealth.

![opening screen](/assets/images/cbase-games/life/opening-screen.png){ loading=lazy }

## Gameplay
Players manage their finances through investments in the stock market, real estate, and businesses while progressing through their careers. Each decision carries risks and potential rewards:

- **Stock Market:** Buy stocks and earn dividends, but beware of market crashes.
- **Real Estate:** Purchase properties that appreciate over time but require financing with high-interest rates.
- **Business Investment:** High-risk, high-reward opportunities that can greatly increase or diminish wealth.
- **Career Progression:** Start with education, switch jobs, and manage earnings wisely.

The goal is to be the first to reach the target net worth. Strategic planning and risk management are key to winning the game.

## Configuration
The game’s target wealth value is stored in `life.dat`. To modify the goal delete `life.dat`, and the game will generate a new configuration upon the next startup. The instructions file dynamically retrieves the target wealth value from this variable.

## Sources
This package includes the fully compiled module, the original and fixed BASIC source code, and all available game resources.

| Module    | C\*Base version        | Tested           | File                    |
| :-------- | :--------------------- | :--------------- | ----------------------- |
| Life [^1] | C\*Base v3.1 Larry Mod | :material-check: | [ZIP](sources/life.zip) |
|           | C\*Base v3.3.x Tao Mod | :material-minus: |                         |

[^1]: Decompiled, fixed and put together by [Larry/ROLE](https://csdb.dk/scener/?id=7207)