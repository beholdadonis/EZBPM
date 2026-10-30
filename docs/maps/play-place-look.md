# How the play place should look

`play-place.md` says **where** everything goes. This file says **what it
looks like**: materials, colors, lighting and props for every area, so
Claude can turn the grey blocks into the real map.

All colors and numbers here are **(suggested)**. Change them freely, but
keep this file in sync.

## Start with the Goofy Gorillas pictures

Our play place is inspired by the map in **Goofy Gorillas**. Before
building, download its screenshots and look through them all:

```
bash docs/reference/get-goofy-gorillas-screenshots.sh
```

That saves 53 pictures to `docs/reference/goofy-gorillas/`.
`docs/reference/goofy-gorillas.md` says what each one shows. The numbers in
brackets below, like **[01]**, are those pictures.

**Take from Goofy Gorillas:**

1. **One giant play structure that fills the building** and towers over
   the players: cube after cube of nets, stacked several levels high, with
   tube slides wrapped around it **[01] [02] [03] [06]**.
2. **Everything is see-through.** Net walls mean you can spot someone two
   levels up or across the room, which makes hide and seek tense
   **[14] [17] [18]**.
3. **Connected in many ways:** tubes, walkways, ramps, slides and openings
   on every side, so there's always another way out **[03] [08] [23] [24]**.
4. **A dark building lit by colored light**, like it's after closing time
   **[01] [51] [70] [72]**.
5. **A busy, cluttered ground floor:** tables, toy cars, foam mats,
   counters and signs, so there's always something to hide behind
   **[05] [41] [44] [63]**.
6. **Chunky, soft, rounded shapes:** padded posts, padded floors, fat
   tubes **[10] [11] [13]**.

**Never copy:** their logos, wall signs and slogans (their brand name is on
walls in several pictures), their mascot, their characters or their exact
layout. Our play place has **no brand or mascot** (design doc 9.1). Our
layout is `play-place.md`.

**Where we're different on purpose:**
- Goofy Gorillas floods most areas with pink and magenta light. **We
  don't**: seekers have a hot pink tint, so the map keeps pink for small
  accents only. Otherwise seekers would blend in (see Colors).
- Each wing of our structure has **its own color** so players can call out
  where someone is ("he's in the orange wing!").

## Overall style

- **A real indoor play place after closing time.** Realistic-ish with a
  tiny bit of cartoon (design doc 9): clean shapes, slightly oversized and
  soft, bright plastic colors, no grime.
- **Kid-sized world, R6 players.** An R6 avatar is about 5 studs tall, and
  the structure is built from 12-stud cubes, so players feel small inside
  it, like kids in a real play gym.
- **The structure is the hero.** Keep the building itself dark and plain
  (dark walls, black ceiling) so the colorful structure pops.

## Colors

**Rules:**
- **Hot pink `#FF3D9A` and teal `#2EE6D6` belong to seekers and hiders.**
  On the map, use them only for small accents (a sign, a cup, a ball in the
  pit). Never for big floors, walls, structure frames or lights.
- Each wing has its own frame color and pad color.
- Nets are always dark so they read as see-through.

| Part | Color | Hex |
|---|---|---|
| West wing and west tower frame | Orange | `#FF8C32` |
| West wing pads and kick panels | Navy | `#2C3E8C` |
| North wing frame | Royal blue | `#3D6BFF` |
| North wing pads and kick panels | Sunshine yellow | `#FFD23F` |
| East wing frame | Lime | `#8EDB3C` |
| East wing pads and kick panels | Purple | `#7B4DFF` |
| All nets | Charcoal | `#2A2C38` |
| Rope bridge and net tunnel ropes | Yellow | `#FFD23F` |
| Rope bridge planks | Light wood | Wood material |
| Lower walls (painted block) | Dark slate blue | `#3A3F55` |
| Upper walls (metal) | Very dark gray | `#23252F` |
| Ceiling | Near black | `#121218` |
| Roof trusses | Dark steel | `#4A4E5A` |
| Carpet base | Dark navy | `#161A33` |

| Slide | Color |
|---|---|
| Giant spiral tube slide | Purple `#7B4DFF`, slightly see-through |
| Wavy tube slide | Royal blue `#3D6BFF`, slightly see-through |
| Two open slides | Yellow `#FFD23F` and orange `#FF8C32` |
| Drop slide | Red `#E8413C` |
| Tiny toddler corkscrew | Lime `#8EDB3C` |

| Ball pit | Ball colors |
|---|---|
| Big ball pit (north wing) | Classic: red, blue, yellow, green |
| Small ball pit (south side) | Neon: purple, lime, orange, white |

## The building

| Part | Look |
|---|---|
| Walls | Lower 12 studs: painted concrete block (Concrete material, dark slate blue). Above that: dark corrugated metal (Metal material) up to the ceiling at Y 76. |
| Ceiling | Near black, with **steel roof trusses** every 40 studs running north to south, air ducts, and **round hanging warehouse lamps** **[01] [03] [07]**. |
| South wall | Tall windows looking out on a **night parking lot**: dark sky, streetlights, two or three parked cars. Always night (design doc 9.4). |
| Wall details | Exit signs (green), fire extinguishers, rule posters ("Socks only in the play area", "No climbing on the outside of the nets"), a big height chart ("You must be THIS short to play"), murals of simple shapes in the wing colors. |

**Important:** build the roof trusses from normal Parts, **not TrussParts**.
TrussParts are climbable in Roblox, and players must not reach the roof.

## Floors

| Where | Floor |
|---|---|
| Hub, arcade, entrance hall, balconies | **Dark navy carpet with an original confetti pattern** (squiggles, zigzags and dots in yellow, orange, purple, lime and white) **[45] [63]**. Placeholder: Fabric material, dark navy. |
| Snack bar seating | **Black and white checkerboard** tiles, 4-stud squares **[05] [40]**. |
| Toddler zone and party rooms | **Big foam puzzle mats**, 8-stud tiles in two alternating colors (each party room its own pair) **[41] [52]**. |
| Inside the structure | **Padded vinyl** in the wing's pad color (SmoothPlastic), with a thin seam line every 12 studs **[10] [22]**. |
| Kitchen, storage, maintenance hallway | Plain gray concrete, yellow and black hazard tape at doorways. |
| Stairs | Metal steps (DiamondPlate material), padded handrails. They're loud on purpose. |

## The play structure

This is the part to get right. Look at **[01] [02] [03] [04] [14]** before
starting.

**Build it from one cube kit.** Make one 12 × 12 × 12 stud cube model and
clone it everywhere. The kit:

- **Posts:** round padded posts (cylinders about 1.6 studs wide) at every
  corner, in the wing's frame color, with a darker foam ring every 4 studs.
- **Beams:** padded beams along the top edges, same color.
- **Deck:** a padded floor (pad color) where the cube has a floor.
- **Net panels:** the sides. A dark, mostly see-through panel. Final look:
  a Texture with a net picture on both faces. Until the owner uploads one,
  use a charcoal part at Transparency 0.75. Nets **block players** (they're
  walls) but **never block sight**.
- **Kick panels:** a solid 2-stud-tall strip at the bottom of each net
  wall, in the pad color, some with round porthole windows.
- **Openings:** some sides open, or with a **net door**: a gap with soft
  hanging strips (decoration, no collision) like a car wash curtain.

**Levels.** Each floor of the building is 24 studs tall, so each level of
the structure is **two cubes tall**. The lower cube has the full padded
deck. The upper cube has **partial decks, ladders, cargo nets and crawl
spaces**, not a full floor, so the inside never looks like an empty cage
and there are more nooks to hide in **[13] [14] [15]**.

**Ways up:** cargo nets (thick rope nets in the wing's frame color, tagged
`Climbable`), padded ladders, padded steps **[13]**, and the roller ramp.

**Roofs:** each wing's top is covered by **colored canopy roofs** (low
pyramids in the wing's frame color) above Y 70, tagged `NoGo`.

**Named play areas** (positions in `play-place.md`):

| Area | Look |
|---|---|
| Net maze | A grid of net walls with dead ends, inside the west wing's ground level. |
| Spider web nets | Rope webs stretched at angles between posts that you weave through. |
| Roller ramp | A wide ramp up to level 2 covered in rows of padded rollers. |
| Punching bag alley | Rows of tall padded cylinders hanging from the beams. You squeeze between them; they're great to hide behind. |
| Wobble deck | Padded floor tiles at slightly different heights, with hazard stripe edges **[43]**. |
| Crawl tube tunnels | Fat plastic tubes snaking through the east wing's ground level, with bubble windows **[24]**. |
| Tube maze and lookouts | Crawl tubes on level 3 ending in **clear plastic bubble windows** that look down over the hub. |

**Under the structure:** low, dim spaces with padded floors and posts,
perfect for hiding **[48]**.

## Slides, tubes, poles and crossings

| Piece | Look |
|---|---|
| Tube slides | Fat glossy plastic tubes (SmoothPlastic, a little Reflectance), in their slide color, slightly see-through (Transparency about 0.3) so you can glimpse someone sliding **[01] [06] [34]**. Each ends with a short flat run-out onto a padded mat or into a ball pit **[33]**. |
| Open slides | Wide glossy chutes with raised sides. |
| Crawl tubes | Plastic tubes just big enough for a crouching player (about 4 studs inside), with round bubble windows every 12 studs **[10] [24]**. |
| Fire poles | Shiny metal poles (Metal material) with a padded ring around the bottom. |
| Rope bridge over the hub | Light wood planks on yellow ropes, net sides, a slight sag in the middle. |
| Net tunnel over the hub | A padded walkway wrapped in a tube of yellow-rope netting. |

## Ball pits

- Sunken padded pits with padded edges and nets around them, the deep part
  always full of balls (design doc 9.4) **[02] [06] [36]**.
- Balls about 1.2 studs across, in the pit's color theme.
- A soft spotlight pointing down into each pit so it glows.
- Leave a few balls spilled on the floor around each pit **[35]**.

## Every area

| Area | Look and props |
|---|---|
| Entrance hall | Wooden cubbies with a few forgotten little shoes, shoe racks, a sign-in desk with a computer, a bell and rolls of wristbands. Rules board. A "Welcome! Please take off your shoes" sign. |
| Hub | Open carpet floor, a few toy ride-on cars **[41] [44]**, a giant floor game with big plastic discs **[42]**, soft benches. The rope bridge and net tunnel pass overhead. |
| Info desk | A round staff desk: light wood sides, white top, a monitor, a microphone, a lost-items box, a desk lamp. A big round light hanging above it. |
| Snack bar | A long counter with a menu board (pizza, fries, slushies), a slushie machine, a glowing drinks fridge **[60] [61]**, napkin holders. Tables with tablecloths and **chairs flipped up on them** (design doc), checkerboard floor **[63]**. It sits under the west wing's level 2, so the ceiling here is the padded underside of the structure. |
| Kitchen (staff) | Steel counters, a fryer, tall fridges, shelves of boxes. Brighter, colder white light **[62]**. |
| Arcade | Rows of cabinets (tagged `ArcadeMachine`) with glowing screens, a claw machine, tickets on the floor. |
| Prize counter | Glass cases (Glass material) full of plushies and toys, a wall of prizes behind. |
| Small ball pit | The neon pit, where the wavy tube slide lands. |
| Toddler zone | Low padded walls, foam puzzle mats, about 20 foam blocks in primary colors (`FoamBlock`), soft ramps and steps, the tiny corkscrew slide **[41] [43] [52]**. |
| Storage (staff) | Metal shelves of boxes, net bags of spare balls, cleaning supplies, mop buckets. |
| Maintenance hallway (staff) | Narrow, pipes along the walls, fuse boxes, single dim bulbs. |
| Stairs | Metal stairs with padded rails. |
| West balcony | Railing looking down over the snack bar, the **lost and found** (a bin of forgotten shoes, a teddy bear, a sock). |
| East balcony and party rooms | Each party room has its own color pair, bunting flags and a "HAPPY BIRTHDAY" banner. Room 1: a little stage with a curtain and balloons. Room 2: tables, a big cake. Room 3: tables, a pile of gifts **[49]**. |
| Vents | Grilles near the floor; inside, dark metal ducts. |

**Everywhere:** wet floor signs and mop buckets (decoration only)
**[20] [62]**, a few cones, scattered balls.

## Lighting

**Roblox Lighting settings (suggested starting point):**

| Setting | Value |
|---|---|
| `Lighting.Technology` | Future |
| `Lighting.ClockTime` | 0 (midnight, so it's night outside) |
| `Lighting.Brightness` | 1 |
| `Lighting.Ambient` | `#1A1530` |
| `Lighting.OutdoorAmbient` | `#0E1022` |
| `Lighting.EnvironmentDiffuseScale` | 0.2 |
| `Lighting.EnvironmentSpecularScale` | 0.3 |
| `BloomEffect` | Intensity 0.6, Size 24, Threshold 1.4 |
| `ColorCorrectionEffect` | Saturation 0.15, Contrast 0.05 |
| `Atmosphere` | Density 0.2 (a slight haze for depth) |

**Light layers:**
1. **Warm white overhead lamps** (`#FFE3B8`) over the hub, snack bar,
   arcade and entrance. These do most of the lighting. Only these cast
   shadows.
2. **Colored uplights** washing the walls and ceiling in purple
   (`#7B4DFF`) and blue (`#3D6BFF`) **[51]**.
3. **Thin glowing strips** (Neon material) along the edge of every
   structure deck, in the wing's frame color, so you can always see the
   shape of the structure, even in the dark **[01]**.
4. **Glowing signs:** exit signs, the snack bar menu, the arcade sign,
   party room signs. Original wording only **[71]**.
5. A spotlight down into each ball pit.

**Rules:**
- Hide and seek is played in first person, so **a player standing in the
  open must always be visible from about 40 studs away**. Hiding spots
  inside the structure can be dim, but never pitch black.
- Never very dark or very bright (design doc 5).
- Tag every light `DimmableLight`. In the "some lights off" variation,
  some lights dim and some flicker **[70]**. The structure's glowing strips
  stay on so players can always find their way.

## Performance (30 players, phones and consoles)

- Clone the **cube kit** instead of building each cube by hand.
- **Anchor** everything that doesn't move.
- On decoration players don't touch, turn off `CanCollide`, `CanTouch`
  and `CanQuery`. On small props, turn off `CastShadow`.
- Use Textures for patterns (carpet, nets) instead of many small parts.
- Keep shadow-casting lights to about 20 (the big overhead lamps); every
  other light has `Shadows` off.
- StreamingEnabled stays on.
- Aim for **under about 20,000 parts** for the big version.

## How to organize it in Studio

Inside `ServerStorage.Maps.PlayPlace_Big`:

| Folder | Holds |
|---|---|
| `Shell` | Walls, ceiling, trusses, windows, parking lot |
| `Floors` | Carpet, tiles, mats |
| `Structure` | One model per wing (`WestWing`, `NorthWing`, `EastWing`, `WestTower`) |
| `Slides` | Slides, poles, crawl tubes, bridge, net tunnel |
| `Areas` | One model per area (`SnackBar`, `Arcade`, `ToddlerZone`, ...) |
| `Lights` | All lights |
| `Markers` | Invisible tagged parts: spawns, zones, robot path |

## Order to build it

Build in this order and **stop after each step** so the owner can look
around in Studio:

1. **Greybox** from `play-place.md` (if it isn't built yet).
2. **Building and floors:** walls, ceiling, trusses, windows, carpet,
   tiles, mats.
3. **The cube kit**, then the three wings and the west tower.
4. **Slides, tubes, poles, the rope bridge and the net tunnel.**
5. **Areas**, one at a time: ball pits, snack bar, arcade, prize counter,
   toddler zone, party rooms, staff areas, entrance hall, info desk.
6. **Lighting.**
7. **Details:** signs, wet floor signs, spilled balls, lost and found.

Keep every tag from `play-place.md` on the finished parts.
