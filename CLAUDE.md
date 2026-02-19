# SC2 Sounds Plugin

## Plugin Structure

- Marketplace manifest: `.claude-plugin/marketplace.json` (repo root)
- Plugin manifest + all assets: `sc2-sounds/.claude-plugin/plugin.json`, `sc2-sounds/hooks/`, `sc2-sounds/sounds/`, `sc2-sounds/skills/`
- The `source` field in marketplace.json must be `"./sc2-sounds"` (a subdirectory containing `.claude-plugin/plugin.json`)

## Install Commands

```
claude plugin marketplace add seeedy/claude-sc2-sounds
claude plugin install sc2-sounds
```
