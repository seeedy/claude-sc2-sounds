---
name: race
description: Use when the user says "change race", "switch to protoss/zerg/terran", "set SC2 race", or "/sc2-sounds:race". Lets the user pick their StarCraft II race for Claude Code sound effects.
---

# SC2 Sound Race Selector

When the user invokes this skill, present a race selection using AskUserQuestion:

- **Terran** — SCV and command center sounds (default)
- **Protoss** — Probe and nexus sounds
- **Zerg** — Drone and hatchery sounds

After the user picks a race:

## 1. Save the race preference

Write their choice (lowercase: `terran`, `protoss`, or `zerg`) to `~/.claude/sc2-race`:

```bash
echo "<race>" > ~/.claude/sc2-race
```

## 2. Update spinner verbs

Read `~/.claude/settings.json`, replace the `spinnerVerbs` key with the matching race verbs below, and write the file back. Preserve all other settings exactly as they are.

### Terran spinner verbs

```json
{
  "mode": "replace",
  "verbs": [
    "Calling down MULEs",
    "Dropping supply depots",
    "Scanning for cloaked units",
    "Loading up medivacs",
    "Stimming marines",
    "Sieging tanks",
    "Training SCVs",
    "Repairing command center",
    "Building a bunker",
    "Researching combat shields",
    "Locking on with vikings",
    "Boosting orbital command",
    "Charging Yamato cannon",
    "Lifting off barracks",
    "Walling off the natural",
    "Reactor-swapping factory",
    "Kiting with reapers",
    "Cloaking banshees"
  ]
}
```

### Protoss spinner verbs

```json
{
  "mode": "replace",
  "verbs": [
    "Constructing additional pylons",
    "Warping in zealots",
    "Chronoboosting nexus",
    "Researching blink",
    "Opening warp gates",
    "Recalling to nexus",
    "Forging upgrades",
    "Summoning archons",
    "Cloaking dark templar",
    "Storming bio ball",
    "Charging void rays",
    "Activating mothership",
    "Scouting with observers",
    "Feedbacking ghost",
    "Blinking stalkers",
    "Cannon rushing",
    "Photon overcharging",
    "Shading across the map"
  ]
}
```

### Zerg spinner verbs

```json
{
  "mode": "replace",
  "verbs": [
    "Spawning more overlords",
    "Injecting larvae",
    "Spreading creep tumors",
    "Morphing banelings",
    "Burrowing roaches",
    "Researching metabolic boost",
    "Mutating into a lair",
    "Neural parasiting thor",
    "Transfusing ultralisk",
    "Rushing with zerglings",
    "Nydus worming behind base",
    "Morphing brood lords",
    "Spawning changelings",
    "Contaminating starport",
    "Abducting with vipers",
    "Dropping creep on ramp",
    "Hatching more drones",
    "Overlord dropping lings"
  ]
}
```

## 3. Confirm

Tell the user their race and spinner verbs have been updated. The new sounds take effect on the next Claude Code event (no restart needed). The spinner verbs take effect immediately.
