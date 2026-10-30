# CLAUDE.md

Roblox game project. The full game design is in `docs/GAME_DESIGN.md`; read it
before working on any gameplay feature and follow it. `GG.md` is the build
guide shared with "normal Claude" (Claude connected to Roblox Studio, which
builds the maps, models and UI layouts): it has the map layout, where every
prop goes, the models, and the exact folder, model and UI names your code
relies on. UI mockups are in `docs/mockups/`, floor plan pictures in
`docs/maps/`. Reference screenshots of Goofy Gorillas (the game this is
inspired by) are listed in `docs/reference/goofy-gorillas.md`; download them
with `bash docs/reference/get-goofy-gorillas-screenshots.sh` and use them for
the feel only, never to copy anything. Ready-made prompts are in
`docs/PROMPTS.md`.

## Trigger word: `codereadgg`

When the owner says **codereadgg**, read `GG.md` in full (plus this file and
`docs/GAME_DESIGN.md`), then do **only coding work** (`GG.md` Part 7). Reply
with a short summary and the coding jobs that are ready, in milestone order,
and ask which to begin with. Never build maps, props, models, lighting or UI
layouts by hand, and never give the owner command-bar scripts that build
them: those are normal Claude's job. If something your code needs isn't
built yet, tell the owner exactly what to ask normal Claude for (which part
of `GG.md`, with names and tags).

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
anything they need to do in Studio themselves (changing game settings,
testing).

## Stack

- Luau, synced into Roblox Studio with Rojo 7.7.1 (pinned in `rokit.toml`).
- Only code lives in this repo. The maps, models, lighting and UI layouts are
  built in Studio by normal Claude (following `GG.md`) and live in the place
  file, not here.

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
  by part names or hard-coded positions. Find assets and UI by the folders
  and names in `GG.md` (2.6 and 6.2).
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
- For UI work, make the screens normal Claude built in `StarterGui` work
  (names in `GG.md` 6.2); they should end up looking like `docs/mockups/`.

## Workflow

- Work one milestone (from the design doc) at a time and stop for the owner to
  test before starting the next.
- If the design doc doesn't answer something, pick the simplest option that
  fits the design pillars and say what you chose.
