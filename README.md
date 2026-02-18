# SC2 Sounds for Claude Code

StarCraft II sound effects that play on Claude Code events. Hear Terran (or Protoss/Zerg) voice lines when your session starts, a permission prompt appears, or a task completes.

## Install

```bash
claude plugin add seeedy/claude-sc2-sounds
```

## Events

| Event | Hook | Example sounds |
|-------|------|---------------|
| Session start | `SessionStart` | "Battlecruiser operational", "Good day, commander" |
| Permission prompt | `PermissionRequest` | "Anytime you're ready", "I'm waiting on you" |
| Task complete | `Stop` | "Research complete", "Upgrade complete" |

## Change race

Use the slash command inside Claude Code:

```
/sc2-sounds:race
```

Pick Terran, Protoss, or Zerg. Your choice is saved to `~/.claude/sc2-race` and takes effect immediately.

The default race is **Terran**.

## Add your own sounds

Drop `.mp3` files into the appropriate directory:

```
sounds/<race>/<event>/your-sound.mp3
```

Races: `terran`, `protoss`, `zerg`
Events: `session-start`, `permission`, `stop`

A random file from the matching directory plays each time.

## Requirements

- macOS (uses `afplay` for audio playback)
- Claude Code with plugin support

## License

MIT
