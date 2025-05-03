<style>
    table th:first-of-type {
        width: auto;
    }
    table th:nth-of-type(2) {
        width: auto;
    }
    table th:nth-of-type(3) {
        width: auto;
    }
    table th:nth-of-type(4) {
        width: auto;
    }
</style>

# Oceangunner

## Introduction
Oceangunner is a single-player naval combat game. Track, aim, and fire to sink your enemy before they sink you.

![opening screen](/assets/images/cbase-games/oceangunner/opening-screen.png){ loading=lazy }

## Gameplay
Your ship and the enemy are represented through a tactical display, complete with compasses, range information, and weapon controls. Victory depends on your aim, timing, and ability to read your instruments.

### Navigation & display
- Compass - Shown on the left. It updates only when you make a significant course change. Below it, your heading display shows your current direction in degrees and updates with every movement.
- Enemy compass - Shown on the right. It helps you steer toward the target and includes the enemy’s heading and the range to their ship.
- Horizon display - When the enemy is within range, they appear on the horizon. The further away they are, the smaller they look—accuracy becomes critical.

### Weapon systems
- Cannon angle - Located between the compasses. You can aim from 0° to 45°, hitting targets between roughly 200 and 500 yards. Higher angles shoot farther.
- Damage reports - Located at the bottom right. Three hits sink either you or the enemy. Stay alert.
- Gunner messages - At the bottom left. These show the result of your shots—hits, misses, and updates.

### Key commands
| Key | Cannon action      | Key | Ship actions        |
| :-- | :----------------- | --- | ------------------- |
| U   | Raise cannon by 1° | H   | Turn ship left 1°   |
| N   | Lower cannon by 1° | J   | Turn ship right 1°  |
| I   | Raise cannon by 5° | G   | Turn ship left 10°  |
| M   | Lower cannon by 5° | K   | Turn ship right 10° |
| F   | Fire cannon        | T   | Try it and see      |
| Q   | Quit to BBS/Menu   |     |                     |

Pressing any other key updates your gauges.

### Compass Reference
````
                   0
                  360
                   N
      315 NW       *       NE 45
            *             *
     270 W *               * E 90
            *             *
      225 SW       *       SE 135
                   S
                  180
````

## Sources
This package includes the fully compiled module, the original and fixed BASIC source code, and all available game resources.

| Module           | C\*Base version        | Tested           | File                           |
| :--------------- | :--------------------- | :--------------- | ------------------------------ |
| Oceangunner [^1] | C\*Base v3.1 Larry Mod | :material-check: | [ZIP](sources/oceangunner.zip) |
|                  | C\*Base v3.3.x Tao Mod | :material-minus: |                                |

[^1]: Decompiled, fixed and put together by [Larry/ROLE](https://csdb.dk/scener/?id=7207)