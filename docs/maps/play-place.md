# Map spec: Indoor play place

Draft layout for the main map. The pictures show it; this file has the exact
numbers so Claude Code can build a greybox version (simple blocks with the
right tags) that the owner then decorates in Studio.

All numbers are **(suggested)** unless the design doc says otherwise. Change
them freely, but keep this file and the pictures in sync.

| Picture | Shows |
|---|---|
| `play-place-ground.png` | Ground floor (Y = 0) |
| `play-place-floor2.png` | Floor 2 (Y = 24) |
| `play-place-floor3.png` | Floor 3 (Y = 48), big version only |

## Coordinates

- Units are studs. The building's **north-west corner at floor level is
  (0, 0, 0)**.
- **X** runs west to east (0 to 560). **Z** runs north to south (0 to 360).
  In the pictures, north is up.
- **Y** is height: ground floor 0, floor 2 at 24, floor 3 at 48, ceiling at
  76.
- Zones below are written as `x1–x2, z1–z2`.
- The **office doors** are on the **south wall** (Z = 360) at X 20–60.
- Big version: everything below. **Small version** (2 to 14 players): the
  same building with **floor 3 closed off** (netting over the ladders up from
  floor 2 and a "closed" sign).

## Ground floor (Y = 0)

| Zone | Area | Notes | Tags |
|---|---|---|---|
| Maintenance hallway | x 5–555, z 5–23 | Staff only, narrow, pipes and fuse boxes. Door to the storage room at (500, 23). | `Door` |
| Kitchen | x 5–55, z 140–250 | Staff only, behind the snack bar. Door to the snack bar on its east wall at (55, 200). Vent to the maintenance hallway (below). | `Door`, `Vent` |
| Snack bar counter | x 58–66, z 165–250 | Counter you can hide behind. | |
| Snack bar seating | x 70–220, z 165–250 | About 8 tables with tablecloths, chairs flipped up on top. | `HideTable` |
| Play structure, level 1 | x 140–420, z 30–150 | Ground level of the climbing structure: cargo nets up, crawl tubes. | `Climbable`, `CrawlTube` |
| Big ball pit | x 302–406, z 46–134 | Inside the structure's ground level, floor sunk 4 studs. The giant spiral slide lands here. | `BallPit`, `BallPitBalls` |
| Storage room | x 440–555, z 30–120 | Staff only: boxes, spare balls, mop buckets. Door to the hall at (490, 120). | `Door` |
| Entrance hall | x 20–60, z 270–358 | From the office doors: cubbies, shoe racks, sign-in desk. Opens into the hall at (40, 270). | `EntranceSpawn` |
| Arcade | x 70–235, z 270–350 | Rows of arcade machines. | `ArcadeMachine` |
| Prize counter | x 238–272, z 270–350 | Glass cases of plushies and toys. | |
| Small ball pit | x 290–380, z 285–345 | Near the entrance. | `BallPit`, `BallPitBalls` |
| Toddler zone | x 410–555, z 250–350 | Soft play with low padded walls (3 studs) and about 20 foam blocks. | `FoamBlock` |
| West stairs | x 75–107, z 120–154 | Up to the west balcony. | |
| East stairs | x 400–436, z 196–240 | Up to the east balcony. | |
| Atrium | the open middle | Open floor around the info desk. | |
| Info desk | circle, center (280, 205), radius 12 | Round staff desk in the middle. Seekers wait here blind. | `SeekerStart` |

**Spawn points**

| Tag | Positions (x, z) |
|---|---|
| `EntranceSpawn` | Around (40, 340) in the entrance hall |
| `SeekerSpawn` | (250, 172), (310, 172), (250, 246), (310, 246) |
| `ItemSpawn` | (150, 210), (360, 240), (480, 140), (200, 300) |
| `FightSpawn` | (110, 230), (460, 230), (340, 320), (220, 160) |

**Vents (crouch only, `Vent`)**
- Kitchen north wall (30, 140) to the maintenance hallway (30, 23), inside
  the west wall.
- Storage room (500, 120) to the toddler zone (500, 250), inside the east
  side.

**Slides:** two open slides from the south edge of structure level 2 land on
the ground at about (200, 165) and (262, 165).

**Cleaning robot** (`RobotPath` points): (240, 160) → (330, 160) →
(400, 260) → (380, 350) → (280, 270) → (200, 260) → back to start.

## Floor 2 (Y = 24)

| Zone | Area | Notes | Tags |
|---|---|---|---|
| Play structure, level 2 | x 140–420, z 30–150 | Platforms, cargo nets, crawl tubes. | `Climbable`, `CrawlTube` |
| West balcony | x 0–120, z 110–260 | Overlooks the snack bar. Lost and found. Railing on the open sides. | |
| East balcony | x 420–560, z 20–250 | Walkway at x 420–440 in front of the party rooms. Railing on the open sides. | |
| Party room 1 | x 440–552, z 28–90 | Little stage, balloons. Door at (440, 59). | `Door`, `Balloon` |
| Party room 2 | x 440–552, z 98–160 | Tables with tablecloths, cake. Door at (440, 129). | `Door`, `HideTable` |
| Party room 3 | x 440–552, z 168–230 | Tables with tablecloths, presents. Door at (440, 199). | `Door`, `HideTable` |
| Open to below | everything else | The atrium, snack bar, arcade, small ball pit and toddler zone are open up to the ceiling. | |

- **Rope bridges:** west balcony to the structure at z 128 (x 120–140);
  structure to party room 1's door at z 60 (x 420–440).
- **Vents:** party room 1 ↔ 2 at (496, 90–98), and party room 2 ↔ 3 at
  (496, 160–168).
- **Slides:** the two open slides start here at (200, 150) and (262, 150).
- `ItemSpawn`: (60, 200), (496, 60), (280, 90). `FightSpawn`: (496, 200),
  (180, 60), (60, 150).

## Floor 3 (Y = 48), big version only

| Zone | Area | Notes | Tags |
|---|---|---|---|
| Play structure, level 3 | x 180–380, z 40–140 | The top: tube maze, net walkway, lookout windows. Reached only by nets and ladders from level 2. | `Climbable`, `CrawlTube` |
| Spiral slide entrance | x 350–380, z 50–80 | The giant tube slide spirals down through the structure into the big ball pit. | `Slide` |
| Roof of the structure | x 140–420, z 20–160, above Y 70 | Blocked. | `NoGo` |

- `ItemSpawn`: (230, 90). `FightSpawn`: (300, 110).

## Everywhere

- **Walls** 76 studs tall. **South wall windows** look out on a night
  parking lot.
- **Lights** are tagged `DimmableLight` in every area, for the lighting
  variation.
- Closed-for-the-night details: chairs flipped up on tables, mop buckets and
  wet floor signs (decoration only), a lost and found.
- Each ball pit has its own color theme.

## How Claude Code should build the greybox

1. Write a script the owner pastes into Studio's **command bar** (or a
   one-off plugin) that builds the map from this file as simple, anchored
   parts: floors, walls, the structure's levels, ramps for stairs and slides,
   and invisible zone parts for ball pits, the info desk and spawns.
2. Put everything in one model, `PlayPlace_Big`, inside `ServerStorage.Maps`,
   with every part tagged as listed above. Then make `PlayPlace_Small` by
   copying it and closing off floor 3.
3. The map lives in the place file, not in this repo (Rojo only syncs code).
   The owner replaces the grey blocks with real art over time, keeping the
   tags.
