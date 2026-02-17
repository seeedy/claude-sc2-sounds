#!/usr/bin/env bash
# Play a random SC2 sound for the given event type.
# Usage: play-sound.sh <event>
#   event: session-start | permission | stop

set -euo pipefail

EVENT="${1:-}"
if [[ -z "$EVENT" ]]; then
  exit 0
fi

# Read race preference (default: terran)
RACE_FILE="$HOME/.claude/sc2-race"
if [[ -f "$RACE_FILE" ]]; then
  RACE=$(cat "$RACE_FILE")
else
  RACE="terran"
fi

# Resolve plugin root
PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}"
SOUND_DIR="$PLUGIN_ROOT/sounds/$RACE/$EVENT"

# Bail silently if directory is missing or empty
if [[ ! -d "$SOUND_DIR" ]]; then
  exit 0
fi

# Glob mp3 files
shopt -s nullglob
FILES=("$SOUND_DIR"/*.mp3)
shopt -u nullglob

if [[ ${#FILES[@]} -eq 0 ]]; then
  exit 0
fi

# Pick a random file and play it in the background
PICK="${FILES[$((RANDOM % ${#FILES[@]}))]}"
afplay "$PICK" &

exit 0
