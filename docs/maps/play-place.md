# Map spec: Indoor play place (v2)

Layout for the main map, modelled on how Goofy Gorillas' play place feels:
one **huge, connected play structure** made of netted cubes, with several
towers joined by bridges, net tunnels and crawl tubes, lots of slides, ball
pits built into its base, and openings on every side. The pictures show it;
this file has the exact numbers so Claude Code can build a greybox version
(simple blocks with the right tags) that the owner then decorates in Studio.

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
- **Y** is height: ground 0, floor 2 at 24, floor 3 at 48, ceiling at 76.
- Zones are written as `x1–x2, z1–z2`. Points as `(x, z)`.
- The **office doors** are on the **south wall** (Z = 360) at X 20–60.
- **Small version** (2 to 14 players): the same building with **floor 3
  closed off** (netting over the ways up from floor 2 and a "closed" sign).

## The play structure

A **horseshoe of three wings** wrapped around the **hub** (the open court
with the info desk). Every wing is built from **12-stud netted cubes**
stacked into levels, with padded poles at the corners, cargo nets on the
hub-facing sides, ladders and ramps inside, and net doors on every side.

| Wing | Area | Levels | Inside |
|---|---|---|---|
| West wing | x 80–150, z 30–160 at ground; x 80–150, z 30–250 at level 2 (level 2 extends over the snack bar) | 3 (level 3 is the west tower, below) | Ground: **net maze** (x 86–144, z 70–140). Level 2: **spider web nets** (x 86–144, z 150–210). |
| North wing | x 150–410, z 30–110 | 3 (tallest) | Ground: **big ball pit** (x 298–398, z 38–104) and the **roller ramp** up to level 2 (x 160–230, z 58–80). Level 2: **punching bag alley** (x 240–320, z 40–100). Level 3: **tube maze and lookout windows** (x 170–390, z 30–100). |
| East wing | x 410–480, z 30–230 | 2 | Ground: **crawl tube tunnels** (x 416–474, z 120–190). Level 2: **wobble deck** (x 416–474, z 60–130). |
| West tower | x 80–150, z 30–100 at level 3 | top only | **Lookout**, reached from the west wing's level 2. |

**Ways into the structure from the ground** (net doors): (150, 60),
(150, 135), (80, 120), (190, 110), (270, 110), (410, 140), (410, 70),
(445, 230), (480, 100).

### Slides and poles (all one way, down)

| # | Slide | From | To |
|---|---|---|---|
| 1 | **Giant spiral tube slide** | North wing level 3, entrance x 350–380, z 42–72 | Big ball pit (ground) |
| 2 | **Wavy tube slide** | East wing level 2 at (440, 232) | Small ball pit (ground), landing at (362, 276) |
| 3–4 | **Two open slides** | West wing level 2, south edge at (95, 250) and (130, 250) | Ground at (95, 263) and (130, 263), between the snack bar and the arcade |
| 5 | **Drop slide** (steep) | North wing level 2, south edge at (250, 110) | The hub at (250, 130) |
| 6 | **Tiny corkscrew slide** | A low platform inside the toddler zone | Toddler zone floor |

| Fire pole | From | To |
|---|---|---|
| North pole | North wing level 3 at (210, 92) | The hub at (210, 114), straight through level 2 |
| East pole | East wing level 2 at (412, 238) | Ground at (412, 238) |

### Crossings and links

| Level | Link | Between |
|---|---|---|
| 2 | **Wobbly rope bridge** over the hub | West wing (150, 148) ↔ east wing (410, 148) |
| 2 | **Net tunnel** over the hub | West wing (150, 228) ↔ east wing (410, 228) |
| 2 | **Crawl tube** | East wing (480, 129) → straight into party room 2 (500, 129) |
| 2 | Net doors | West balcony ↔ west wing along x = 80; east wing ↔ east balcony along x = 480 |
| 3 | **Crawl tube** | West tower (150, 60) ↔ north wing level 3 (170, 60) |

With both hub crossings you can **loop all the way around the hub at level
2**, and every wing connects to the others and to both balconies.

## Ground floor (Y = 0)

| Zone | Area | Notes | Tags |
|---|---|---|---|
| Maintenance hallway | x 5–555, z 5–23 | Staff only, runs behind everything. Door to storage at (500, 23). | `Door` |
| Kitchen | x 5–55, z 140–250 | Staff only. Door to the snack bar at (55, 205). | `Door` |
| West stairs | x 15–55, z 100–134 | Up to the west balcony. | |
| Snack bar counter | x 58–66, z 165–250 | Hide behind it. | |
| Snack bar seating | x 68–150, z 165–250 | Tables with tablecloths, chairs flipped up, **under the west wing's level 2**. | `HideTable` |
| The hub | x 150–410, z 110–260 | Open court in the middle; the rope bridge and net tunnel pass overhead. | |
| Info desk | circle, center (280, 180), radius 12 | Seekers wait here blind. | `SeekerStart` |
| Storage | x 490–555, z 30–120 | Staff only. Door to the floor at (520, 120). | `Door` |
| East stairs | x 495–535, z 190–235 | Up to the east balcony. | |
| Entrance hall | x 20–60, z 270–358 | Cubbies, shoe racks, sign-in desk. | `EntranceSpawn` |
| Arcade | x 70–235, z 270–350 | Rows of machines. | `ArcadeMachine` |
| Prize counter | x 238–272, z 270–350 | Glass cases of plushies. | |
| Small ball pit | x 290–390, z 275–345 | The wavy tube slide lands here. | `BallPit`, `BallPitBalls` |
| Toddler zone | x 410–555, z 260–350 | Soft play, about 20 foam blocks, tiny corkscrew slide. | `FoamBlock` |

The big ball pit (in the north wing) has its floor sunk 4 studs. Tags:
`BallPit`, `BallPitBalls`.

**Vents** (`Vent`, crouch only): kitchen (30, 140) ↔ maintenance hallway
(30, 23); storage (540, 120) ↔ toddler zone (540, 260).

**Spawn points**

| Tag | Positions (x, z) |
|---|---|
| `EntranceSpawn` | Around (40, 340) |
| `SeekerSpawn` | (240, 150), (320, 150), (240, 215), (320, 215) |
| `ItemSpawn` | (110, 205), (285, 245), (455, 250), (200, 300), (520, 160) |
| `FightSpawn` | (115, 50), (380, 150), (340, 320), (500, 300) |

**Cleaning robot** (`RobotPath`): loops around the hub and between both
ball pits: (220, 250) → (400, 250) → (400, 270) → (290, 270) → (220, 250).

## Floor 2 (Y = 24)

| Zone | Area | Notes | Tags |
|---|---|---|---|
| West balcony | x 0–80, z 100–260 | Over the kitchen. Lost and found. Railing on the open sides. | |
| West wing, level 2 | x 80–150, z 30–250 | Spider web nets. Two open slides from its south edge. | `Climbable` |
| North wing, level 2 | x 150–410, z 30–110 | Punching bag alley, roller ramp top, drop slide. | `Climbable` |
| East wing, level 2 | x 410–480, z 30–230 | Wobble deck, wavy tube slide, east pole. | `Climbable` |
| East balcony | x 480–560, z 20–250 | Walkway at x 480–500 in front of the party rooms. | |
| Party room 1 | x 500–552, z 28–90 | Stage, balloons. Door at (500, 59). | `Door`, `Balloon` |
| Party room 2 | x 500–552, z 98–160 | Tables, cake. Door at (500, 150); the crawl tube from the east wing enters at (500, 129). | `Door`, `HideTable` |
| Party room 3 | x 500–552, z 168–230 | Tables, gifts. Door at (500, 199). | `Door`, `HideTable` |

- **Vents:** party rooms 1 ↔ 2 at (526, 90–98) and 2 ↔ 3 at (526, 160–168).
- `ItemSpawn`: (40, 200), (280, 70), (445, 100), (526, 60).
- `FightSpawn`: (115, 110), (445, 190), (526, 200).

## Floor 3 (Y = 48), big version only

| Zone | Area | Notes | Tags |
|---|---|---|---|
| West tower, level 3 | x 80–150, z 30–100 | Lookout. | `Climbable` |
| North wing, level 3 | x 170–390, z 30–100 | Tube maze, lookout windows, the north pole down. | `Climbable`, `CrawlTube` |
| Spiral slide entrance | x 350–380, z 42–72 | Down into the big ball pit. | `Slide` |
| Roofs | x 76–394, z 22–108, above Y 70 | Blocked. | `NoGo` |

- `ItemSpawn`: (115, 75). `FightSpawn`: (260, 75).

## Everywhere

- **Walls** 76 studs tall. **South wall windows** show a night parking lot.
- **Lights** tagged `DimmableLight` in every area, for the lighting
  variation. Hanging warehouse lamps and roof trusses above the structure.
- Closed-for-the-night details: chairs flipped up on tables, mop buckets and
  wet floor signs (decoration only), a lost and found.
- Each ball pit has its own color theme.

## How Claude Code should build the greybox

1. Write a script the owner pastes into Studio's **command bar** (or a
   one-off plugin) that builds the map from this file as simple, anchored
   parts: floors, walls, the structure wings as stacked 12-stud cubes with
   net walls, ramps for stairs and slides (slide paths can be simple
   ramps or curved segments for now), bridges, tubes, and invisible zone
   parts for ball pits, the info desk and spawns.
2. Put everything in one model, `PlayPlace_Big`, inside `ServerStorage.Maps`,
   with every part tagged as listed above. Then make `PlayPlace_Small` by
   copying it and closing off floor 3.
3. The map lives in the place file, not in this repo (Rojo only syncs code).
   The owner replaces the grey blocks with real art over time, keeping the
   tags.
