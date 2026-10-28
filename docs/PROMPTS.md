# Prompts for Claude Code

Copy one prompt at a time into Claude Code (run from this repo). Test in Studio
before moving to the next one.

## Milestone prompts

**1. Round system**

> Read CLAUDE.md and docs/GAME_DESIGN.md. Build Milestone 1: the round system
> skeleton with lobby, intermission with a mode vote, a placeholder mode that
> just waits 30 seconds, and a results screen, then loop. Replace the sample
> Hello scripts. Tell me how to test it with 2 players in Studio.

**2. Hide and Seek**

> Build Milestone 2: Hide and Seek with both the Infection and Classic
> variants, exactly as the design doc describes. Also give me a script I can
> paste into Studio's command bar that builds a simple greybox test map with
> the right tags, so I can test before the real map exists.

**3. Movement**

> Build Milestone 3: sprint with stamina, crouch, trampolines, slides and ball
> pit zones, using the tags from the design doc. Tell me exactly how to set up
> and tag a trampoline, a slide and a ball pit in Studio.

**4. Real map**

> I've started building the real map in Studio. Give me a checklist of every
> tag I need to place, how many of each, and how to check nothing is missing.
> Then add a server check that warns in the Output window if a required tag is
> missing.

**5. Combat modes**

> Build Milestone 5: Dodgeball Frenzy and Glove Brawl, plus the item system
> for dodgeballs and boxing gloves. All hits must be validated on the server.

**6 to 9:** use the same pattern: "Build Milestone N from the design doc."

## Describing changes and bugs

Claude does best with specifics. Include:

- **What you did:** "I started a test with 3 players and the seeker tagged
  someone."
- **What you expected:** "They should have become a seeker."
- **What happened:** "Nothing happened, and the timer kept going."
- **Any red text from the Output window,** copied exactly.

For new ideas, say what the player experiences, not how to code it:

- Good: "When someone gets tagged, play a funny squeak, show 'CAUGHT!' over
  their head for 2 seconds, and shake the seeker's camera a little."
- Too vague: "Make tagging better."

To change the game's rules, ask Claude to update `docs/GAME_DESIGN.md` first,
then build from it, so the doc always matches the game.
