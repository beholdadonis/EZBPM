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

## 5. Session flow

### The office (lobby)

Everyone spawns in an **office**. (Not a bathroom: Roblox restricts
experiences set in private spaces like bathrooms to ID-verified 17+ users.)

The office has:
- **Big double doors on one wall**, with the countdown above them.
- **Vending machines:** walk up to one to open the **shop**.
- **Lockers:** walk up to one to **equip** titles, hammer skins, afterimage
  colors, emotes and taunts.
- **Map vote board.**
- **A TV showing the current round live**, for late joiners and AFK players.
- **Leaderboards** (see section 13).
- Space to hang out. **Mini activities: decided later.**

### Match loop

1. **Map loads behind the office doors.** Once the map has fully loaded for
   players, **the doors swing open**.
2. Players walk through into the map's **entrance hallway** (cubbies, shoe
   racks, sign-in desk), which opens into the play area.
3. **A match is 5 rounds on the same map.** Before each round, players
   **vote on the mode** (only modes, never the map, between rounds).
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

**Results screen stats**
- Hiders: time hidden, close calls, flashsteps, taunts, points, coins.
- Seekers: bonks, best streak, points, coins.
- A **Round MVP** card for the top scorer.

### 7.2 Fighting (launch mode 2)

- **Free for all, one-hit KO.**
- **Win:** first to **10 KOs**, or the most KOs when the **3-minute** timer
  ends.
- **Weapons:** everyone starts with **boxing gloves**. Pickups around the map:
  **squeaky hammers, dodgeballs**, and the hide and seek items (banana peel,
  decoy balloon).
- **Defense:** the **flashstep** is the main dodge, plus **spawn protection**
  for 2 seconds **(suggested)** after respawning.
- **Respawn time:** 4 seconds.
- Third-person camera with the max zoom limit.

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

### 9.2 Trampoline park

- Trampoline grid, foam pit (dive in to hide), ninja course (swinging ropes,
  rings, balance beams), trampoline dodgeball court, bouldering climbing wall.

### 9.3 Family fun center

- Laser tag maze (dark, neon, great for hiding), arcade floor,
  glow-in-the-dark mini golf.

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
| `DimmableLight` | Lights that can be dimmed or flicker in the lighting variation |

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

The mockups use stand-in backgrounds; only the UI is the target.

## 11. Shop, lockers and cosmetics

- **Unlockables:** titles, squeaky hammer skins, flashstep afterimage colors,
  emotes and taunt sounds, and **player list banners**. **No trails.**
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
| **PS Plus** | In the owner's private server: pick the map, mode, cards and timers | **200 R$** |

**Private servers** are available. Without PS Plus they play exactly like
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
- Hammer skins and titles unlock at milestone levels.
- At 100, players can **prestige** back to level 1 for a special badge and
  title.

## 13. Retention and community

- **Daily rewards** with a 7-day streak (day 7 is the big one).
- **Daily and weekly quests** (for example "Bonk 10 hiders", "Survive 3
  rounds").
- **Leaderboards** in the office (wins, bonks, time hidden).
- **Seasonal events** with limited cosmetics and map decorations.
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
7. **Rule-change cards** and the map lighting variation.
8. **Saving and progression:** coins, XP, levels, prestige.
9. **Shop, lockers and cosmetics** (including banners), game passes, coin
   packs, PS Plus private server settings, and the **top-right player list
   with profile cards**.
10. **Retention:** daily rewards, quests, leaderboards, badges, group perks,
    tips for new players.
11. **Mobile and console controls,** key rebinding.
12. **Maps** (built by the owner in Studio): play place small and big,
    trampoline park, family fun center.
13. **Polish and launch prep.**

## 17. Still to decide

- Game name.
- Office mini activities.
- More rule-change cards.
- Real prices for items, passes and coin packs.
- Details for later modes (dodgeball, prop hunt, tag, hot potato).
