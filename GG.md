# GG.md: the build guide

Everything two Claudes need to build this game:

- **Normal Claude**: Claude connected to **Roblox Studio** (through Roblox's
  Studio MCP). It builds what you can see in Studio: the maps, props,
  models, lighting and UI screens.
- **Claude Code**: Claude working in this repo. It writes the code (Luau
  scripts in `src/`) that makes everything work.

All numbers, sizes and colors here are **(suggested)** unless
`docs/GAME_DESIGN.md` says otherwise. The owner can change any of them.

## Trigger words

### `claudereadgg` (normal Claude)

When the owner says **claudereadgg**:

1. Read **this entire file**, top to bottom. Don't skim.
2. Look at every picture you've been given (floor plans, UI mockups,
   Goofy Gorillas screenshots).
3. Reply with:
   - a short summary of the game and your job (5 lines at most),
   - anything you're missing (a picture you don't have, Studio not
     connected),
   - this menu, and ask the owner **what to begin with**:
     1. Office lobby (Part 4)
     2. Play place greybox (Part 3, step 1)
     3. Play place, next build step (Part 3, steps 2 to 8)
     4. Squeaky hammer (Part 5)
     5. Other models: items, weapons, map pieces (Part 5)
     6. UI screens, one at a time (Part 6)
     7. Sounds (Part 5)
4. **Don't build anything until the owner picks.** Then do only that, follow
   Part 2's rules, and stop when it's done so the owner can look at it.

### `codereadgg` (Claude Code)

When the owner says **codereadgg**:

1. Read **this entire file**, plus `CLAUDE.md` and `docs/GAME_DESIGN.md`.
2. **Only do coding work** (Part 7). Never build maps, props, models,
   lighting or UI layouts by hand; those are normal Claude's job.
3. Reply with a short summary and the list of coding jobs that are ready
   (in milestone order), and ask the owner which to begin with.

### Who does what

| Job | Who |
|---|---|
| Maps: greybox, structure, props, lighting, tags | Normal Claude |
| Models: squeaky hammer, items, weapons, robot, map pieces | Normal Claude |
| UI screens: the layouts you see (matching the mockups) | Normal Claude |
| Picking sounds from the Toolbox | Normal Claude |
| Everything that *happens*: rounds, modes, movement, hits, items working, UI updating, saving, shop | Claude Code |

They meet in the middle through **names, folders and tags** (Part 2.6 and
Part 6). Stick to those exactly, or the code won't find what was built.

---

# Part 1: The game in one minute

A goofy Roblox party game for up to 30 players, set in giant indoor play
places at night. Players run, slide, climb and flashstep through huge
multi-level jungle gyms. Launch modes: **hide and seek** (seekers bonk
hiders with a squeaky hammer; bonked hiders become seekers) and
**fighting** (free for all, one-hit KOs with boxing gloves, dodgeballs and
hammers). Players wait in an **office lobby** between matches. It should
feel **tense but funny**.

Inspired by the Steam game **Goofy Gorillas**, but **fully original**:
nothing is copied from it. Full rules: `docs/GAME_DESIGN.md`.

---

# Part 2: Building rules (every Studio build)

These apply to **everything** normal Claude builds. Breaking them means the
job isn't done.

## 2.1 No z-fighting

Z-fighting is the flicker you get when two surfaces sit in exactly the
same spot.

- **Never let two faces lie in the same plane and overlap.** Classic
  mistakes: a floor laid on top of another floor at the same height, a
  sign flush inside a wall, two wall parts overlapping.
- **Layers sit on top, with a gap:** rugs, mats and floor overlays sit
  **0.1 studs** above the floor under them. Signs, posters and wall decor
  sit **0.05 studs** out from the wall.
- **Where parts meet,** either butt them edge to edge, or push one clearly
  inside the other (at least 0.1 studs). Never leave equal faces.
- Prefer a **Texture or Decal** over stacking a thin part on another part.
- **Check:** fly the camera close to every floor, wall and tabletop at a
  low angle. Any flicker is z-fighting. Fix it.

## 2.2 No floating parts

- **Every prop rests on something:** its bottom sits exactly on the floor
  (or tabletop, or shelf) under it. No gaps under legs, no cups hovering
  over tables.
- **Floor tops are at exact heights:** ground Y = 0, floor 2 Y = 24, floor 3
  Y = 48. Floor parts sit below those numbers (a ground floor part goes from
  Y = −1 to Y = 0).
- **Hanging things show what holds them:** lamps have a cable or rod to a
  truss or the ceiling, signs have brackets or chains, banners are tied at
  both ends.
- **Wall things touch the wall:** their back is 0.05 studs from the wall
  surface (see 2.1), never floating out in the air.
- **Run the floating checker** (2.8) after every build step.

## 2.3 Everything blends in

The map should look like one real place, built by one team.

- **One style:** realistic-ish with a tiny bit of cartoon; soft, rounded,
  chunky shapes; clean plastic colors; no grime.
- **Colors from the palettes** in Part 3.4. No leftover default gray
  plastic. No random colors.
- **Same materials for the same things** everywhere (all padding the same
  material, all metal the same material).
- **Clean joints:** where a post meets a beam or the floor, hide the seam
  with a collar, foam ring or base plate. Nothing sticks through walls,
  floors or ceilings where it can be seen.
- **Neat and lined up:** use Studio's snapping (Move 0.25 studs, Rotate 15°)
  so rows of tables, cabinets and posts line up. No random little
  rotations unless something is meant to look knocked over.
- **Textures at a matching scale** (`StudsPerTileU/V` the same for the same
  material).
- **Look at it from player height** (an R6 dummy's eye level, about 4.5
  studs up), not just from above.

## 2.4 If it's ugly, replace it

If something you built looks bad (blocky where it should be round, too
simple, out of style), **don't leave it**. Swap it for a better model from
the **Toolbox** (Creator Store):

1. Search the Toolbox's **Models**. Prefer well-rated models with few
   parts.
2. Insert it into an empty Folder first and look at what's inside.
3. **Delete every script inside it** (free models can hide harmful
   scripts). Run this in the command bar with the model selected:
   ```lua
   for _, d in game.Selection:Get()[1]:GetDescendants() do
   	if d:IsA("LuaSourceContainer") then
   		print("Removed script:", d:GetFullName())
   		d:Destroy()
   	end
   end
   ```
4. **Resize it to the R6 size chart** (2.5). Use the Scale tool, or
   `Model:ScaleTo()`.
5. **Recolor it** to our palette and change materials to match ours.
6. **Anchor** it, set its collisions (2.7) and add any tags it needs.
7. **No real brands, logos or famous characters** (no soda brands on
   fridges, no cartoon characters on plushies). Swap or remove them.
8. Tell the owner which Toolbox models you used.

## 2.5 Scale everything to R6 players

Players are **R6 avatars: about 5 studs tall, 2 wide (4 with arms), 1
deep**. They see from about 4.5 studs up. Crouching, they're about 3 studs
tall. **Toolbox models are often far too small for R6.** Before placing
anything, put an **R6 dummy** next to it (Avatar tab → Rig Builder → R6) and
check it against this chart. Delete the dummy when done.

| Thing | Size in studs (width × depth × height) |
|---|---|
| R6 player | 2 (4 with arms) × 1 × 5 |
| Door (rooms) | 6 wide × 9 tall |
| Office double doors | two 8 × 12 doors |
| Net door in the structure | 6 wide × 8 tall opening |
| Hiding table (`HideTable`) | top 8 × 5 (party tables 28 × 5), **top at 3.5 high** so a crouching player fits under |
| Tablecloth | hangs to 0.8 above the floor; the hanging sides don't collide |
| Chair | seat 2.5 × 2.5 at 2 high, back up to 5 |
| Counter (snack bar, info desk, prize cases) | 4 high |
| Arcade cabinet | 4 × 4 × 8 |
| Claw machine | 5 × 5 × 9 |
| Drinks fridge | 4 × 3 × 9 |
| Vending machine (office) | 5 × 4 × 10 |
| Locker (office) | 2.5 × 2.5 × 8 each |
| Shelves | 2 deep × 8 tall, any length |
| Cubbies | 3 deep × 8 tall, 2.5-stud cells |
| Bench | 10 long × 2.5 deep, seat 2 high |
| Stairs | steps 1 high; an invisible wedge ramp under the steps so walking up is smooth |
| Railings | 3.5 high |
| Crawl tube | 4 across inside |
| Vent opening | 4 × 4 |
| Foam block | 4 × 4 × 4 |
| Ball pit ball | 1.2 across |
| Toy ride-on car | 4.5 long × 3 wide × 3.5 tall |
| Wet floor sign | 1.5 × 1 × 3.5 |
| Mop bucket | 1.8 × 1.8 × 1.8, mop handle 5 |
| Party balloon | 2 across, 4-stud string |
| Plushies | 1.5 to 3; giant ones 8 |
| Cups, plates, napkins | 0.5 to 1 (never smaller than 0.4) |
| TV (office) | 16 × 9 |

## 2.6 Where things go, and what they're called

Code finds things by these **exact names and folders**, and map pieces by
**tags** (`docs/GAME_DESIGN.md`, "How code finds map pieces"). Put
everything here:

| What | Where in Studio |
|---|---|
| The office lobby | `Workspace.Office` (always there) |
| Maps | `ServerStorage.Maps.PlayPlace_Big` and `ServerStorage.Maps.PlayPlace_Small` (later `TrampolinePark_Big`, ...) |
| Tools (things players hold) | `ReplicatedStorage.Assets.Tools` |
| Items (things players drop) | `ReplicatedStorage.Assets.Items` |
| Map pieces code spawns | `ReplicatedStorage.Assets.MapPieces` |
| Effects | `ReplicatedStorage.Assets.Effects` |
| Sounds | `ReplicatedStorage.Assets.Sounds` |
| UI screens | `StarterGui` (Part 6) |

**Never put anything inside `ReplicatedStorage.Shared`,
`ServerScriptService.Server` or `StarterPlayer.StarterPlayerScripts.Client`.**
Those folders are synced from the repo and get overwritten.

**Map coordinates:** a map's north-west floor corner is its origin. Build
maps in `Workspace` with that corner at world (0, 0, 0), then move the
finished model into `ServerStorage.Maps`. Every map has its **office
doorway in the same spot** (south wall, X 20 to 60), so the office lines
up with any map.

**Inside each map model**, use these folders:

| Folder | Holds |
|---|---|
| `Shell` | Walls, ceiling, trusses, windows, parking lot |
| `Floors` | Floors, carpet, tiles, mats |
| `Structure` | One model per wing (`WestWing`, `NorthWing`, `EastWing`, `WestTower`) |
| `Slides` | Slides, poles, crawl tubes, the rope bridge, the net tunnel |
| `Areas` | One model per area (`SnackBar`, `Arcade`, `ToddlerZone`, ...) |
| `Lights` | All lights |
| `Markers` | Invisible tagged parts: spawns, zones, robot path |

**Markers:** invisible, anchored parts (`Transparency` 1) with their tag.
- **Spawn and path markers** (`EntranceSpawn`, `SeekerSpawn`,
  `FightSpawn`, `ItemSpawn`, `RobotPath`): 4 × 1 × 4, sitting on the floor,
  `CanCollide`, `CanTouch` and `CanQuery` off.
- **Zones** (`BallPit`, `SeekerStart`): `CanCollide` off, `CanTouch` and
  `CanQuery` left on (code checks who's inside).
- **`NoGo`**: `CanCollide` on, so it also physically blocks players.

## 2.7 Keep it fast (30 players, phones and consoles)

- **Build repeated things once and clone them** (one table model, one
  arcade cabinet, one structure cube kit).
- **Anchor** everything that doesn't move (foam blocks stay unanchored).
- On decoration players don't touch (cups, signs, flipped-up chairs,
  hanging strips, ceiling stuff): turn off `CanCollide`, `CanTouch` and
  `CanQuery`.
- On small props, turn off `CastShadow`.
- Use **Textures** for patterns (carpet, nets) instead of many small parts.
- Only the big overhead lamps cast shadows (about 20 lights). Every other
  light has `Shadows` off.
- **Parts or meshes?** Build with **Parts** first. Use **meshes** (made in
  Blender or found in the Toolbox) for curvy things, especially **tube
  slides**: a spiral built from parts is bumpy to slide down. Don't build
  props with **Unions**; they cost more than either.
- Aim for **under about 20,000 parts** for the big play place.

## 2.8 Check your work

After every build step:

1. **Run the floating checker** while the map is in `Workspace` (change
   `root` to the model you're checking). It lists anything touching
   nothing. Fix or remove everything it lists.
   ```lua
   local root = workspace.PlayPlace_Big
   local saved = {}
   for _, d in root:GetDescendants() do
   	if d:IsA("BasePart") then
   		saved[d] = d.CanQuery
   		d.CanQuery = true
   	end
   end
   local params = OverlapParams.new()
   params.FilterType = Enum.RaycastFilterType.Exclude
   local pad = Vector3.new(0.2, 0.2, 0.2)
   local found = 0
   local function touchesNothing(thing, cf, size)
   	params.FilterDescendantsInstances = { thing }
   	return #workspace:GetPartBoundsInBox(cf, size + pad, params) == 0
   end
   for _, d in root:GetDescendants() do
   	if d:IsA("BasePart") and d.Transparency < 1 and touchesNothing(d, d.CFrame, d.Size) then
   		found += 1
   		print("Floating part:", d:GetFullName())
   	elseif d:IsA("Model") then
   		local cf, size = d:GetBoundingBox()
   		if touchesNothing(d, cf, size) then
   			found += 1
   			print("Floating model:", d:GetFullName())
   		end
   	end
   end
   for part, value in saved do
   	part.CanQuery = value
   end
   print(found, "floating things found")
   ```
2. **Z-fighting pass:** fly close at low angles over every surface (2.1).
3. **Player-height pass:** walk around with an R6 dummy's view. Is
   everything the right size (2.5)? Does anything block paths or doorways?
4. **Ugly pass:** anything that looks cheap gets replaced (2.4).
5. **Tags pass:** every tagged piece from Part 3 is tagged.
6. Tell the owner what you built and ask them to playtest (Test tab → Play).

---

# Part 3: The play place map

## 3.1 Pictures

| Picture | Shows |
|---|---|
| `docs/maps/play-place-ground.png` | Ground floor (Y = 0) |
| `docs/maps/play-place-floor2.png` | Floor 2 (Y = 24) |
| `docs/maps/play-place-floor3.png` | Floor 3 (Y = 48), big version only |
| `docs/maps/office.png` | The office lobby (Part 4) |
| `docs/reference/goofy-gorillas/` | 53 Goofy Gorillas screenshots, listed in `docs/reference/goofy-gorillas.md` |

The Goofy Gorillas screenshots aren't stored in the repo. The owner (or
Claude Code) downloads them with
`bash docs/reference/get-goofy-gorillas-screenshots.sh`. Numbers in
brackets below, like **[01]**, are those pictures. If you can't get all of
them, these 15 matter most: 01, 02, 03, 04, 05, 06, 10, 13, 14, 17, 30, 36,
41, 43, 63.

**Use them for the feel only. Never copy** their logos, signs, slogans,
mascot, characters or exact layout. Our play place has **no brand or
mascot**.

## 3.2 Coordinates

- Units are studs. The building's **north-west corner at floor level is
  (0, 0, 0)**.
- **X** runs west to east (0 to 560). **Z** runs north to south (0 to 360).
  In the pictures, north is up.
- **Y** is height: ground 0, floor 2 at 24, floor 3 at 48, ceiling at 76.
- Areas are written `x1–x2, z1–z2`. Points are `(x, z)`.
- Area numbers are the **inside** of each room. Walls (1 stud thick) go
  just outside them. Small gaps between a room and the outer wall become
  solid wall.
- The **office doorway** is in the **south wall** (Z = 360) at X 20–60.
- **Small version** (`PlayPlace_Small`, 2 to 14 players): the same building
  with **floor 3 closed off** (net panels over every way up from floor 2,
  and a "CLOSED" sign on each).

## 3.3 Layout

### What we take from Goofy Gorillas

1. **One giant play structure that fills the building** and towers over
   the players: cube after cube of nets, stacked several levels high, with
   tube slides wrapped around it **[01] [02] [03] [06]**.
2. **Everything is see-through.** Net walls let you spot someone two
   levels up or across the room **[14] [17] [18]**.
3. **Connected in many ways:** tubes, walkways, ramps, slides and openings
   on every side **[03] [08] [23] [24]**.
4. **A dark building lit by colored light**, like after closing time
   **[01] [51] [70] [72]**.
5. **A busy ground floor:** tables, toy cars, foam mats, counters, signs
   **[05] [41] [44] [63]**.
6. **Chunky, soft, rounded shapes** **[10] [11] [13]**.

Where we're different on purpose: Goofy Gorillas floods most areas with
pink light. **We don't**, because seekers have a hot pink tint and would
blend in. And each wing of our structure has **its own color**, so players
can call out "he's in the orange wing!".

### The play structure

A **horseshoe of three wings** around the **hub** (the open court with the
info desk), plus a tower. Wings are built from **12-stud netted cubes**.
Each floor is 24 studs tall, so **each level is two cubes tall** (see 3.4).

| Wing | Area | Levels | Inside |
|---|---|---|---|
| West wing | x 80–150, z 30–160 at ground; x 80–150, z 30–250 at level 2 (level 2 reaches over the snack bar) | 3 (level 3 is the west tower) | Ground: **net maze** (x 86–144, z 70–140). Level 2: **spider web nets** (x 86–144, z 150–210). |
| North wing | x 150–410, z 30–110 | 3 (tallest) | Ground: **big ball pit** (x 298–398, z 38–104) and the **roller ramp** up to level 2 (x 160–230, z 58–80). Level 2: **punching bag alley** (x 240–320, z 40–100). Level 3: **tube maze and lookout windows** (x 170–390, z 30–100). |
| East wing | x 410–480, z 30–230 | 2 | Ground: **crawl tube tunnels** (x 416–474, z 120–190). Level 2: **wobble deck** (x 416–474, z 60–130). |
| West tower | x 80–150, z 30–100 at level 3 | top only | **Lookout**, reached from the west wing's level 2. |

**Ways into the structure from the ground** (net doors): (150, 60),
(150, 135), (80, 120), (190, 110), (210, 110), (270, 110), (410, 140),
(410, 70), (445, 230), (480, 100).

### Slides and poles (all one way, down)

| # | Slide | From | To |
|---|---|---|---|
| 1 | **Giant spiral tube slide** | North wing level 3, entrance x 350–380, z 42–72 | Big ball pit (ground) |
| 2 | **Wavy tube slide** | East wing level 2, south edge at (440, 230) | Small ball pit, landing at (362, 276) |
| 3–4 | **Two open slides** (wavy, about 45°) | West wing level 2, south edge at (95, 250) and (130, 250) | Ground at (95, 274) and (130, 274), with a flat run-out to z 278 |
| 5 | **Drop slide** (steep) | North wing level 2, south edge at (250, 110) | The hub at (250, 130) |
| 6 | **Tiny corkscrew slide** | A 6-stud platform in the toddler zone | Toddler zone floor (see 3.5) |

| Fire pole | Where | Goes |
|---|---|---|
| North pole | (210, 105) | From a small landing on level 3 (x 204–216, z 100–110) straight down through a hole in level 2 to the ground inside the north wing, which opens onto the hub through the net door at (210, 110) |
| East pole | (412, 238) | From a small landing off the east wing's level 2 south edge (x 406–418, z 230–242) down to the ground |

### Crossings and links

| Level | Link | Between |
|---|---|---|
| 2 | **Wobbly rope bridge** over the hub | West wing (150, 148) ↔ east wing (410, 148) |
| 2 | **Net tunnel** over the hub | West wing (150, 228) ↔ east wing (410, 228) |
| 2 | **Crawl tube** | East wing (480, 129) → into party room 2 (500, 129) |
| 2 | Net doors | West balcony ↔ west wing along x = 80; east wing ↔ east balcony along x = 480 |
| 3 | **Crawl tube** | West tower (150, 60) ↔ north wing level 3 (170, 60) |

With both crossings you can **loop all the way around the hub at level 2**.

### Ground floor (Y = 0)

| Area | Where | Notes | Tags |
|---|---|---|---|
| Maintenance hallway | x 5–555, z 5–23 | Staff only, runs behind everything. Ceiling at Y 14. Short doorway to storage from (500, 23) to (500, 30). | `Door` |
| Kitchen | x 5–55, z 140–250 | Staff only, ceiling at Y 14. Door to the snack bar at (55, 205). | `Door` |
| West stairs | x 15–55, z 100–134 | Rise **south**: bottom at z 100, top at z 134 on the west balcony. | |
| Snack bar counter | x 58–66, z 165–250 | Hide behind it. | |
| Snack bar seating | x 68–150, z 165–250 | Under the west wing's level 2. Tables with chairs flipped up on them. | `HideTable` |
| The hub | x 150–410, z 110–260 | Open court; the rope bridge and net tunnel pass overhead. | |
| Info desk | circle, center (280, 180), radius 12 | Seekers wait inside it, blind. | `SeekerStart` |
| Storage | x 490–555, z 30–120 | Staff only, ceiling at Y 14. Door to the floor at (520, 120). | `Door` |
| East stairs | x 495–535, z 190–235 | Rise **south**: bottom at z 190, top at z 235 on the east balcony. | |
| Entrance hall | x 20–60, z 270–358 | Its own ceiling at Y 16, so it feels like a hallway. | `EntranceSpawn` |
| Arcade | x 70–235, z 270–350 | | `ArcadeMachine` |
| Prize counter | x 238–272, z 270–350 | | |
| Small ball pit | x 290–390, z 275–345 | The wavy tube slide lands here. | `BallPit`, `BallPitBalls` |
| Toddler zone | x 410–555, z 260–350 | | `FoamBlock` |

The **big ball pit** (north wing) has its floor sunk 4 studs. Tags:
`BallPit`, `BallPitBalls`. The small ball pit is sunk 4 studs too.

**Vents** (`Vent`, crouch only): kitchen (7, 140) ↔ maintenance hallway
(7, 23), with the duct running along the west wall (x 5–9); storage
(540, 120) ↔ toddler zone (540, 260), with the duct along x 538–542. Each
duct is a sealed 4 × 4 metal box on the floor with a grille at each end;
players crawl inside it.

**Spawn points**

| Tag | Positions (x, z) |
|---|---|
| `EntranceSpawn` | Spread around (40, 340), in the clear end of the entrance hall (z 320–358) |
| `SeekerSpawn` | (240, 150), (320, 150), (240, 215), (320, 215) |
| `ItemSpawn` | (110, 205), (285, 245), (455, 250), (200, 300), (520, 160) |
| `FightSpawn` | (115, 50), (380, 150), (340, 320), (500, 300) |

**Cleaning robot path** (`RobotPath`, one marker per point): (220, 250) →
(400, 250) → (400, 270) → (290, 270) → back to (220, 250).

### Floor 2 (Y = 24)

| Area | Where | Notes | Tags |
|---|---|---|---|
| West balcony | x 0–80, z 100–260 | Over the kitchen. The west stairs come up through its north end (opening x 15–55, z 100–134). | |
| West wing, level 2 | x 80–150, z 30–250 | Spider web nets; two open slides from its south edge. | `Climbable` |
| North wing, level 2 | x 150–410, z 30–110 | Punching bag alley, roller ramp top, drop slide. | `Climbable` |
| East wing, level 2 | x 410–480, z 30–230 | Wobble deck, wavy tube slide, east pole landing. | `Climbable` |
| East balcony | x 480–560, z 20–250 | Walkway x 480–500 in front of the party rooms. The east stairs come up through an opening at x 495–535, z 220–235. | |
| Party room 1 | x 500–552, z 28–90 | Ceiling at Y 40. Door at (500, 59). | `Door`, `Balloon` |
| Party room 2 | x 500–552, z 98–160 | Ceiling at Y 40. Door at (500, 150); the crawl tube enters at (500, 129). | `Door`, `HideTable`, `Balloon` |
| Party room 3 | x 500–552, z 168–220 | Ceiling at Y 40. Door at (500, 199). | `Door`, `HideTable`, `Balloon` |

- **Vents:** party rooms 1 ↔ 2 at (526, 90–98) and 2 ↔ 3 at (526, 160–168).
- `ItemSpawn`: (40, 200), (280, 70), (445, 100), (526, 60).
- `FightSpawn`: (115, 110), (445, 190), (526, 200).

### Floor 3 (Y = 48), big version only

| Area | Where | Notes | Tags |
|---|---|---|---|
| West tower, level 3 | x 80–150, z 30–100 | Lookout. | `Climbable` |
| North wing, level 3 | x 170–390, z 30–100 | Tube maze, lookout windows, the north pole landing (x 204–216, z 100–110). | `Climbable`, `CrawlTube` |
| Spiral slide entrance | x 350–380, z 42–72 | Down into the big ball pit. | `Slide` |
| Roofs | x 76–394, z 22–108, above Y 70 | Blocked. | `NoGo` |

- `ItemSpawn`: (115, 75). `FightSpawn`: (260, 75).

Tag every slide surface `Slide`, every climbable net `Climbable`, every
crawl tube `CrawlTube`.

## 3.4 How it looks

### Overall

- **A real indoor play place after closing time.** Realistic-ish with a
  tiny bit of cartoon: clean, soft, slightly oversized shapes and bright
  plastic colors.
- **Kid-sized world:** players are R6 (5 studs) and the structure is built
  from 12-stud cubes, so players feel small inside it, like kids in a real
  play gym.
- **The structure is the hero.** Keep the building dark and plain so the
  colorful structure pops.

### Colors

**Rules:**
- **Hot pink `#FF3D9A` and teal `#2EE6D6` belong to seekers and hiders.** On
  the map, use them only for **small accents** (a sign, a cup, a ball).
  Never for big floors, walls, structure frames or lights.
- Each wing has its own frame color and pad color.
- Nets are always dark, so they read as see-through.

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

### The building

| Part | Look |
|---|---|
| Walls | Lower 12 studs: painted concrete block (Concrete material, dark slate blue). Above: dark corrugated metal (Metal material) up to the ceiling at Y 76. |
| Ceiling | Near black, with **steel roof trusses** every 40 studs running north to south, air ducts, and **round hanging warehouse lamps** **[01] [03] [07]**. |
| South wall | Tall windows onto a **night parking lot**: dark sky, streetlights, two or three parked cars. Always night. |
| Wall details | Exit signs (green), fire extinguishers, rule posters ("Socks only in the play area", "No climbing on the outside of the nets"), murals of simple shapes in the wing colors. |

**Build the roof trusses from normal Parts, not TrussParts.** TrussParts are
climbable, and players must never reach the roof.

### Floors

| Where | Floor |
|---|---|
| Hub, arcade, entrance hall, balconies | **Dark navy carpet with an original confetti pattern** (squiggles, zigzags and dots in yellow, orange, purple, lime and white) **[45] [63]**. Until there's a pattern texture: Carpet material, dark navy. |
| Snack bar seating | **Black and white checkerboard** tiles, 4-stud squares **[05] [40]** |
| Toddler zone and party rooms | **Big foam puzzle mats**, 8-stud tiles in two alternating colors (each party room its own pair) **[41] [52]** |
| Inside the structure | **Padded vinyl** in the wing's pad color, with a thin seam every 12 studs **[10] [22]** |
| Kitchen, storage, maintenance hallway | Plain gray concrete, yellow and black hazard tape at doorways |
| Stairs | Metal steps (DiamondPlate material), padded handrails. Loud on purpose. |

### The play structure

This is the part to get right. Look at **[01] [02] [03] [04] [14]** first.

**Build it from one cube kit:** one 12 × 12 × 12 cube model, cloned
everywhere.

- **Posts:** round padded posts (cylinders 1.6 across) at every corner, in
  the wing's frame color, with a darker foam ring every 4 studs.
- **Beams:** padded beams along the top edges, same color.
- **Deck:** a padded floor (pad color) where the cube has a floor.
- **Net panels:** the sides. A dark, mostly see-through panel. Final look:
  a Texture with a net picture on both faces; until the owner uploads one,
  a charcoal part at `Transparency` 0.75. Nets **block players** but
  **never block sight**.
- **Kick panels:** a solid 2-stud strip at the bottom of each net wall, in
  the pad color, some with round porthole windows.
- **Openings:** some sides open, some with a **net door** (6 × 8 gap with
  soft hanging strips that don't collide).

**Levels:** each floor level is **two cubes tall**. The lower cube has the
full padded deck. The upper cube has **partial decks, ladders, cargo nets
and crawl spaces**, not a full floor, so the inside never looks like an
empty cage **[13] [14] [15]**.

**Ways up inside:** cargo nets (thick rope nets in the frame color, tagged
`Climbable`), padded ladders, padded steps **[13]**, the roller ramp.

**Roofs:** colored canopy roofs (low pyramids in the frame color) above
Y 70, tagged `NoGo`.

**Over the snack bar,** the west wing's level 2 stands on **padded support
columns** (2 × 2, frame color) at every crossing of x = 80, 104, 128, 150
and z = 172, 196, 220, 244, instead of 12-stud posts, so the tables fit.

| Named area | Look |
|---|---|
| Net maze | A grid of net walls with dead ends. |
| Spider web nets | Rope webs stretched at angles between posts that you weave through. |
| Roller ramp | A wide ramp covered in rows of padded rollers. |
| Punching bag alley | Rows of tall padded cylinders hanging from the beams. You squeeze between them. |
| Wobble deck | Padded tiles at slightly different heights, hazard stripe edges **[43]**. |
| Crawl tube tunnels | Fat plastic tubes snaking around, with bubble windows **[24]**. |
| Tube maze and lookouts | Crawl tubes ending in **clear plastic bubble windows** looking down over the hub. |

### Slides, tubes, poles and crossings

| Piece | Look |
|---|---|
| Tube slides | Fat glossy plastic tubes, slightly see-through (`Transparency` about 0.3) **[01] [06] [34]**. Each ends in a short flat run-out onto a padded mat or into a ball pit **[33]**. |
| Open slides | Wide glossy chutes with raised sides and gentle waves. |
| Crawl tubes | Plastic tubes 4 studs across inside, with a round bubble window every 12 studs **[10] [24]**. |
| Fire poles | Shiny metal poles (Metal material) with a padded ring at the bottom. |
| Rope bridge | Light wood planks on yellow ropes, net sides, a slight sag. |
| Net tunnel | A padded walkway inside a tube of yellow-rope netting. |

### Ball pits

- Sunken pits with padded edges and nets around them; the deep part is
  always full of balls **[02] [06] [36]**.
- A soft spotlight points down into each pit so it glows.
- A few balls spilled on the floor around each pit **[35]**.

### Lighting

**Roblox Lighting settings (starting point):**

| Setting | Value |
|---|---|
| `Lighting.Technology` | Future |
| `Lighting.ClockTime` | 0 (midnight) |
| `Lighting.Brightness` | 1 |
| `Lighting.Ambient` | `#1A1530` |
| `Lighting.OutdoorAmbient` | `#0E1022` |
| `Lighting.EnvironmentDiffuseScale` | 0.2 |
| `Lighting.EnvironmentSpecularScale` | 0.3 |
| `BloomEffect` | Intensity 0.6, Size 24, Threshold 1.4 |
| `ColorCorrectionEffect` | Saturation 0.15, Contrast 0.05 |
| `Atmosphere` | Density 0.2 |

**Light layers:**
1. **Warm white overhead lamps** (`#FFE3B8`): most of the light. Only these
   cast shadows.
2. **Colored uplights** washing walls and ceiling in purple (`#7B4DFF`) and
   blue (`#3D6BFF`) **[51]**.
3. **Thin glowing strips** (Neon material) along every structure deck edge,
   in the wing's frame color, so the structure's shape is always visible
   **[01]**.
4. **Glowing signs** with original wording only **[71]**.
5. A spotlight down into each ball pit.

**Rules:**
- Hide and seek is first person, so **a player standing in the open must
  always be visible from about 40 studs**. Hiding spots can be dim, never
  pitch black.
- Never very dark or very bright.
- Tag every light `DimmableLight`. The structure's glowing strips stay on
  when other lights dim **[70]**.

## 3.5 Where every prop goes

All positions are `(x, z)` on that floor. Sizes come from 2.5. **Keep the
"keep clear" spots empty**: spawns and item spawns need room, and paths
must stay open.

### Entrance hall (x 20–60, z 270–358)

| Prop | Where | Notes |
|---|---|---|
| Cubby wall | Along the west wall, x 20–23, z 280–318 | A few little shoes in the cubbies |
| Shoe racks (2) | Along the east wall, x 57–60, z 282–298 and z 302–318 | Shoes on them |
| Sign-in desk | x 40–54, z 276–280, facing south | Monitor, bell, rolls of wristbands on top |
| Rules board | East wall at z 310, Y 6–10 | "Socks only", "Have fun!" |
| Height chart | West wall at z 322, Y 0–8 | "You must be THIS short to play" |
| Welcome sign | Over the hall's north opening at (40, 270), on the wall at Y 12 | "WELCOME! Shoes off, fun on" |
| Ceiling lights | Recessed in the hall ceiling (Y 16) every 12 studs | No shadows |

**Keep clear:** z 320–358 (where players appear).

### The hub (x 150–410, z 110–260)

| Prop | Where | Notes |
|---|---|---|
| Info desk | Ring counter around (280, 180): outer radius 12, inner radius 9, 4 high, with a 6-stud gap on the south side | Light wood sides, white top. `SeekerStart`: an invisible part filling the inside (radius 9). |
| On the desk | Monitor and keyboard on the north side, microphone on a stand, rolls of wristbands, a desk lamp | |
| Lost items box | On the floor inside the ring at (276, 186) | |
| Ring light | A round light (radius 10) at Y 20 over (280, 180), on 3 cables up to a truss | |
| Toy ride-on cars (3) | (200, 190) facing east, (360, 205) facing west, (215, 240) facing north | |
| Giant floor game | (365, 135): a 8 × 1 × 8 frame with big plastic discs scattered around it **[42]** | Original look, no brand |
| Padded benches (2) | Along the west edge at (157, 200) and the east edge at (400, 195), running north to south | |
| Wet floor sign and mop bucket | (330, 245) | |
| Trash bins (2) | (165, 250), (395, 120) | |

**Keep clear:** 6 studs around each `SeekerSpawn` and the `ItemSpawn`; the
drop slide run-out (x 245–255, z 130–140); the pole exit (210, 110–118);
8 studs either side of the robot path.

### Snack bar (counter x 58–66, seating x 68–150, z 165–250)

| Prop | Where | Notes |
|---|---|---|
| Counter | x 58–66, z 165–250, 4 high, with a gap at z 201–209 (lined up with the kitchen door) | Staff walkway behind it, x 55–58 |
| Drinks fridge | x 58–62, z 157–163, glowing **[60]** | No brand logos |
| Cash register | On the counter at (62, 175) | |
| Slushie machine | On the counter at (62, 230) | |
| Napkin holders (2) | On the counter at (62, 190) and (62, 220) | |
| Menu board | On the kitchen wall (x 55), facing east, Y 8–14, z 170–200 | Pizza, fries, slushies |
| Support columns | At every crossing of x = 80, 104, 128, 150 and z = 172, 196, 220, 244 | Hold up the west wing's level 2 |
| Tables (8, `HideTable`) | Centers (92, 184), (116, 184), (139, 184), (92, 208), (139, 208), (92, 232), (116, 232), (139, 232) | 8 × 5 tops, tablecloths, **4 chairs flipped upside down on each tabletop** |
| Tray rack | (70, 170) | |
| Trash bin | (72, 248) | |
| Ceiling lights | Recessed in the underside of level 2, every 24 studs | No shadows |

**Keep clear:** around (116, 208): that's the `ItemSpawn` (110, 205).

### Kitchen (x 5–55, z 140–250, staff only)

| Prop | Where | Notes |
|---|---|---|
| Tall fridges (2) | West wall, x 5–9, z 147–155 and z 157–165 | |
| Fryer | West wall, x 5–9, z 170–176 | |
| Stove | West wall, x 5–9, z 180–188 | |
| Sink | West wall, x 5–9, z 195–201 | |
| Shelves | West wall, x 5–7, z 215–245 | Boxes, cans |
| Prep island | x 25–35, z 175–235, 4 high, steel, with a walk-through gap at z 202–208 | |
| Shelves of boxes | East wall, x 51–55, z 145–195 and z 215–245 | |
| Mop bucket, wet floor sign | (45, 245), (40, 215) | |
| Light | One flickery white tube light on the ceiling | |

**Keep clear:** the vent grille (x 5–9, z 140–145) and the door (z 198–212
along the east wall).

### Maintenance hallway (x 5–555, z 5–23, staff only)

| Prop | Where | Notes |
|---|---|---|
| Pipes (3) | Along the north wall at Y 10, 12 and 14, the full length, brackets every 20 studs | |
| Fuse boxes (3) | North wall at x 100, 300 and 450, Y 4–7 | |
| Caged bulbs | On the ceiling (Y 14) every 40 studs | Dim |
| Cleaning cart | (200, 18) | |
| Ladder leaning on the wall | (380, 6) | |
| Boxes | (250, 8) | |

**Keep clear:** the vent end (7, 23), the storage doorway (500, 23), and a
walking lane down the middle (z 10–18).

### Storage (x 490–555, z 30–120, staff only)

| Prop | Where | Notes |
|---|---|---|
| Shelf rows (3) | Running north to south at x 499–501, x 514–516 and x 529–531, from z 40 to z 100 | Boxes, cleaning supplies |
| Spare balls | Net bags stacked at x 540–553, z 35–60 | |
| Boxes | Stacked 2 to 3 high at x 540–553, z 65–100 | |
| Mop buckets and wet floor signs | (505, 112), (535, 112) | |

**Keep clear:** the doorway from the hallway (x 497–503, z 30–36), the
door (x 517–523, z 112–120) and the vent (x 536–544, z 112–120).

### Arcade (x 70–235, z 270–350)

| Prop | Where | Notes |
|---|---|---|
| Cabinets (100, `ArcadeMachine`) | Two back-to-back double rows running east to west, centered on z 290 and z 322. Each side of a row has 5 groups of 5 cabinets, at x 80–100, 108–128, 136–156, 164–184 and 192–212. | One cabinet model, cloned. Invented game names on the marquees. |
| Claw machines (2) | (222, 290) and (222, 322), at the east ends of the rows | Plushies inside |
| Change machine | West wall at (71, 300) | |
| Ticket strips | On the floor near the rows | Decals, not parts |
| "ARCADE" sign | South wall over x 130–170, Y 14–20, glowing | |

**Keep clear:** the walkway z 270–284 (the open slides land here), the
aisles z 294–318 and z 326–350, and the `ItemSpawn` (200, 300).

### Prize counter (x 238–272, z 270–350)

| Prop | Where | Notes |
|---|---|---|
| Glass display cases | x 240–244, z 280–345, 4 high | Small plushies and toys inside |
| Prize wall | Shelves on x 268–272, z 275–345, 10 high | Plushies, a few giant ones on top |
| "PRIZES" sign | On the prize wall at Y 12 | |

A gap at z 270–280 lets you slip behind the counter (a hiding spot).

### Small ball pit (x 290–390, z 275–345)

| Prop | Where | Notes |
|---|---|---|
| Pit | Floor sunk 4 studs, filled with neon balls up to about Y 0 | `BallPit` zone: an invisible part x 292–388, z 277–343, Y −4 to 1. `BallPitBalls` on the same part. |
| Padded edge | 2 wide, 3 high, all around, with entry gaps at x 330–340 (north side) and x 350–360 (south side), and a gap at x 356–368 (north side) where the wavy tube slide comes in | |
| Nets | 8-stud net panels on posts along the east and west edges | |
| "BALL PIT" sign | On the north side | |
| Spotlight | Over (340, 310), pointing down | |
| Spilled balls (10 to 15) | Along the north side, z 268–274 | |

**Keep clear:** the wavy tube slide landing (362, 276).

### Toddler zone (x 410–555, z 260–350)

| Prop | Where | Notes |
|---|---|---|
| Low padded wall | Around the zone, 3 high, with gaps at the west side (z 295–305) and the north side (x 475–485), and an opening for the vent grille (x 538–542, north side) | |
| Foam blocks (20, `FoamBlock`) | Start in a grid at x = 425, 437, 449, 461, 473 and z = 285, 300, 315, 330 | 4-stud cubes in primary colors, unanchored |
| Tiny corkscrew slide | Platform 6 high at x 525–533, z 330–338 with padded steps up its west side; the slide curls down to (520, 318) | |
| Soft ramp | Wedge at x 490–500, z 335–345 | |
| Toy ride-on cars (2) | (510, 275), (545, 300) | |
| Parent bench | (450, 347), against the south wall | |
| Spotlights | Two overhead lamps at (450, 305) and (515, 305) | |

**Keep clear:** the `FightSpawn` (500, 300), the vent (x 536–544 at
z 260) and the entry gaps.

### Under the structure (ground)

Keep props **between the structure's posts**, never overlapping them.

| Area | Props |
|---|---|
| West wing (x 80–150, z 30–160) | Net maze (x 86–144, z 70–140). Open padded floor at z 30–70 with soft foam cylinders (2 across, 4 high) at (95, 45) and (135, 45). |
| North wing (x 150–410, z 30–110) | Big ball pit (x 298–398, z 38–104) with a "BIG BALL PIT" sign; roller ramp (x 160–230, z 58–80); soft foam cylinders at (250, 50), (280, 50), (250, 90), (280, 90). |
| East wing (x 410–480, z 30–230) | Crawl tube tunnels (x 416–474, z 120–190); soft foam cylinders at (440, 60), (460, 215). |
| Between the east wing and storage (x 480–555, z 120–190) | A drinking fountain on the east wall at (554, 140). Keep the `ItemSpawn` (520, 160) clear. |
| North of the west stairs (x 5–80, z 23–100) | The kitchen vent duct along the west wall (x 5–9); a stack of spare crash mats at (40, 60), a cleaning cart at (65, 80). |

**Keep clear:** `FightSpawn` (115, 50).

### West balcony (floor 2, x 0–80, z 100–260)

| Prop | Where | Notes |
|---|---|---|
| Railings | Around the stair opening (x 15–55, z 100–134) and along the open north and south edges | 3.5 high |
| Lost and found | Bin at (8, 235) full of shoes; a shelf at x 1–4, z 240–252 with a teddy bear, a sock and water bottles; a "LOST & FOUND" sign on the west wall | |
| Benches (2) | Along the west wall, x 1–4, z 155–165 and z 185–195 | |

**Keep clear:** the `ItemSpawn` (40, 200) and the net doors along x = 80.

### East balcony and party rooms (floor 2)

| Prop | Where | Notes |
|---|---|---|
| Railings | Along the south edge (z 250) and around the stair opening (x 495–535, z 220–235) | |
| Party room signs | Glowing "PARTY ROOM 1/2/3" over each door on the walkway side, Y 32 | |
| **Party room 1** (z 28–90) | Stage at x 538–552, z 38–80, 2 high, steps at z 56–62; curtain on the east wall behind it; "HAPPY BIRTHDAY" banner over the stage at Y 16; balloon arch on the stage front; folding chairs in rows along the north wall (z 31–34, x 505–530) and south wall (z 84–87, x 505–530) | 15 balloons in total (`Balloon` on each) |
| **Party room 2** (z 98–160) | Two long party tables (`HideTable`) at x 512–540, z 112–117 and z 138–143, chairs along both sides; a cake on a small round table at (546, 128); party hats, plates and cups on the tables | 8 balloons |
| **Party room 3** (z 168–220) | Two long party tables (`HideTable`) at x 512–540, z 178–183 and z 208–213; a pile of wrapped gifts at (546, 194) | 6 balloons |
| Party room decor | Bunting flags across each ceiling, puzzle mat floor (its own color pair per room) | |

**Keep clear:** the doors (x 500–506 at each door's z ± 3), the crawl tube
entry (x 500–508, z 124–134), the vents (± 4 around each), the `ItemSpawn`
(526, 60) and the `FightSpawn` (526, 200).

### Floor 3 (big version only)

| Area | Props |
|---|---|
| West tower lookout | Bubble windows on the north and west faces, a toy telescope at (90, 40). Keep the `ItemSpawn` (115, 75) clear. |
| North wing top | Crawl tubes (tube maze) with bubble windows on the south face looking down into the hub; the spiral slide entrance (x 350–380, z 42–72) with a "BIG SLIDE" sign; the pole landing (x 204–216, z 100–110). Keep the `FightSpawn` (260, 75) clear. |

### Overhead lamps (shadow casters)

Hanging warehouse lamps at Y 60 on cables from the trusses:
- Hub: (200, 140), (280, 140), (360, 140), (200, 240), (280, 240),
  (360, 240).
- Arcade and prize counter: (100, 310), (150, 310), (200, 310), (255, 310).
- Toddler zone: (450, 305), (515, 305).
- Spotlights over both ball pits.

Everything else: small lights with `Shadows` off. Colored uplights every
40 studs along the walls.

### Everywhere

Wet floor signs and mop buckets (decoration only) **[20] [62]**, a few
cones, scattered balls.

## 3.6 Build order

**Stop after each step** so the owner can look around in Studio.

1. **Greybox:** every floor, wall, wing, slide (simple ramps for now),
   crossing and stair as plain blocks, plus every marker with its tag.
   Then make `PlayPlace_Small` (a copy with floor 3 closed off).
2. **Building and floors:** walls, ceiling, trusses, windows, parking
   lot, carpet, tiles, mats.
3. **The cube kit**, then the three wings and the west tower.
4. **Slides, tubes, poles, the rope bridge and the net tunnel.**
5. **Areas, one at a time** (3.5): ball pits, snack bar, arcade, prize
   counter, toddler zone, party rooms, staff areas, entrance hall, info
   desk.
6. **Lighting.**
7. **Details:** signs, wet floor signs, spilled balls, lost and found.
8. **Update `PlayPlace_Small`** to match, with floor 3 still closed.

Every step ends with the checks in 2.8. Keep every tag.

---

# Part 4: The office lobby

Where everyone waits between matches: the **headquarters of the toy company
that runs the play places**. Picture: `docs/maps/office.png`.

## 4.1 The idea

- **A fun toy-company HQ:** bright, warm and colorful, with playful touches
  everywhere. It's the cheerful, safe place before the dark, tense play
  places.
- **One big open room**, so everyone can see the TV, the leaderboards and
  the screen over the doors from anywhere.
- **Voting happens on screen.** The map vote is a pop-up (Part 6); the big
  screen over the doors only shows the countdown and the live results.
  There's nothing to walk up to for voting.
- **You arrive by tube.** Every time a player **joins the server**, they
  drop out of a **giant tube slide** in the ceiling into a **big ball pit**
  in the middle of the room, with a short landing cutscene
  (`docs/GAME_DESIGN.md`, "Arriving in the office"). Then they can wade
  around, look around and climb out.
- **Coming back after a match is different:** no tube drop and no fade to
  black. The owner has their own idea for that transition and will explain
  it. **Ask the owner before building anything for it.**
- **No brand or mascot.** The company and game names are still parked, so
  signs say **"HQ"** for now.

## 4.2 Size and position

- Build it as `Workspace.Office`. It's **always there** (maps load behind
  its doors).
- **World coordinates** (same origin as the maps): the room's inside is
  **x −30 to 110, z 362 to 452** (140 × 90 studs), floor top at **Y 0**,
  ceiling at **Y 24**.
- Its **north wall** sits right against the play place's south wall, and
  its **doors line up with the map's office doorway** (map south wall,
  X 20 to 60). Every map keeps its doorway in that same spot.
- No windows (it's night outside and the room faces inward).

## 4.3 Look

| Part | Look |
|---|---|
| Walls | White (`#F2F4F8`) with one thick horizontal stripe at waist height made of four blocks in the wing colors: orange `#FF8C32`, royal blue `#3D6BFF`, lime `#8EDB3C`, purple `#7B4DFF` |
| Ceiling | White, flat, with square light panels |
| Floor | Light wood (WoodPlanks material), with a big rug in the lounge |
| Furniture | Rounded, chunky and colorful, in the wing colors |
| Team colors | Hot pink and teal only as small accents, same rule as the maps |

**Lighting:** the Lighting settings are shared with the maps (dark, night),
so the office needs **plenty of its own light**:
- Ceiling light panels every 16 studs (bright warm white `#FFF1DC`,
  `Shadows` off).
- Six warm pendant lamps with shadows: two over the lounge, two over the
  reception, two over the desk pod.
- A thin glowing strip (Neon) along the top of every wall, in the wing
  colors.
- A glowing ring around the tube's mouth and a `SpotLight` inside the
  mouth pointing down at the ball pit, so every landing is well lit.
- Office lights are **not** tagged `DimmableLight`; the lighting variation
  only affects maps.

## 4.4 Where everything goes

All positions are world `(x, z)`, on the office floor (Y 0).

### North wall: the doors

| Thing | Where | Notes | Tag |
|---|---|---|---|
| Double doors (2) | Doorway x 32–48, 12 high. Left door x 32–40 hinged at x 32, right door x 40–48 hinged at x 48. They swing **into the office**. | Bright yellow with round porthole windows. Each door is a Model with its main part named `Panel` and an attribute `Side` = `"Left"` or `"Right"`. | `OfficeDoor` |
| Door screen | On the wall above the doors, x 26–54, Y 13–21 | A big screen with a `SurfaceGui` named `Display` (code fills it: the countdown, then the live map vote results) | `MapVoteBoard` |
| Venue posters (4) | On the wall at x −18 and 5 (left of the doors) and x 75 and 98 (right), each 8 × 10, Y 4–14 | Play place, trampoline park, family fun center, and a funny "SAFETY FIRST! (fun second)" poster. Original art only. | |

**Keep clear:** x 26–54, z 362–374 in front of the doors (they swing in and
players crowd here).

### West side: the TV lounge

| Thing | Where | Notes | Tag |
|---|---|---|---|
| TV | West wall, centered at z 405, 16 wide × 9 tall, Y 4–13 | A thin black frame. The screen has a `SurfaceGui` named `Display` (code shows the current round) | `OfficeTV` |
| Lounge rug | x −28 to −4, z 388–422 | Big, soft, colorful | |
| Couches (2) | x −14 to −10.5, z 392–404 and z 406–418, facing the TV | 12 long, seat 2 high, chunky cushions in orange and blue | |
| Coffee table | x −18.5 to −15.5, z 400–410 | Low and round-edged, a bowl of plastic balls on top | |
| Beanbags (4) | Centered at (−22, 395), (−22, 403), (−22, 411), (−22, 419), facing the TV | 3 × 3 × 2, lime, purple, yellow, orange | |
| Giant plush bear | North-west corner at (−26, 368) | 8 tall, sitting | |

### South-west corner: the plush corner

| Thing | Where | Notes |
|---|---|---|
| Giant plushies | x −28 to −8, z 430–450 | A pile of giant plushies (a dinosaur about 7 tall, a bunny about 6 tall) and a heap of small ones. Generic animals, no famous characters. |
| Beanbags (2) | (−12, 434) and (−12, 444) | |
| Sign | On the west wall above the pile, Y 4–8 | "NAP ZONE (employees only)" |

### Center: the arrival (big tube and spawn ball pit)

This is the first thing every player sees. Look at **[06] [30] [33] [36]**
for how tube slides and ball pits feel.

| Thing | Where | Notes | Tag |
|---|---|---|---|
| Spawn ball pit | Inside x 24–56, z 386–416 (32 × 30), floor sunk to Y −3, padded floor | Filled with moving balls up to about Y 0 by code. Ball colors: orange, royal blue, lime, purple and white. | |
| Ball zone | An invisible part filling the pit: x 24–56, z 386–416, Y −3 to 1 | `CanCollide` off, `CanTouch` and `CanQuery` on. Code fills it with moving balls, like the play place pits. **Not** tagged `BallPit` (no hiding in the office). | `BallPitBalls` |
| Padded edge | All around the pit, 2 wide, 2 high (x 22–58, z 384–418), with 8-stud gaps on the north and south sides (x 36–44) | Chunky padding in the wing colors | |
| Exit steps | Padded steps inside the pit at both gaps, from the pit floor (Y −3) up to the room floor | Players can also just jump over the edge | |
| SpawnLocation | 12 × 1 × 12 on the pit floor, centered at (40, 401) | `Transparency` 1, no decal, `Neutral` on. Code moves players into the tube from here. | |
| The big tube | Comes in through the **east wall above the lockers** at (110, 401), runs west under the ceiling (center line Y 18), then bends down in a big elbow and points straight down over the pit's center. Its open mouth is at **Y 10**, centered at (40, 401). | A giant tube slide: 13 across outside, 12 inside, glossy purple (`#7B4DFF`) plastic with see-through stripe windows every 8 studs, a flared lip and a glowing lime ring around the mouth. An "ARRIVALS ↓" sign on its side. Build it as a mesh if you can (2.7). `CanCollide` off (it's decoration; players never touch it). | |
| Tube drop point | An invisible part 10 × 1 × 10 inside the tube's mouth at Y 13, centered at (40, 401) | `CanCollide`, `CanTouch` and `CanQuery` off. Code drops players from random spots on it. | `OfficeTube` |

**Keep clear:** a 6-stud walkway all the way around the pit's edge
(x 16–64, z 378–424). Nothing under the tube's run may be taller than
Y 9, so the tube never blocks the arrival camera.

### South wall: reception and leaderboards

| Thing | Where | Notes | Tag |
|---|---|---|---|
| Reception desk | Curved counter centered at (40, 438), 18 wide, 3 deep, 4 high, facing north | White top, orange front. On it: a monitor, a bell, a small plush, a "WELCOME!" sign. An office chair behind it. | |
| Logo wall | South wall behind the desk, x 28–52, Y 6–16 | A big original logo (simple shapes for the three venues: a slide, a trampoline, a joystick) and "HQ" | |
| Waiting area | Three chairs and a small table on each side of the desk, x 20–28 and x 52–60, z 440–446, facing north | Colorful chairs; a fake potted plant at each end | |
| Leaderboards (4) | South wall, Y 8–20, each 12 wide: x −25 to −13, x −9 to 3, x 77 to 89, x 93 to 105 | Each has a `SurfaceGui` named `Display` and an attribute `Board`: `"AllTime"`, `"Weekly"`, `"TopLevels"`, `"TopSupporters"` (left to right) | `LeaderboardBoard` |

### East side: shop, lockers and desks

| Thing | Where | Notes | Tag |
|---|---|---|---|
| Vending machines (2) | Against the east wall, x 106–110, z 376–381 and z 383–388, facing west | 5 wide, 4 deep, 10 tall, glowing, full of toy prizes and snacks (no brands). An Attachment named `PromptPoint` on the front, 4 studs up. | `VendingMachine` |
| Lockers (6) | Against the east wall, x 107.5–110, z 396–411 | 2.5 wide each, 8 tall, alternating wing colors. Each locker is its own model with a `PromptPoint` Attachment on the front, 4 studs up. | `Locker` |
| Locker bench | x 100–102.5, z 398–409 | Padded bench | |
| Desk pod | x 74–90, z 376–392: six desks in two rows of three | Colorful desks and chairs, monitors showing play place blueprints, toys and plushies on every desk | |
| Water cooler | (100, 420) | | |

### South-east corner: saved for later

| Thing | Where | Notes |
|---|---|---|
| Empty space for mini activities | x 64–108, z 424–450 | Leave it empty. Mark it with yellow tape on the floor, a few cones, and a sign: "UNDER CONSTRUCTION: more fun coming soon" |

## 4.5 Build order

**Stop after each step** so the owner can look around in Studio.

1. **Shell:** floor, walls, ceiling, the doorway, the double doors.
2. **Screens and boards:** the door screen, the TV, the four leaderboards,
   with their tags, attributes and `Display` SurfaceGuis.
3. **Shop and lockers:** vending machines and lockers, with tags and
   `PromptPoint` attachments.
4. **Furniture:** lounge, reception and waiting area, desk pod.
5. **The arrival:** the spawn ball pit (edge, steps, ball zone,
   `SpawnLocation`), the big tube with its ring light, and the
   `OfficeTube` drop point.
6. **Fun stuff:** the plush bear, the plush corner, posters, the logo
   wall, the "under construction" corner.
7. **Lighting.**
8. Run every check in 2.8 on `Workspace.Office`.

---

# Part 5: Models

All models go in `ReplicatedStorage.Assets` (2.6). Follow Part 2's rules:
R6 scale, no floating bits, blends in, swap ugly for better.

**Rules for every model players hold or drop:**
- Every part is unanchored, `Massless`, `CanCollide` off, welded to the
  main part with `WeldConstraint`s.
- Named exactly as below, so code can find them.

## 5.1 Squeaky hammer (the seekers' weapon)

`ReplicatedStorage.Assets.Tools.SqueakyHammer`: a **Tool**.

| Part | Look and size |
|---|---|
| `Handle` (the Tool's handle) | Plastic handle, a cylinder 3 long × 0.45 across, yellow `#FFD23F` with a red grip stripe near the bottom |
| `Head` | A fat cylinder 2.6 long × 1.5 across, mounted crosswise on top of the handle, red `#E8413C`, glossy plastic |
| `Bellows` | Three white rings (1.6 across, 0.25 thick) around the middle of the head, like a squeaky toy's folds |
| `Caps` | Rounded soft caps on both ends of the head, yellow `#FFD23F` |

- About 3.8 studs tall overall: big and goofy next to an R6 player.
- **Grip:** set the Tool's grip so the hand holds the bottom of the handle
  with the head up and forward.
- An **Attachment** named `HitPoint` in the center of the head (code puts
  effects there) and a **Sound** named `Squeak` inside `Head`.
- `RequiresHandle` on, `CanBeDropped` off.
- This is the default skin, **"Classic Squeaker"**. Keep `Head`, `Bellows`,
  `Caps` and `Handle` as separate parts so skins can recolor or swap them
  later (see the inventory and shop mockups for skin ideas).

## 5.2 Other things players hold

| Model | Type and location | Look |
|---|---|---|
| `BoxingGloves` | Model in `Assets.Tools`, with `LeftGlove` and `RightGlove` parts, each with an Attachment named `WristAttachment` at the cuff | Chunky rounded gloves, 1.3 × 1.3 × 1.5, red with a white cuff. Code welds them to the R6 hands. |
| `Dodgeball` | Tool in `Assets.Tools`; `Handle` is a ball 1.6 across | Red rubber ball (Rubber material) with a slightly darker seam stripe |
| `Flashlight` | Tool in `Assets.Tools`, 1.6 long | Chunky plastic flashlight with a `SpotLight` named `Beam` at the front, `Enabled` off (code turns it on) |

## 5.3 Items players drop

| Model | Location | Look |
|---|---|---|
| `BananaPeel` | `Assets.Items` | A cartoon banana peel lying flat, 1.6 across, 0.3 high, yellow with brown tips. Plus an invisible part named `Hitbox` (2 × 1 × 2). |
| `DecoyBalloon` | `Assets.Items` | A round balloon 2.2 across (orange or purple, never pink or teal) on a 4-stud string with a small weight at the bottom, and an Attachment named `SoundPoint`. |

## 5.4 Map pieces code uses

| Model | Location | Look |
|---|---|---|
| `CleaningRobot` | `Assets.MapPieces` | A round robot vacuum, 3 across, 0.8 high, with a little bumper "face" and a front scoop. Main part named `Body` (set as `PrimaryPart`). Decoration only. |
| `PitBall` | `Assets.MapPieces` | One ball pit ball: a Ball part 1.2 across, SmoothPlastic, white (code colors it per pit). |
| `ArcadeCabinet` | `Assets.MapPieces` (and cloned into the arcade) | 4 × 4 × 8 cabinet with a part named `Screen` (glowing) and one named `Marquee` (the lit sign on top). Invented game names. |
| `PartyBalloon` | `Assets.MapPieces` (and cloned into the party rooms) | 2 across with a 4-stud string, tagged `Balloon` where placed |
| `FoamBlock` | `Assets.MapPieces` (and cloned into the toddler zone) | 4-stud soft cube with rounded edges, primary colors |

## 5.5 Effects

| Effect | Location | Look |
|---|---|---|
| `ConfettiPoof` | `Assets.Effects` | The default KO effect: a quick burst of colorful confetti and a little smoke puff (ParticleEmitters with `Enabled` off; code fires them) |

## 5.6 Sounds

Find good ones in the Toolbox's **Audio**, check they sound right, and put
them in `ReplicatedStorage.Assets.Sounds` with these names:

| Name | Sound |
|---|---|
| `Squeak` | Squeaky hammer bonk |
| `Whoosh` | Hammer swing miss |
| `Boing` | Trampolines and bouncy things |
| `Flop` | Ragdoll landing |
| `Pop` | Balloon pop |
| `Slip` | Banana peel slip |
| `Giggle` | Decoy balloon giggle |
| `Dash` | Flashstep |
| `Punch` | Boxing glove hit |
| `ConfettiPop` | KO confetti poof |
| `DoorCreak` | Doors |
| `TubeWhoosh` | Shooting out of the office arrival tube |
| `BallSplash` | Landing in a ball pit |
| `FootstepCarpet`, `FootstepPad`, `FootstepMetal` | Footsteps on each floor type |

Keep area sounds quiet; footsteps must always be easy to hear.

---

# Part 6: UI screens

Normal Claude builds the **layouts** in `StarterGui`, matching the mockups
in `docs/mockups/`. Claude Code writes the scripts that fill them in and
make the buttons work.

## 6.1 Rules

- **Match the mockups closely.** They're the target. Their backgrounds are
  stand-ins; only the UI counts.
- **The card reveal** (right side of `bonked-and-card-reveal.png`) is
  **locked**. Copy it exactly.
- **No colored accent lines along the top edge** of panels and buttons,
  except on **timers**.
- Colors: hiders teal `#2EE6D6`, seekers hot pink `#FF3D9A`, gold
  `#FFC83D` for points and "you", panels dark navy glass about 50%
  see-through, Robux buttons green `#34D399`, rarities gray-blue `#9FB0D6`
  / blue `#3EA1FF` / purple `#B06BFF` / gold `#FFC83D` / pink `#FF3D9A`.
- Fonts: **Montserrat** (heavy weights) for headers and numbers,
  **Nunito** for body text.
- **Glass panels:** navy background at `BackgroundTransparency` about 0.5,
  a `UIStroke` in white at about 0.85 transparency, a soft `UIGradient`.
  (Roblox can't blur what's behind UI, so fake the glass this way.)
- **Slanted panels:** Roblox can't skew a Frame. Use `ImageLabel`s with
  slanted shape images (white, tinted with `ImageColor3`, using
  `SliceCenter`). Until the owner uploads those images, use rounded Frames
  as stand-ins.
- **Every screen size:** size with Scale (not pixels), add
  `UIAspectRatioConstraint`s, and check it in the device emulator (Test tab
  → Device) at phone, tablet, 1080p and console (TV) sizes.
- **Controllers:** every button `Selectable`, with sensible
  `NextSelection` links so a gamepad can move around.
- Each ScreenGui: `ResetOnSpawn` off, `ZIndexBehavior` Sibling.
- **Templates** (one row, one card, one feed item) go in a Folder named
  `Templates` inside the screen, with `Visible` off. Code clones them.
- **Names:** use the names below exactly. If you add something code will
  need that isn't listed, give it a clear name and tell the owner.

## 6.2 Screens and names

| ScreenGui | Mockup | Main parts (names code uses) |
|---|---|---|
| `Hud` | `hud.png` | `TeamCounter` (`HidersCount`, `SeekersCount`), `Timer` (`TimeText`, `ModeText`, `RoundPips`, `Objective`), `CardChip`, `BonkFeed` (template `FeedItem`), `Scoreboard` (template `ScoreRow`), `Stamina` (`Bar`), `Abilities` (`Flashstep`, `Shove`, `Taunt`, `Item`, each with `Icon`, `KeyLabel`, `Cooldown`), `CloseCall`, `RoleTag`, `Coins` (`Amount`), `LevelRing` (`Level`) |
| `Results` | `results.png` | `WinnerBanner` (`Title`, `Subtitle`, `RoundText`), `HidersTable` and `SeekersTable` (template `ResultRow`), `Mvp` (`Name`, `Stat`, `Points`), `YouEarned` (`Lines`, `Coins`, `Xp`, `XpBar`), `ModeVote` (`Timer`, template `ModeOption` with `Name`, `Votes`, `YourVote`) |
| `Bonked` | `bonked-and-card-reveal.png` (left) | `Banner` (`Title`, `ByName`, `Subtitle`), `Respawn` (`Count`, `Label`) |
| `CardReveal` | `bonked-and-card-reveal.png` (right), **locked** | `Header` (`Title`, `Subtitle`), `Card` (`Rarity`, `Icon`, `CardName`, `Description`, `Modes`), `BackCards`, `Footer` |
| `SeekerBlind` | No mockup yet; use the Bonked style | Full black background, `Countdown`, `RoleBanner`, `Tip` |
| `MenuButtons` | `menu-buttons.png` | `Shop`, `Inventory`, `Quests`, `Settings` (each with `Icon`, `Label`, `Badge`), `Tooltip` |
| `Intermission` | `menu-buttons.png` (top center) | `TimeText`, `Label`, `Bar` (`Fill`, `MapVoteMarker`, `MapVoteLabel`) |
| `TubeIntro` | No mockup: a small slanted glass button in the bottom-right corner, styled like the walk-up prompt's key block | The arrival cutscene when a player joins: `Skip` (a button with `KeyHint` and `Label` "SKIP") |
| `MapVote` | No mockup yet: same style as the mode vote at the bottom of `results.png`, one bigger card per map with a picture | The pop-up for the map vote in the office's last 15 seconds: `Header` (`Title`, `Timer`), template `MapOption` (`Thumbnail`, `MapName`, `Votes`, `YourVote`) |
| `Prompt` | `menu-buttons.png` (walk-up prompt) | Template for a custom ProximityPrompt: `KeyBlock` (`Key`, `HoldText`), `Panel` (`Icon`, `ActionText`, `ObjectText`), `HoldBar` (`Fill`), `Line`, `Diamond` |
| `PlayerList` | `player-list.png` | `Header` (`Count`), `List` (template `PlayerRow` with `Banner`, `Avatar`, `PlayerName`, `Title`, `Level`, `Prestige`, `RoleDot`), `Footer` |
| `ProfileCard` | `player-list.png` | `Banner`, `Avatar`, `PlayerName`, `Username`, `Badges`, `Ping`, `Device`, `Country`, `Level` (`Bar`), `Showcase` (`Slot1`–`Slot3`), `AddFriend`, `Examine`, `Block`, `Close`, `ReportHint` |
| `Shop` | `shop.png` | `Header`, `Tabs` (one button per tab: `Featured`, `Hammers`, `Afterimages`, `Banners`, `Titles`, `Effects`, `Taunts`, `Passes`, `Coins`), `Wallet` (`Coins`), `Close`, `Featured` (`Limited`, `Giveaway`), `DailyShop` (`RefreshTimer`, template `ItemCard`), `GamePasses` (template `PassRow`), `CoinPacks` (template `CoinPack`), `DailyReward` |
| `Inventory` | `inventory.png` | `Tabs`, `Preview` (a `ViewportFrame`), `Equipped` (one slot per category), `Filters`, `Grid` (template `ItemCard`), `Showcase` (`Slot1`–`Slot3`), `Details` (`ItemName`, `Rarity`, `Description`, `Stats`, `PreviewButton`, `EquipButton`), `Close` |
| `Quests` | `quests.png` | `DailyReward` (template `Day`), `DailyQuests` and `WeeklyQuests` (template `QuestRow` with `Title`, `Progress`, `Bar`, `Reward`, `Claim`, `Reroll`), `RerollInfo`, `LevelBar`, `Close` |
| `Settings` | `settings.png` | `Categories` (one button per category), `Main` (templates `SliderRow`, `ToggleRow`, `KeybindRow`), `Quick` (audio sliders, `ShowHitbox` with its preview, quick toggles), `ResetDefaults`, `Close` |

Build **one screen at a time**, and stop after each so the owner can
compare it with its mockup.

---

# Part 7: Code (Claude Code only)

Claude Code's job: **everything in `src/`**. Follow `CLAUDE.md` and
`docs/GAME_DESIGN.md`.

- **Do:** the round system, modes, cards, movement, camera, hit system,
  tools and items working, map behaviors (moving balls, cleaning robot,
  foam blocks, arcade lights, balloons, doors, lighting variation), UI
  scripts (filling in and running the screens in Part 6), saving,
  progression, shop and inventory logic, settings, bots.
- **Don't:** build maps, props, models, lighting or UI layouts by hand, or
  give the owner command-bar scripts that build them. Those are normal
  Claude's (Parts 3 to 6).
- **Rely on** the folders and names in 2.6, the tags in
  `docs/GAME_DESIGN.md`, and the UI names in 6.2.
- **If something you need isn't built yet** (a map, a model, a screen),
  tell the owner exactly what to ask normal Claude for (which Part of this
  file, with names and tags), and wait.
- **Order:** the milestones in `docs/GAME_DESIGN.md` section 16, one at a
  time. Milestone 13 (maps) is normal Claude's.

---

# Not designed yet

Ask the owner before building these:

- The **trampoline park** and **family fun center** maps (only short
  descriptions in `docs/GAME_DESIGN.md` section 9 so far).
- Hammer skins and other cosmetics beyond the defaults.
