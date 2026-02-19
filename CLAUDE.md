# SC2 Sounds Plugin

## Plugin Structure

- Marketplace manifest: `.claude-plugin/marketplace.json` (repo root)
- Plugin manifest + all assets: `sc2-sounds/plugin.json`, `sc2-sounds/hooks/`, `sc2-sounds/sounds/`, `sc2-sounds/skills/`
- The `source` field in marketplace.json must be `"./sc2-sounds"` (a subdirectory containing `plugin.json` at its root — NOT inside `.claude-plugin/`)

## How /race works

The `/sc2-sounds:race` skill (defined in `sc2-sounds/skills/race/SKILL.md`) does two things when the user picks a race:

1. Writes the race to `~/.claude/sc2-race` (used by the sound hook)
2. Updates `spinnerVerbs` in `~/.claude/settings.json` with race-themed verbs

## Install Commands

```
claude plugin marketplace add seeedy/claude-sc2-sounds
claude plugin install sc2-sounds
```
