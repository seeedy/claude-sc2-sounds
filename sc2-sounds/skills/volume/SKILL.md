---
name: volume
description: Use when the user says "change volume", "set volume", "turn down sounds", "adjust SC2 volume", or "/sc2-sounds:volume". Lets the user pick the volume level for SC2 sound effects.
---

# SC2 Sound Volume Control

When the user invokes this skill, present a volume selection using AskUserQuestion:

- **Low** — 25% volume, for quiet environments
- **Medium** — 50% volume, a balanced level
- **High** — 75% volume, for when you want to hear it clearly
- **Max** — 100% volume, full blast (default)

After the user picks a level, run the set-volume script with their choice (lowercase: `low`, `medium`, `high`, or `max`):

```bash
bash ${CLAUDE_PLUGIN_ROOT}/hooks/set-volume.sh <level>
```

Then tell the user their volume has been updated. The new volume takes effect on the next sound event (no restart needed).

Note: On Linux with ALSA (`aplay`), volume control is not available — sounds play at system volume regardless of this setting.
