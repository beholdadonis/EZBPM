# Prompts for Claude Code

Copy one prompt at a time into Claude Code (run from this repo). Test in Studio
before moving to the next one. Milestone numbers match section 16 of
`docs/GAME_DESIGN.md`.

## Milestone prompts

**1. Office and match loop**

> Read CLAUDE.md and docs/GAME_DESIGN.md. Build Milestone 1: the office lobby
> and match loop with a placeholder mode, exactly as section 5 describes
> (doors open after the map loads, 5 rounds per match, mode vote each round,
> results pause on the map, back to the office for a 40-second intermission
> with the map vote in the last 15 seconds, late joiners, AFK toggle and
> detection). Replace the sample Hello scripts. Give me a command-bar script
> that builds a simple greybox office and test map with the right tags, and
> tell me how to test it with 2 players in Studio.

**2. Hide and seek**

> Build Milestone 2: the hide and seek core from section 7.1 on the greybox
> test map. Tell me how to test it with 3 players.

**3. Movement**

> Build Milestone 3: the movement kit from section 6 and the camera rules
> from section 4, including the flashstep exactly as section 6 describes.
> Tell me how to tag climbable nets, slides and trampolines.

**Greybox play place map**

> Read docs/maps/play-place.md and the floor plan pictures in docs/maps/.
> Write a script I can paste into Studio's command bar that builds the
> greybox play place (big and small versions) in ServerStorage.Maps with
> all the tags. Tell me exactly how to run it.

**4 onward**

> Build Milestone N from docs/GAME_DESIGN.md.

For the UI milestone, add: "Match the images in docs/mockups/."

## Adding or changing game info

> Here's new info about the game: [your info]. Update docs/GAME_DESIGN.md
> first and show me what changed, then we'll build it.

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
