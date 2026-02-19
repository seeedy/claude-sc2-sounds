---
name: race
description: Use when the user says "change race", "switch to protoss/zerg/terran", "set SC2 race", or "/sc2-sounds:race". Lets the user pick their StarCraft II race for Claude Code sound effects.
---

# SC2 Sound Race Selector

When the user invokes this skill, present a race selection using AskUserQuestion:

- **Terran** — Marine and command center sounds (default)
- **Protoss** — Probe and nexus sounds
- **Zerg** — Drone and hatchery sounds

After the user picks a race, run the set-race script with their choice (lowercase: `terran`, `protoss`, or `zerg`):

```bash
bash ${CLAUDE_PLUGIN_ROOT}/hooks/set-race.sh <race>
```

Then tell the user their race and spinner verbs have been updated. The new sounds take effect on the next Claude Code event (no restart needed). The spinner verbs take effect immediately.
