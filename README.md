# EZBPM

A Roblox project synced into Roblox Studio with [Rojo](https://rojo.space).

- Game design: [docs/GAME_DESIGN.md](docs/GAME_DESIGN.md)
- UI mockups: [docs/mockups/](docs/mockups/)
- Prompts for building it with Claude Code: [docs/PROMPTS.md](docs/PROMPTS.md)
- Project rules Claude Code reads automatically: [CLAUDE.md](CLAUDE.md)

## Layout

| Folder        | Shows up in Studio as                                |
| ------------- | ---------------------------------------------------- |
| `src/server`  | `ServerScriptService.Server`                         |
| `src/client`  | `StarterPlayer.StarterPlayerScripts.Client`          |
| `src/shared`  | `ReplicatedStorage.Shared`                           |

File suffixes decide the script type: `*.server.luau` is a `Script`,
`*.client.luau` is a `LocalScript`, and plain `*.luau` is a `ModuleScript`.

## Syncing into Studio

1. Install [Rokit](https://github.com/rojo-rbx/rokit), then run `rokit install`
   in this folder to get the pinned Rojo version.
2. Install the Rojo plugin in Studio (run `rojo plugin install`, or get it from
   the Creator Store).
3. Run `rojo serve` in this folder.
4. In Studio, open the Rojo plugin and click **Connect**. Edits to files under
   `src/` now sync into Studio live.

To build a place file without Studio: `rojo build -o EZBPM.rbxl`.
