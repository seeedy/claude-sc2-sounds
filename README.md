# SC2 Sounds for Claude Code

StarCraft II sound effects that play on Claude Code events. Hear Terran, Protoss, or Zerg voice lines when your session starts, a permission prompt appears, or a task completes.

## Install

```bash
claude plugin marketplace add seeedy/claude-sc2-sounds
claude plugin install sc2-sounds
```

## Events

| Event | Hook | Example sounds |
|-------|------|---------------|
| Session start | `SessionStart` | Marine ready lines, Zealot warp-in, Zergling screeches |
| Permission prompt | `PermissionRequest` | Medivac callouts, Probe chirps, Drone sounds |
| Task complete | `Stop` | "Research complete", "Upgrade complete", "Additional pylons" |

## Change race

Use the slash command inside Claude Code:

```
/sc2-sounds:race
```

Pick Terran, Protoss, or Zerg. Your choice is saved to `~/.claude/sc2-race` and takes effect immediately.

Switching race also updates your Claude Code **spinner verbs** — see below.

The default race is **Terran**.

## Spinner Verbs

When you pick a race, the plugin replaces Claude Code's default spinner verbs (the text shown while Claude is thinking) with race-themed lines. Each race has 18 unique verbs:

| Race | Example verbs |
|------|--------------|
| Terran | Stimming marines, Calling down MULEs, Sieging tanks, Charging Yamato cannon |
| Protoss | Constructing additional pylons, Warping in zealots, Blinking stalkers, Storming bio ball |
| Zerg | Spawning more overlords, Injecting larvae, Morphing banelings, Nydus worming behind base |

The verbs are written to `spinnerVerbs` in `~/.claude/settings.json` and take effect immediately — no restart needed.

## Add your own sounds

Drop `.mp3` files into the appropriate directory:

```
sounds/<race>/<event>/your-sound.mp3
```

Races: `terran`, `protoss`, `zerg`
Events: `session-start`, `permission`, `stop`

A random file from the matching directory plays each time.

## Requirements

- macOS (`afplay`) or Linux (`paplay` / `aplay`)
- Claude Code with plugin support

## License

MIT
