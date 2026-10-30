# Game Design

> **Working title:** not decided yet. Use "the game" in code and UI text until
> the owner picks a name.
>
> This doc is the single source of truth. When the owner shares new info,
> update this doc first, then build from it. Numbers marked **(suggested)**
> were picked by Claude, not the owner; they are safe defaults to tune after
> playtesting.

## 1. Pitch

A goofy multiplayer party game set in giant indoor play places. Up to 30
players run, slide, climb and flashstep through huge multi-floor jungle gyms
playing hide and seek, fighting and more party modes. It should feel **tense
but funny**: heart-pounding when a seeker walks past your hiding spot, then
pure chaos a second later.

Inspired by the Steam game **Goofy Gorillas**, but fully original: its own
name, maps, art, sounds and UI. Nothing is copied from that game.

The game will be **published publicly** on Roblox for **PC, mobile and
console at launch** (built and tested on PC first, but mobile and console
controls must be ready before release).

## 2. Feel and sound

- Mix of **tense-but-funny** and **goofy chaos**.
- **Music:** goofy, upbeat play-place music overall. For a hider, the music
  turns tense (quieter, heartbeat) when a seeker gets close.
- **Footsteps are loud and matter:** sprinting is loud, walking is normal,
  crouching is silent.
- Silly sounds everywhere: squeaky hammer, boings, ragdoll flops.

## 3. Players and avatars

- **Up to 30 players per server.**
- Players use **their own Roblox avatars in R6** (set the experience's avatar
  type to R6 in Game Settings). R6 bodies are all the same size, so hiding is
  fair.
- During hide and seek, **really large accessories are removed** (wings,
  giant hats, huge backpacks); normal hats and hair stay. Revisit after
  playtesting.
- **Name tags are hidden for everyone** during hide and seek rounds.
- **Chat:** normal Roblox text and voice chat at all times.

## 4. Camera

| Mode type | Camera |
|---|---|
| Hide and seek, tag (and similar) | **First person**, locked |
| Everything else (fighting, office) | Third person, free zoom with a max distance of 20 studs **(suggested)** |

**First-person view:** no arms or held items on screen, except items you
aim with, like the **dodgeball**, which shows in your hand for better
aiming.

## 5. Session flow

### The office (lobby)

Everyone spawns in an **office**: the **headquarters of the company that
owns all three venues**, with posters of the play place, trampoline park
and family fun center on the walls. (Not a bathroom: Roblox restricts
experiences set in private spaces like bathrooms to ID-verified 17+ users.)

The office has:
- **Big double doors on one wall**, with the countdown above them.
- **Vending machines:** walk up to one to open the **shop**.
- **Lockers:** walk up to one to **equip** titles, hammer skins, afterimage
  colors, emotes and taunts.
- **Map vote board.**
- **A TV showing the current round live**, for late joiners and AFK players.
- **Leaderboards** (see section 13).
- Space to hang out. **No mini activities for now**; they come later, once
  the office layout has enough room. Leave open space for them.

### Match loop

1. **Map loads behind the office doors.** Once the map has fully loaded for
   players, **the doors swing open**.
2. Players walk through into the map's **entrance hallway** (cubbies, shoe
   racks, sign-in desk), which opens into the play area.
3. **A match is 5 rounds on the same map.** Before each round, players
   **vote on the mode** (only modes, never the map, between rounds). A tied
   vote is broken by a random pick between the tied modes.
4. **Between rounds 1 to 5, players stay on the map.** The results screen and
   the next mode vote pop up there (about 15 to 20 seconds total
   **(suggested)**), then the next round starts.
5. **After round 5,** everyone returns to the office for a **40-second
   intermission**. The **map vote** opens for the last 15 seconds.
6. Repeat with the winning map.

### Each round can have

- **Map lighting variation (not a card):** 50/50 each round, either all
  lights on, or some lights off. When some are off, some areas are dimmed and
  some lights flicker. It must never be very dark or very bright.
- **A rule-change card:** 1 in 3 chance per round (section 8).

### Late joiners and AFK

- **Late joiners** wait in the office (and can watch the TV) until the next
  round starts.
- **AFK:** both a **manual AFK toggle** and **auto-detection** after 60
  seconds without input **(suggested)**. AFK players skip rounds and stay in
  the office.

### Bots

Bots let people play when servers are small.

**When bots appear**
- **Public servers:** when there are fewer than 4 real players
  **(suggested)**, bots join so every round has a handful of them, about 4
  **(suggested)**. More is chaos. They leave as real players join.
- **Private servers:** **no bots** unless the owner has **PS Plus** and turns
  them on. Without bots, the server shows **"Waiting for 1 more player to
  join"** until there are 2 real players (so two friends can play alone).

**What bots are like**
- **They look like your friends:** each bot copies the avatar and name of a
  Roblox friend of someone in the server. If there aren't enough friends, it
  uses a generic avatar and name **(suggested)**.
- **"(bot)" is shown only in the bottom-left live scoreboard** (for example
  "Mango (bot)"). Bots are not listed in the top-right player list
  **(suggested)**.
- **Skill: medium.** They search properly, chase, and catch careless
  players.
- **Hide and seek:** bots can be **hiders or seekers**, just like real
  players. **Fighting:** bots fight.

**Rewards with bots**
- **Only you and bots:** **no coins or XP.**
- **Real players plus bots:** **very, very reduced** coins and XP, about 10%
  of normal **(suggested)**.

## 6. Movement

| Move | How it works |
|---|---|
| Sprint | Hold to run faster. Uses stamina. |
| Crouch / crawl | Lower, slower, silent footsteps; fits through crawl tubes and under tables. |
| Slide | Press crouch while sprinting to slide along the floor, ending in a crouch. Uses stamina. |
| Climb | Walk into a climbable net or wall to climb it, like a ladder. Uses stamina. |
| **Flashstep** | A quick sidestep left or right that leaves one **black afterimage** behind. Details below. |

### Flashstep

- **One clean dodge, one afterimage.** It never chains: each use leaves a
  single afterimage, then goes on cooldown.
- **Direction:** **left or right only** (a true sidestep), relative to where
  the player is facing.
- **Distance:** about **6 studs**.
- **Cooldown:** **3 seconds**. Also uses stamina.
- **How it looks:**
  - The player snaps to the new spot almost instantly. They never turn
    invisible.
  - A **dark, see-through copy of the player's body**, frozen in their pose,
    stays where they started and fades out over about 0.6 seconds
    **(suggested)**. Default color is **black**; afterimage cosmetics change
    the color.
  - **The dodging player's own screen** gets a **very, very light** flash,
    barely noticeable. Nobody else sees it.
  - No smoke puff and no floor ripple.
- The movement and cooldown are checked by the server (so it can't be
  spammed or used to teleport further); the afterimage and screen flash are
  visual only.

- **Stamina** is used by sprinting, flashstep, climbing and sliding, and
  refills when not in use.
- **Seekers are slightly faster than hiders**, about 10% **(suggested)**.
- Trampolines only bounce you when you're on a trampoline surface.

### Controls

All keys are **fully rebindable** in settings. Defaults **(suggested)**:

| Action | PC | Console | Mobile |
|---|---|---|---|
| Sprint | Shift | Left stick click | On-screen button |
| Crouch / slide | C | B / Circle | On-screen button |
| Flashstep | Q | LB / L1 | On-screen button |
| Shove | E | RB / R1 | On-screen button |
| Taunt | T | D-pad up | On-screen button |
| Use item | F | Y / Triangle | On-screen button |
| Swing / punch | Left click | RT / R2 | On-screen button |

## 7. Game modes

Launch modes: **Hide and seek** and **Fighting**. Later: dodgeball, prop
hunt, tag, hot potato and more.

### 7.1 Hide and seek (build first)

**Setup**
- **Starting seekers:** 2, or 1 if there are fewer than 7 players.
- Seekers are picked randomly, but **nobody is a starting seeker two rounds
  in a row**.
- Seekers start **in the middle of the map, frozen with a black screen for 30
  seconds** while hiders run and hide.
  The black screen shows a big countdown, the SEEKER role banner and a
  rotating seeker tip (for example "Listen for footsteps!").

**Round length** (scales with players, never over 5 minutes):

| Players | Length |
|---|---|
| 2 to 6 | 2:00 |
| 7 to 15 | 3:00 |
| 16 to 23 | 4:00 |
| 24 to 30 | 5:00 |

The round ends early if every hider is caught.

**Seekers**
- Carry a **squeaky hammer**. **One bonk catches a hider.** Missing puts the
  hammer on a long cooldown, about 2 seconds **(suggested)**, so spam
  swinging is punished.
- Seekers have a **pink tint** so hiders can recognise them. No seeing through
  walls.
- In the **final minute**, every remaining hider is **pinged on seekers'
  screens every 15 seconds**.

**When a hider is bonked**
- They **ragdoll goofily** for about 2 seconds **(suggested)**.
- They **become a seeker** (infection) and **respawn at a seeker spawn
  point**, giving nearby hiders a moment to escape.
- Everyone sees it in the **bonk feed**, and players **nearby** hear the
  squeak. Far-away players don't hear it.

**Hiders**
- **Hiding spots:** dive fully into **ball pits**, crawl **under tables**
  (party tables with tablecloths), plus any good corner.
- **Shove:** pushes a seeker back, and the seeker **can't swing for 1.5
  seconds**. Cooldown 30 seconds **(suggested)**.
- **Taunt:** plays a goofy **sound** from your spot (no ping), earns coins.
  Cooldown 15 seconds **(suggested)**.
- **Items spawn around the map.** Launch items:
  - **Banana peel:** drop it; a seeker who steps on it slips and falls.
  - **Decoy balloon:** drop it; it plays fake footsteps and giggles to
    mislead seekers.
- **Close call:** a seeker swings at you and misses, **or** a seeker comes
  within a few studs of you without catching you. Earns coins.
- Hiders always see the **timer, hiders left and seeker count**.

**Winning and rewards**
- If **any hider survives**, the survivors get the win bonus.
- If **everyone is caught**, the **starting seekers** get the win bonus.
- Everyone earns coins for what they did (section 12).
- If **every seeker leaves the game** mid-round, the round **ends with no
  rewards** for anyone.
- When a seeker bonks someone, the seeker's equipped **bonk effect** plays
  (cosmetic, section 11).

**Results screen stats**
- Hiders: time hidden, close calls, flashsteps, taunts, points, coins.
- Seekers: bonks, best streak, points, coins.
- A **Round MVP** card for the top scorer.

### 7.2 Fighting (launch mode 2)

- **Free for all, one-hit KO.**
- **Win:** first to **10 KOs**, or the most KOs when the **3-minute** timer
  ends. **Tie-breaker:** whoever was KO'd the fewest times wins; if that's
  tied too, it's a shared win **(suggested)**.
- **Weapons:** everyone starts with **boxing gloves**. Pickups around the map:
  **squeaky hammers, dodgeballs**, and the hide and seek items (banana peel,
  decoy balloon).
- **Dodgeballs:** click to throw where you aim, **hold to charge** a faster,
  longer throw, and balls **bounce off walls once** so you can bank shots.
- **When someone is KO'd:** the KO'er's equipped **KO effect** plays. The
  default is a goofy **confetti poof**. KO effects are cosmetics (section
  11).
- **Defense:** the **flashstep** is the main dodge, plus **spawn protection**
  for 2 seconds **(suggested)** after respawning.
- **Respawn time:** 4 seconds, spent like this:
  1. **Kill cam (about 1 second):** a quick replay of how you got KO'd
     **(suggested length)**.
  2. **Watch your KO'er (3 seconds):** the camera follows whoever KO'd you.
     You can **skip** this: the camera cuts to **where you're going to
     spawn**, showing a **ghostly version of your avatar** there.
  3. You spawn in.
- Third-person camera with the max zoom limit.
- **Play area: the whole map, plus a shrinking zone.**
  - The zone starts closing in partway through the round, from 1:30 left
    **(suggested)**.
  - **It never shrinks too much, and its final size scales with player
    count:** about 40% of the map on a full server and 25% with few players
    **(suggested)**.
  - Closed-off areas fit the venue, like "closed for cleaning" caution tape
    and shutters **(suggested)**.
  - Standing outside the zone for 3 seconds KOs you; it counts as a death but
    gives nobody a KO **(suggested)**.

## 8. Rule-change cards

- **1 in 3 chance** that a round gets a card.
- **Some cards are announced before the round** with the card-flip reveal.
  **Some trigger as mid-round surprises.**
- **Each card lists which modes it works in.**
- The card-flip reveal design is **locked**: see
  `docs/mockups/bonked-and-card-reveal.png` (right side). Don't change it.

**Launch cards (5)**

| Card | Effect | Modes | Timing |
|---|---|---|---|
| Low Gravity | Jump higher and fall slower; **strength is random each time** | All | Before round **(suggested)** |
| Lights Out (**rare**) | Almost pitch black; **everyone gets a flashlight**, but turning it on gives you away | All | **Before round** |
| Speed Rush | Everyone moves much faster | All | Mid-round surprise **(suggested)** |
| Slippery Floors | Floors become icy and slidey | All | Mid-round surprise **(suggested)** |
| Double Seekers | Twice as many starting seekers | Hide and seek only | Before round **(suggested)** |

More cards will be designed later.

## 9. Maps

Three maps at launch. **Build the indoor play place first**, then the other
two. Art style: **realistic-ish with a tiny bit of cartoon**. Every map has
a **small version** (2 to 14 players) and a **big version** (15+ players); the
game loads the right one at the start of each match.

### 9.1 Indoor play place (main map)

- Generic play place (no brand or mascot).
- **Big version: 3 floors.**
- Areas:
  - **Ball pits with slides** coming down into them.
  - **Multi-floor climbing structure:** nets, crawl tubes, rope bridges,
    padded platforms.
  - **Giant spiral tube slide** from the top floor into the biggest ball pit.
  - **Toddler zone:** small soft-play area with foam blocks.
  - **Party rooms:** tables with tablecloths, balloons, cake, a little stage.
  - **Arcade and snack bar,** with a **prize counter** (glass cases of
    plushies and toys).
  - **Entrance hallway** from the office doors: cubbies, shoe racks, sign-in
    desk.
  - **Info desk:** a round staff desk in the middle of the building. This is
    where **seekers wait blind** at the start of hide and seek
    (`SeekerStart`).
  - **Staff-only areas** you can hide in:
    - **Snack bar kitchen** behind the counter (fridges, shelves, a fryer).
    - **Storage room** (boxes, spare balls, cleaning supplies, mop
      buckets).
    - **Maintenance hallway**, a narrow back hallway connecting areas, with
      pipes and fuse boxes.
  - **Vents:** crawlable vents (crouch only) that secretly connect a few
    rooms. No other secret shortcuts.
- **Size:** running straight across the **big version** takes about **35
  seconds** at sprint speed.
- **Small version (2 to 14 players):** the same building with only the
  **ground floor and 2nd floor** open; the 3rd floor is closed off.
- **Getting between floors:** stairs (fast but loud footsteps), climbing
  nets and ladders inside the play structure, and slides (down only). No
  elevator.
- **Ball colors:** each ball pit has **its own color theme** (for example
  one classic red/blue/yellow pit, one neon pit) **(suggested themes)**.
- **Closed-for-the-night details:** chairs flipped up on the snack bar
  tables, mop buckets and wet floor signs (decoration only, not slippery),
  and a lost and found (forgotten
  shoes, a lost teddy bear, a sock in the ball pit).

### 9.2 Trampoline park

- Trampoline grid, foam pit (dive in to hide), ninja course (swinging ropes,
  rings, balance beams), trampoline dodgeball court, bouldering climbing wall.
- **Look:** an **industrial warehouse**: concrete floors, steel beams, and
  padded, colorful trampolines.

### 9.3 Family fun center

- Laser tag maze (dark, neon, great for hiding), arcade floor,
  glow-in-the-dark mini golf.
- **Laser tag maze look:** **blacklight and light fog** with glowing neon
  walls. It's **always dim**, whatever the lighting variation is doing.

### 9.4 Living map: interactive pieces

These apply to every map that has them.

**Moving ball pit balls**
- Ball pit balls are **real moving balls**. They get pushed aside when you
  **walk through**, **splash out** when someone jumps, dives or slides in,
  get knocked around by **fights and items** (KOs, dodgeballs, banana
  peels), and **roll down slides** to pile up at the bottom. Balls can spill
  out of the pit and roll across the floor.
- **Each player's game moves its own balls** (they are not synced between
  players). This keeps it smooth with lots of balls and no server lag;
  players may see slightly different ball spots. Because of that, **hiding
  in a ball pit never depends on where the moving balls are**: diving uses
  the ball pit zone, and the deep part of the pit is always full.
- Performance mode (section 18) uses fewer moving balls.
- **Cleaning robot:** a little robot vacuum slowly roams the map scooping
  spilled balls back into the pits. It's **decoration only**: you can't ride,
  push or hide behind it, and players pass through it **(suggested)**. When
  you get very close, it **fades to see-through** so it never blocks your
  view.
- Everything **fully resets when the map reloads** for the next match.

**Foam blocks (toddler zone)**
- Players can **push them around and stand on them**, but **can't pick them
  up or stack them**, so no building forts.
- Foam blocks are **shared**: everyone sees them in the same place, so
  nobody is standing on a block that's invisible to someone else. To keep
  this cheap, there are only a limited number, about 20 per toddler zone
  **(suggested)**.

**Arcade machines**
- Light up and play sounds when you walk past or hit them.

**Balloons (party rooms)**
- Players can **pop** them. The loud pop can give away a hider's spot.
- Popped balloons come back when the map reloads **(suggested)**.

**Doors**
- Any player can **open and close** doors (party rooms, staff areas). Doors
  **creak**, so moving through them makes noise.

**Atmosphere**
- **It's always night outside:** dark sky, streetlights and a parking lot
  through the windows.
- **Area sounds are tiny and never cover footsteps:** for example faint
  arcade beeps, quiet party music, rustling balls. Footsteps always stay
  easy to hear.

**Other maps**
- **Trampoline park foam pit:** the foam cubes move, splash and spill
  exactly like the ball pit balls (same per-player rules and cleaning robot).
- **Family fun center mini golf:** scenery only for now.

**Where players can go**
- High spots are allowed: **arcade machines, shelves and other high areas**.
- **Not the very top roof** of the play structure; it's blocked off.

### How code finds map pieces

Maps are built by hand in Studio. Code never relies on part names or
positions; it finds pieces by **CollectionService tags**:

| Tag | Used for |
|---|---|
| `EntranceSpawn` | Where players appear when the doors open |
| `SeekerStart` | Middle-of-map spot where seekers wait blind |
| `SeekerSpawn` | Where bonked hiders respawn as seekers |
| `FightSpawn` | Fighting mode spawn points |
| `ItemSpawn` | Where items and weapon pickups can appear |
| `BallPit` | Invisible zones where players can dive and hide |
| `HideTable` | Tables players can crawl under |
| `Climbable` | Nets and walls you climb by walking into them |
| `Slide` | Slide surfaces |
| `Trampoline` | Bounce surfaces |
| `CrawlTube` | Crawl-only tunnels |
| `Vent` | Crawlable vents (crouch only) |
| `DimmableLight` | Lights that can be dimmed or flicker in the lighting variation |
| `BallPitBalls` | Where each ball pit's moving balls start |
| `RobotPath` | Points the cleaning robot roams between |
| `FoamBlock` | Pushable foam blocks |
| `ArcadeMachine` | Machines that light up and make sounds |
| `Balloon` | Poppable balloons |
| `Door` | Doors players can open and close |
| `NoGo` | Blocked-off areas, like the top roof of the play structure |

The office also uses tags: `OfficeDoor`, `VendingMachine`, `Locker`,
`MapVoteBoard`, `OfficeTV`, `LeaderboardBoard`.

## 10. UI

### Style

A mix of the owner's other game **WYR: Disasters** and **Goofy Gorillas**:

- **From WYR: Disasters:** slanted (parallelogram) panels with an offset
  shadow behind them, heavy all-caps headers, small letter-spaced labels,
  gold for points and for "your" row, team color blocks, big stacked banners.
- **From Goofy Gorillas:** frosted, see-through glass panels with thin light
  edges; minimal floating text during gameplay; an always-on scoreboard in
  the bottom left (name, then star points and a stat); a tiny crosshair; a
  clear middle of the screen.
- **During play:** keep it minimal. **Big moments and menus** (results, role
  reveals, banners, shop, lockers, vote board) use the full slanted style.

### Colors

| Use | Color |
|---|---|
| Hiders | Teal `#2EE6D6` |
| Seekers | Hot pink `#FF3D9A` |
| Points, highlights, "you" | Gold `#FFC83D` |
| Panels | Dark navy glass, about 50% transparent |
| Rarity | Common gray-blue `#9FB0D6`, Rare blue `#3EA1FF`, Epic purple `#B06BFF`, Legendary gold `#FFC83D`, Limited pink `#FF3D9A` |
| Robux buttons | Green `#34D399` |

Fonts: a heavy geometric font for headers and numbers (Montserrat Black or
similar in Roblox) and a rounded font for body text (Nunito or similar).

### Menu buttons (top left)

- Four buttons in a row at the **top left, right next to Roblox's own
  buttons**: **Shop, Lockers, Quests** (quests and the daily reward) and
  **Settings**.
- **Shown only in the office and between rounds**; hidden during rounds so
  the screen stays clean.
- Each button has its **own accent color** (Shop pink, Lockers teal, Quests
  gold, Settings soft white) as a top line and icon glow. Hovering a button
  fills it with its accent color, lifts it slightly and shows a tooltip
  (for example "Gold Squeaker is in the shop · daily shop refreshes in
  14:22"). No rarity strips in the tooltip.
- **Notification badges:** a gold "★ NEW" tag on the shop **only when
  something special arrives** (a new exclusive, limited or event item), not
  on every daily refresh. A pink number on Quests for quests or a daily
  reward ready to claim.
- **Intermission timer** (top center in the office): the countdown, when
  the map vote opens, and a **gold bar showing the time left until the
  match starts**; it drains as the countdown runs. A **white marker** on the
  bar, labelled "MAP VOTE STARTS", shows where the map vote begins (15
  seconds left).
- Walking up to a **vending machine** or **locker** in the office also
  opens the shop or lockers. The **walk-up prompt** uses the same mixed
  style: a slanted gold key block ("E" with "HOLD" under it, or the
  controller/touch button), a
  slanted glass panel with an icon, a big "OPEN SHOP" label and a small
  "VENDING MACHINE" label, a hold-progress bar along the bottom, and a thin
  line down to a glowing diamond marker on the object. See
  `docs/mockups/menu-buttons.png`.

### Player list (top right)

The game has **two lists**:

- **Top-right player list:** replaces Roblox's default player list (which is
  hidden). Shows everyone in the server, all the time.
- **Bottom-left scoreboard:** live round scores during rounds only (as in the
  HUD mockup). Unchanged.

Each row in the player list shows:
- The player's **equipped banner** behind their name (section 11).
- Their name (gold for VIP), **level and prestige badge**, and **equipped
  title**.
- During rounds, a small teal or pink dot for their role **(suggested)**.

Sorted by level outside rounds and by round points during rounds
**(suggested)**.

### Profile card

Clicking a name in the player list opens that player's **profile card**:

| Shows | Notes |
|---|---|
| Banner, name, level, prestige, title | Same as their row, bigger |
| **Ping** | Live |
| **Device** | General type only: PC, phone/tablet or console, based on how they're playing. Roblox doesn't expose exact device models. |
| **Country flag** | **Opt-in:** off by default; players turn it on in settings. Never anything more specific than country. |
| **Showcase** | Up to 3 **(suggested)** items or badges the player picks to show off |

Buttons, rebuilding Roblox's own player list options:
- **Add friend / Unfriend**
- **Block / Unblock**
- **Examine avatar** (Roblox's inspect menu, which links to their profile)
- **Report:** Roblox may not let games open its report screen directly. If
  not, players report through Roblox's own menu (Esc). Check when building.

### Mockups (match these)

| File | Shows |
|---|---|
| `docs/mockups/hud.png` | In-round HUD (hider view): team counter and timer, round pips, active card chip, bonk feed, scoreboard, stamina and ability buttons, close-call popup, role tag, coins and level ring |
| `docs/mockups/results.png` | Results: winner banner, hider and seeker tables, Round MVP, mode vote, coins and XP earned |
| `docs/mockups/bonked-and-card-reveal.png` | "BONKED!" moment (left) and the locked card reveal (right) |
| `docs/mockups/shop.png` | Shop: featured limited, giveaway, daily shop, game passes, coin packs, daily reward streak |
| `docs/mockups/player-list.png` | Top-right player list with banners, a profile card, and the country opt-in setting |
| `docs/mockups/menu-buttons.png` | Office view: top-left menu buttons with badges, intermission timer, and the walk-up prompt at a vending machine |

The mockups use stand-in backgrounds; only the UI is the target.

## 11. Shop, lockers and cosmetics

- **Unlockables:** titles, squeaky hammer skins, flashstep afterimage colors,
  emotes and taunt sounds, **player list banners**, **KO effects** (fighting;
  default is the confetti poof) and **bonk effects** (hide and seek). **No
  trails.**
- **Emotes** are used from an **emote wheel** (hold a key) and work
  **anywhere**: office, between rounds and during rounds. **Emotes come in a
  later update** because finding good animations takes time.
- **Banners** show behind your name in the top-right player list and on your
  profile card. They come from:
  - The **shop** (coins, cooler ones for Robux, in the daily rotation; the shop
    gets a **Banners** tab, which the shop mockup predates).
  - **Level rewards** and **prestige**.
  - **Events and limiteds.**
  - **Achievements:** quests and secret challenges.
- **Shop (vending machine):**
  - Most items cost **coins**; the cooler ones cost **Robux**.
  - A **daily rotating shop**.
  - **Robux exclusives** and **limited items** (limited stock and time).
  - **Giveaways** (for example weekly, for group members who like the game).
- **Coin packs** can be bought with Robux.
- **Lockers** are where players equip what they own.
- Roblox doesn't let games read a player's Robux balance, so the wallet only
  shows coins.

### Game passes (nothing pay-to-win)

| Pass | What it does | Price |
|---|---|---|
| VIP | Gold name, VIP chat tag, VIP-only title | placeholder 299 R$ |
| 2× Coins | Double coins from every round | placeholder 199 R$ |
| Exclusive Pack | Special hammer skins, afterimage and emote | placeholder 399 R$ |
| **PS Plus** | In the owner's private server: pick the map, mode, cards and timers, and add bots | **200 R$** |

**Private servers** are **free**. Without PS Plus they play exactly like
public servers.

All prices except PS Plus are placeholders until the owner sets them.

## 12. Progression

**Coins** are earned from:
- Surviving (coins every 30 seconds hidden, plus a bonus for surviving the
  round).
- Catching hiders.
- Taunts and juking (escaping a seeker with a shove or flashstep).
- Finishing a round, win or lose.

**Levels:**
- XP from playing raises your level, **up to 100**.
- At 100, players can **prestige** back to level 1 for a special badge and
  title.

**Level rewards** (the levels are **(suggested)**):

| Reward | When |
|---|---|
| Coins | Every level, with bigger amounts at every 10th level |
| Titles | Every 10 levels (Rookie, Sneaky, Pro Hider...) |
| Banners | Levels 15, 35, 60 and 90 |
| Hammer skins | Levels 25, 50, 75 and 100 |

## 13. Retention and community

### Quests

- **3 daily + 4 weekly** quests at a time.
- **Rewards:** coins and XP (weeklies give more).
- **Rerolls:** every player gets **1 free reroll per week**. Extra rerolls
  cost Robux, about 25 R$ **(suggested)**.
- **Keep them tame and doable.** No near-impossible ones like "get a 3-bonk
  streak" or "bonk someone in the final minute". Examples:
  - **Play:** play 5 rounds, finish 2 matches, play on each map.
  - **Hider:** survive 3 rounds, run 5,000 studs **(suggested amount)**.
  - **Seeker:** bonk 10 hiders.
  - **Fighting:** get 15 KOs, win a fighting round.

### Daily rewards

- **7-day streak:** coins on days 1 to 6, growing each day; **day 7 gives a
  free crate**.
- **Day 7 crate:** a random cosmetic from **common up to epic** (mostly
  common and rare, a small chance of epic). Duplicates turn into coins. The
  crate is free; if crates are ever sold for Robux, Roblox requires showing
  the odds before purchase.
- **Missing a day resets the streak to day 1**, but players can restore it
  for Robux, about 49 R$ **(suggested)**.

### Events

- **Launch event** (the first event), similar to Valorant's Champions
  bundles:
  - A **paid launch bundle**, on sale for **1 month** after release: a
    launch **hammer skin**, matching **KO effect and bonk effect**, a launch
    **afterimage color**, a **banner** and a **title**. Price to be decided.
  - **Free for everyone who plays in launch week:** a **launch badge and
    title**.
- **Winter / holidays:** only if the game releases close to December.
- Later: **seasonal events** with limited cosmetics and map decorations.

### Other

- **Leaderboards** in the office:
  - **All-time:** wins, bonks, time hidden, KOs.
  - **Weekly:** the same stats, reset every week so newer players have a
    shot.
  - **Top levels:** highest level and prestige.
  - **Top supporters:** most Robux spent in the game.
- **Map secrets** (hidden rooms, collectibles, puzzles): **later update**.
- **Lots of Roblox badges:** milestones, prestige, secrets.
- **Group perks:** group members get **+10% coins** and an **exclusive
  cosmetic**.
- **New players:** quick pop-up tips during their first few rounds.

## 14. Admin

**Do not build an admin system.** The owner will bring over the admin system
from WYR: Disasters.

## 15. Technical rules

- **The server decides everything that matters:** rounds, roles, bonks, hits,
  KOs, points, coins, purchases and saving. Clients only send requests ("I
  swung at this player") and the server checks them: distance, cooldowns,
  role, round state.
- Rate-limit every RemoteEvent and RemoteFunction.
- Each mode is its own ModuleScript with the same interface (start, stop,
  player joined, player left), so new modes plug into the round system.
- Each card is its own ModuleScript (apply, remove, allowed modes).
- All tunable numbers live in one shared config module.
- DataStore calls are wrapped in `pcall` with retries; data saves on leave and
  on server shutdown.
- Large maps and 30 players: use StreamingEnabled. Open the office doors only
  after the map is in place and players have loaded the area around the
  entrance (with a timeout so one slow player can't hold everyone up).
- Map versions (small and big) are stored as separate models and the right
  one is loaded at match start.

## 16. Build order (milestones)

Work one milestone at a time; the owner tests in Studio before the next.

1. **Office and match loop:** office lobby, doors opening after map load,
   5-round matches, mode vote each round, results pause, back to office,
   40-second intermission with map vote, late joiners, AFK toggle and
   detection. Uses a placeholder mode.
2. **Hide and seek core** on a greybox test map: seeker picking, black
   screen, hammer bonk, ragdoll and respawn as seeker, round length scaling,
   final-minute pings, win conditions.
3. **Movement:** sprint and stamina, crouch and crawl, slide, climb,
   flashstep, seeker speed, camera rules.
4. **Hider tools:** shove, taunts, items, ball pit diving, hiding under
   tables, footsteps, tense music near seekers.
5. **UI:** HUD, results screen, bonked banner, matching the mockups.
6. **Fighting mode.**
7. **Bots** for hide and seek and fighting, the "waiting for players"
   screen, and reduced rewards with bots.
8. **Rule-change cards** and the map lighting variation.
9. **Saving and progression:** coins, XP, levels, prestige.
10. **Shop, lockers and cosmetics** (including banners, KO effects and bonk
    effects), game passes, coin packs, PS Plus private server settings
    (including bots), and the **top-right player list with profile cards**.
11. **Retention:** daily rewards, quests, leaderboards, badges, group perks,
    tips for new players.
12. **Settings menu** (section 18), **mobile and console controls**, key
    rebinding.
13. **Maps** (built by the owner in Studio): play place small and big,
    trampoline park, family fun center.
14. **Polish and launch prep.**
15. **Later update:** emotes and the emote wheel.

## 17. Still to decide

- Game name (parked for now).
- Office mini activities.
- More rule-change cards.
- Real prices for items, passes, coin packs and the launch bundle.
- Details for later modes (dodgeball, prop hunt, tag, hot potato).
- Which emotes and animations.

## 18. Settings menu

| Group | Settings |
|---|---|
| Audio | Separate sliders for music, sound effects and voice |
| Camera and controls | Mouse and stick sensitivity, field of view, key rebinding (PC, console, mobile) |
| Graphics | A **performance mode** for weaker phones and PCs: fewer effects and simpler lighting |
| Privacy | **Show my country on my profile** (off by default) |
| Streamer mode | Hides player names and country flags on screen |
| Accessibility | **Colorblind-friendly team colors** (an alternative to teal and pink) |
| **Show hitbox** | Draws an outline of **your torso hitbox where the server thinks you are**, so players can tell when the server is lagging (if the outline trails behind you, the server is slow) |
