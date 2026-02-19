#!/usr/bin/env bash
# Set the SC2 race preference and update spinner verbs.
# Usage: set-race.sh <terran|protoss|zerg>

set -euo pipefail

RACE="${1:-}"

if [[ -z "$RACE" ]]; then
  echo "Usage: set-race.sh <terran|protoss|zerg>" >&2
  exit 1
fi

# Validate race
case "$RACE" in
  terran|protoss|zerg) ;;
  *)
    echo "Error: invalid race '$RACE'. Must be terran, protoss, or zerg." >&2
    exit 1
    ;;
esac

# Step 1: Write race preference
RACE_FILE="$HOME/.claude/sc2-race"
mkdir -p "$(dirname "$RACE_FILE")"
echo "$RACE" > "$RACE_FILE"
echo "Saved race preference: $RACE"

# Step 2: Update spinnerVerbs in settings.json
SETTINGS_FILE="$HOME/.claude/settings.json"

if ! command -v jq &>/dev/null; then
  echo "Warning: jq is not installed — skipping spinner verbs update." >&2
  echo "Install jq to enable race-themed spinner verbs." >&2
  exit 0
fi

# Build the verbs JSON for the chosen race
case "$RACE" in
  terran)
    VERBS_JSON='["Calling down MULEs","Dropping supply depots","Scanning for cloaked units","Loading up medivacs","Stimming marines","Sieging tanks","Training SCVs","Repairing command center","Building a bunker","Researching combat shields","Locking on with vikings","Boosting orbital command","Charging Yamato cannon","Lifting off barracks","Walling off the natural","Reactor-swapping factory","Kiting with reapers","Cloaking banshees"]'
    ;;
  protoss)
    VERBS_JSON='["Constructing additional pylons","Warping in zealots","Chronoboosting nexus","Researching blink","Opening warp gates","Recalling to nexus","Forging upgrades","Summoning archons","Cloaking dark templar","Storming bio ball","Charging void rays","Activating mothership","Scouting with observers","Feedbacking ghost","Blinking stalkers","Cannon rushing","Photon overcharging","Shading across the map"]'
    ;;
  zerg)
    VERBS_JSON='["Spawning more overlords","Injecting larvae","Spreading creep tumors","Morphing banelings","Burrowing roaches","Researching metabolic boost","Mutating into a lair","Neural parasiting thor","Transfusing ultralisk","Rushing with zerglings","Nydus worming behind base","Morphing brood lords","Spawning changelings","Contaminating starport","Abducting with vipers","Dropping creep on ramp","Hatching more drones","Overlord dropping lings"]'
    ;;
esac

SPINNER_VERBS=$(jq -n --argjson verbs "$VERBS_JSON" '{"mode":"replace","verbs":$verbs}')

# Create settings file if it doesn't exist
if [[ ! -f "$SETTINGS_FILE" ]]; then
  echo '{}' > "$SETTINGS_FILE"
fi

# Merge spinnerVerbs into existing settings
UPDATED=$(jq --argjson sv "$SPINNER_VERBS" '.spinnerVerbs = $sv' "$SETTINGS_FILE")
echo "$UPDATED" > "$SETTINGS_FILE"
echo "Updated spinner verbs for $RACE"
