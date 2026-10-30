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

1. In the Claude app, make a **Project** for the game.
2. Download the Goofy Gorillas screenshots: open this folder in a terminal
   (Git Bash on Windows, Terminal on Mac) and run
   `bash docs/reference/get-goofy-gorillas-screenshots.sh`.
3. Add these files to the project:
   - `GG.md`
   - `docs/GAME_DESIGN.md`
   - the 3 floor plans in `docs/maps/`
   - the 9 mockups in `docs/mockups/`
   - the screenshots from `docs/reference/goofy-gorillas/` (all 53, or at
     least the 15 listed in `GG.md` 3.1)
4. Paste this into the project's instructions:
   > When I say claudereadgg, read GG.md from the project files from top to
   > bottom, look at all the pictures, then ask me what to begin with,
   > exactly as GG.md says.
5. Make sure Claude is connected to Roblox Studio (Roblox's Studio MCP) with
   your place open.

Whenever `GG.md` changes, upload the new version to the project.

## A good order

1. **Normal Claude:** placeholder office (`GG.md` Part 4) and the play
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

> Build the placeholder office (Part 4).

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
> joiners, AFK toggle and detection). Use the placeholder office and the
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
