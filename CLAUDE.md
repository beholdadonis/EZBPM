# CLAUDE.md

Roblox game project. The full game design is in `docs/GAME_DESIGN.md`; read it
before working on any gameplay feature and follow it. UI mockups to match are
in `docs/mockups/`. Map layouts (floor plans with exact positions) are in
`docs/maps/`, with a `*-look.md` file per map describing how it should look.
Reference screenshots of Goofy Gorillas (the game this is inspired by) are
listed in `docs/reference/goofy-gorillas.md`; download them with
`bash docs/reference/get-goofy-gorillas-screenshots.sh` and use them for the
feel only, never to copy anything. Ready-made prompts for each milestone are
in `docs/PROMPTS.md`.

## Keep the design doc current

Whenever the owner shares new information about the game (a new rule, a
change of mind, a new mode, numbers, names), update `docs/GAME_DESIGN.md`
first, then build from it. If new info conflicts with the doc, ask which one
is right before changing anything. Mark any number you pick yourself as
**(suggested)**.

## Don't build

- **Admin system:** the owner will bring over the admin system from their
  other game, WYR: Disasters. Leave room for it, but don't build one.

## The person you're working with

The owner is new to coding. Explain changes in plain language, say exactly
where things show up in Roblox Studio, and give step-by-step instructions for
anything they need to do in Studio themselves (tagging parts, changing game
settings, testing).

## Stack

- Luau, synced into Roblox Studio with Rojo 7.7.1 (pinned in `rokit.toml`).
- Only code lives in this repo. The map, models and lighting are built by hand
  in Studio and live in the place file, not here.

## Layout

| Folder | Appears in Studio as | Put here |
|---|---|---|
| `src/server` | `ServerScriptService.Server` | Round system, modes, data saving, anything authoritative |
| `src/client` | `StarterPlayer.StarterPlayerScripts.Client` | Input, camera, UI, local movement effects |
| `src/shared` | `ReplicatedStorage.Shared` | Config, shared types, remotes setup, helpers used by both |

File suffixes set the script type: `*.server.luau` is a `Script`,
`*.client.luau` is a `LocalScript`, plain `*.luau` is a `ModuleScript`.
Use one entry Script per side (`Main.server.luau`, `Main.client.luau`) that
requires ModuleScripts; don't scatter many top-level scripts.

## Rules

- Start every file with `--!strict` and keep type errors at zero.
- Server-authoritative: the client only sends requests; the server validates
  distance, cooldowns, role and round state before acting. Never trust values
  sent by the client.
- Rate-limit every RemoteEvent and RemoteFunction.
- Find map pieces with CollectionService tags (listed in the design doc), never
  by part names or hard-coded positions.
- All tunable numbers go in `src/shared/Config.luau`.
- Each game mode is a ModuleScript in `src/server/Modes/` with the same
  interface, registered with the round system. Each rule-change card is a
  ModuleScript in `src/server/Cards/`.
- The game must work on PC, mobile and console: every action needs keyboard,
  touch and controller input, and keys must be rebindable.
- Wrap DataStore calls in `pcall` with retries; save on leave and on
  `game:BindToClose`.
- Don't use deprecated APIs (`wait`, `spawn`, `delay`); use `task.*`.

## Checking your work

- `rojo build -o EZBPM.rbxl` must succeed after every change.
- Gameplay can only be tested in Studio. After each feature, give the owner a
  short test checklist: how to start a test server with 2+ players
  (Test tab, Clients and Servers), and what they should see.
- For UI work, compare against the matching image in `docs/mockups/`.

## Workflow

- Work one milestone (from the design doc) at a time and stop for the owner to
  test before starting the next.
- If the design doc doesn't answer something, pick the simplest option that
  fits the design pillars and say what you chose.
