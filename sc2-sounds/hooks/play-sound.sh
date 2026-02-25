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

# Read volume preference (default: 100)
VOLUME_FILE="$HOME/.claude/sc2-volume"
if [[ -f "$VOLUME_FILE" ]]; then
  VOLUME=$(cat "$VOLUME_FILE")
else
  VOLUME=100
fi

if command -v afplay &>/dev/null; then
  AFPLAY_VOL=$(awk "BEGIN {printf \"%.2f\", $VOLUME / 100}")
  afplay -v "$AFPLAY_VOL" "$PICK" &
elif command -v paplay &>/dev/null; then
  PAPLAY_VOL=$(( VOLUME * 655 ))
  paplay --volume="$PAPLAY_VOL" "$PICK" &
elif command -v aplay &>/dev/null; then
  aplay "$PICK" &
else
  echo "sc2-sounds: no audio player found (need afplay, paplay, or aplay)" >&2
  exit 0
fi

exit 0
