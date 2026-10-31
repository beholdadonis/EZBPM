# Prompts for both Claudes

This game is built by two Claudes (details in `GG.md`):

- **Normal Claude**, connected to Roblox Studio, builds what you see: maps,
  props, models, lighting and UI screens. Start every chat with
  **`claudereadgg`**.
- **Claude Code**, working in this repo, writes the code. Start every chat
  with **`codereadgg`**.

Each reads `GG.md`, tells you what it understood, and asks what to begin
with. Give one job at a time and test in Studio before the next.

## Setting up normal Claude (once)

Use the **Claude desktop app** (not the website): only the app can talk to
Roblox Studio on your computer. Ask Claude Code for the
**normal-claude-project.zip** pack; it has every file below, already
sorted.

1. **Connect Studio to Claude:** open your place in Roblox Studio, open the
   **⋯** menu, choose **Manage MCP Servers**, turn on **Enable Studio as
   MCP server**, and connect **Claude Desktop** (quick connect). A green
   light means it worked. Restart Claude Desktop if Studio doesn't show up
   in Claude.
2. In the Claude app, click **Projects** → **+ New Project** and name it.
3. Click **+** in the project's knowledge panel and add these 30 files:
   - `GG.md` and `docs/GAME_DESIGN.md`
   - the 4 floor plans in `docs/maps/` (3 play place floors and the office)
   - the 9 mockups in `docs/mockups/`
   - the 15 Goofy Gorillas screenshots listed in `GG.md` 3.1
   Keep the other 38 screenshots in a folder and drag one into a chat when
   Claude asks for it. Too many pictures fill up Claude's memory.
4. Click **Set project instructions**, paste this, and save:
   > When I say claudereadgg, read GG.md from the project files from top to
   > bottom, look at all the pictures in the project, then ask me what to
   > begin with, exactly as GG.md says. Follow GG.md's building rules for
   > everything you build in Roblox Studio.
5. Start a chat in the project and type **claudereadgg**.

Whenever `GG.md` changes, delete the old copy from the project and add the
new one.

## A good order

1. **Normal Claude:** the office lobby (`GG.md` Part 4) and the play
   place greybox (Part 3, step 1).
2. **Claude Code:** Milestone 1.
3. **Normal Claude:** the squeaky hammer (Part 5).
4. **Claude Code:** Milestones 2, 3 and 4.
5. **Normal Claude:** the HUD, Results, Bonked and CardReveal screens
   (Part 6).
6. **Claude Code:** Milestone 5, and so on.
7. **Normal Claude:** the rest of the play place (Part 3, steps 2 to 8)
   whenever you like.

## Normal Claude prompts

After `claudereadgg`, pick from its menu, for example:

> Build the office lobby (Part 4).

> Build the play place greybox (Part 3, step 1).

> Do the next play place step.

> Make the squeaky hammer (Part 5.1).

> Build the Hud screen (Part 6).

## Claude Code prompts

After `codereadgg`:

**1. Office and match loop**

> Build Milestone 1: the match loop with a placeholder mode, exactly as
> section 5 describes (doors open after the map loads, 5 rounds per match,
> mode vote each round, results pause on the map, back to the office for a
> 40-second intermission with the map vote in the last 15 seconds, late
> joiners, AFK toggle and detection). Use the office lobby and the
> play place greybox normal Claude built. Replace the sample Hello scripts.
> Tell me how to test it with 2 players in Studio.

**2. Hide and seek**

> Build Milestone 2: the hide and seek core from section 7.1, using the
> squeaky hammer in ReplicatedStorage.Assets.Tools. Tell me how to test it
> with 3 players.

**3. Movement**

> Build Milestone 3: the movement kit from section 6 and the camera rules
> from section 4, including the flashstep exactly as section 6 describes.

**4 onward**

> Build Milestone N from docs/GAME_DESIGN.md.

## Adding or changing game info

Tell either Claude (Claude Code is best, since it can edit the files):

> Here's new info about the game: [your info]. Update docs/GAME_DESIGN.md
> (and GG.md if it's about building) first and show me what changed, then
> we'll build it.

## Describing bugs

Claude does best with specifics. Include:

- **What you did:** "I started a test with 3 players and the seeker bonked
  someone."
- **What you expected:** "They should have ragdolled and become a seeker."
- **What happened:** "They ragdolled but stayed a hider."
- **Any red text from the Output window,** copied exactly.

For new ideas, describe what the player experiences, not how to code it:

- Good: "When someone gets bonked, play a big squeak, show 'BONKED!' on
  their screen, and shake the seeker's camera a little."
- Too vague: "Make bonking better."
