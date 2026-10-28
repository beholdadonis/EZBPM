# Game Design: Playplace Panic (working title)

> Rename this anytime. The name only appears in this doc and in-game UI text.

## Pitch

A goofy multiplayer party game set in a giant indoor kids' playground after
hours. Up to 10 friends run, slide, bounce and crawl through a huge neon jungle
gym playing hide and seek, dodgeball and fistfights. The fun comes from chaos
with friends, not from skill or grinding.

Inspired by the *feel* of the Steam game **Goofy Gorillas** (as seen in SMii7Y's
videos). This game must be original: its own name, map, art, sounds and UI. Do
not copy that game's name, assets or text.

## Design pillars

1. **Chaos with friends.** Every mode should create funny moments to talk
   about. Physics, knockback and bad hiding spots are features.
2. **Childhood nostalgia.** Ball pits, tube slides, nets, trampolines,
   birthday-party rooms, arcade tokens.
3. **Easy to understand in 5 seconds.** One-line rules per mode, shown on
   screen at the start of each round.
4. **Short rounds.** 2 to 4 minutes, then straight into the next one.

## Players and social

- 2 to 10 players per server (set Max Players to 10 in Game Settings).
- Roblox's built-in voice chat is already proximity-based for players who have
  it enabled, so we do not build our own voice system. Text chat works as
  normal. The game must be fully playable without voice.

## Characters

- Everyone spawns as the same plain, blank mannequin-style character (a custom
  `StarterCharacter`). This is the goofy look and keeps hiding fair.
- Players personalise the mannequin with unlockable cosmetics: hats, hair,
  glasses, shirts, pants, shoes.
- Display names float above heads in the lobby, but are hidden during hide and
  seek rounds.

## Movement

| Action | How it works |
|---|---|
| Run / jump | Normal Roblox controls. |
| Sprint | Hold Shift. Uses a stamina bar that refills when not sprinting. |
| Crouch / crawl | Hold C or Ctrl. Lower and slower, fits through crawl tubes. |
| Slides | Roblox characters don't slide down slopes on their own, so slides need a small custom mechanic: entering a slide pushes the player along it, faster on steeper sections. |
| Trampolines | Touching one launches the player upward. Runs in a LocalScript, because each player's own client controls their character's physics. |
| Ball pits | Player sinks to chest height, moves slowly and is harder to see. Use anchored decorative balls plus an invisible "submerge zone", never thousands of loose physics balls (that would lag the server). |

## The map: the jungle gym

One big multi-floor indoor play place, lit by neon pink, purple and blue lights
with dark padded walls. It should feel slightly creepy after hours.

Areas (build in Roblox Studio, not in code):

- **Main play structure:** 3 floors of platforms, nets, ladders and crawl tubes.
- **Big ball pit** at the back, large enough for a fight arena.
- **Small ball pit** near the entrance.
- **Giant tube slide** from the top floor to the big ball pit, plus 2 smaller
  open slides.
- **Trampoline zone.**
- **Party room** with tables, balloons and a cake.
- **Front desk** with a computer and a sign-in counter.
- **Arcade corner** with a few cabinets and a prize counter.
- **Mini soccer pitch** with goals and a working score display.
- **Bathrooms.**
- **Lobby area** near the entrance where players wait between rounds.

### How code finds map pieces

The map is built by hand in Studio. Code never relies on part names or
positions; it finds pieces by **CollectionService tags** (set in Studio's
Properties panel under Tags):

| Tag | Used for |
|---|---|
| `LobbySpawn` | Where players wait between rounds |
| `HiderSpawn` / `SeekerSpawn` | Round start positions |
| `SeekerHoldingRoom` | Where seekers wait while hiders hide |
| `Trampoline` | Bounce pads |
| `Slide` | Slide paths (a part along the slide's direction) |
| `BallPit` | Invisible submerge zones |
| `ItemSpawn` | Where dodgeballs and other items appear |
| `ArenaZone` | King of the Pit fighting area |
| `CrawlTube` | Crawl-only tunnels |

## Round loop

1. **Intermission (20s):** players hang out in the lobby; a vote shows 3
   random modes.
2. **Mode intro (5s):** big title card with the one-line rules.
3. **Round (2 to 4 min):** the mode runs.
4. **Results (8s):** winners, funny stats ("Most punches", "Longest hider",
   "Fell off the most"), and points earned.
5. Back to intermission.

A round needs at least 2 players. If players leave mid-round and the mode can
no longer continue, it ends early and nobody loses points.

## Game modes (in build order)

### 1. Hide and Seek (first playable mode)

- One seeker per 5 players (1 seeker for 2 to 5 players, 2 for 6 to 10).
- Seekers wait 20 seconds in the holding room while hiders hide.
- Seekers tag hiders by clicking them within 6 studs.
- **Infection variant:** tagged hiders become seekers.
- **Classic variant:** tagged hiders become spectators.
- Hiders win if anyone survives the 3-minute timer. Seekers win if everyone is
  caught.
- When 1 hider is left, they glow faintly every 20 seconds so the round can end.

### 2. Dodgeball Frenzy

- Dodgeballs spawn at `ItemSpawn` points.
- Click to throw. A hit knocks the target back and gives the thrower 100
  points; the target respawns after 3 seconds.
- First to 1,000 points, or the most points when the 3-minute timer ends.

### 3. Glove Brawl

- Everyone gets boxing gloves. Click to punch, with a short cooldown.
- Punches deal knockback, not damage. Three quick hits in a row knock a player
  down for 2 seconds.
- Knocking someone into the ball pit or off a ledge scores a point.

### 4. King of the Pit

- A highlighted zone moves around the map every 30 seconds.
- Earn 1 point per second while standing in it alone.
- Gloves are on, so players can punch each other out.

### Later modes (not now)

- Prop Hunt (hide as playground objects).
- Time Trials (obstacle course runs with a leaderboard).
- After Hours (hide and seek with the lights off and flashlights).
- Co-op zombie survival.

## Items

| Item | Effect |
|---|---|
| Dodgeball | Throwable; knockback on hit |
| Boxing gloves | Fast melee punches with knockback |
| Squeaky hammer | Slow, big knockback, funny sound |
| Banana peel | Placed on the floor; whoever steps on it slips and falls |
| Stink bomb | Thrown; makes a green cloud that blurs the screen of anyone inside |

## Progression

- **Party Points (PP):** earned every round (participation, wins, tags, hits).
  Raise the player's level.
- **Arcade Tokens:** a softer currency earned from levelling up and daily
  play, spent at the prize counter on cosmetics.
- Some cosmetics unlock only from achievements or hidden easter eggs on the
  map.
- Saved with DataStores. No paid items until the game is fun.

## UI style

Not generic. The theme is **"after-hours neon playground"**:

- Dark navy/near-black panels with thick rounded corners and a neon pink or
  cyan outline glow.
- Chunky, bubbly fonts (`FredokaOne` for body text, `LuckiestGuy` for titles).
- Bright accent colours: hot pink `#FF3EA5`, cyan `#3EF2FF`, lime `#B6FF3E`,
  yellow `#FFE03E`.
- Sticker-like icons and slightly tilted title cards, like a kids' party
  flyer.
- Big, readable text: never below 18px, and high contrast on dark panels.

Screens needed: lobby HUD (level, tokens), mode vote, round timer and role
banner ("YOU ARE THE SEEKER"), item hotbar, scoreboard, results screen,
cosmetics menu, settings (sensitivity, music volume).

## Technical rules

- **The server decides everything that matters:** rounds, roles, tags, hits,
  points and saving. The client only sends requests ("I tried to tag this
  player") and the server checks them: distance, cooldowns, correct role,
  round state.
- Rate-limit every RemoteEvent so exploiters can't spam it.
- Each mode is its own ModuleScript with the same shape (start, stop, handle
  player leaving), so new modes plug into the round system.
- All tunable numbers (timers, distances, points) live in one shared config
  module.
- DataStore calls are wrapped in `pcall` with retries, and data is saved on
  leave and on server shutdown.

## Milestones

1. **Round system skeleton:** lobby, intermission, a fake mode that just waits,
   results, back to lobby. Works with 2 players in a Studio test server.
2. **Hide and Seek playable** on a simple test map (greybox parts).
3. **Movement:** sprint and stamina, crouch, trampolines, slides, ball pit
   zones.
4. **Real map** built in Studio and tagged.
5. **Dodgeball Frenzy** and **Glove Brawl.**
6. **Progression and saving:** Party Points, levels, tokens, DataStore.
7. **Cosmetics** and the prize counter.
8. **UI polish,** sounds, music, results screen stats.
9. **King of the Pit,** then later modes.

## Open questions

- Final game name.
- Should players be able to use their own Roblox avatars instead of the
  mannequin, as a setting?
- Target age group (affects voice chat and how chaotic the sounds can be).
