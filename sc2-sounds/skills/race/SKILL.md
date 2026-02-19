---
name: race
description: Use when the user says "change race", "switch to protoss/zerg/terran", "set SC2 race", or "/sc2-sounds:race". Lets the user pick their StarCraft II race for Claude Code sound effects.
---

# SC2 Sound Race Selector

When the user invokes this skill, present a race selection using AskUserQuestion:

- **Terran** — SCV and command center sounds (default)
- **Protoss** — Probe and nexus sounds
- **Zerg** — Drone and hatchery sounds

After the user picks a race, write their choice (lowercase: `terran`, `protoss`, or `zerg`) to `~/.claude/sc2-race`:

```bash
echo "<race>" > ~/.claude/sc2-race
```

Confirm the change. The new race takes effect on the next Claude Code event (no restart needed).
