#!/usr/bin/env bash
# Set the SC2 sound volume level.
# Usage: set-volume.sh <low|medium|high|max>

set -euo pipefail

LEVEL="${1:-}"

if [[ -z "$LEVEL" ]]; then
  echo "Usage: set-volume.sh <low|medium|high|max>" >&2
  exit 1
fi

# Validate and map level to integer (0-100)
case "$LEVEL" in
  low)    VOLUME=25 ;;
  medium) VOLUME=50 ;;
  high)   VOLUME=75 ;;
  max)    VOLUME=100 ;;
  *)
    echo "Error: invalid volume level '$LEVEL'. Must be low, medium, high, or max." >&2
    exit 1
    ;;
esac

# Write volume preference
VOLUME_FILE="$HOME/.claude/sc2-volume"
mkdir -p "$(dirname "$VOLUME_FILE")"
echo "$VOLUME" > "$VOLUME_FILE"
echo "Saved volume preference: $LEVEL ($VOLUME%)"
