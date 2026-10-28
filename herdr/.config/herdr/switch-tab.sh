#!/usr/bin/env bash
# Focus the Nth tab (1-based, in display order) of the focused workspace.
# Used by herdr custom command keybindings (see config.toml [[keys.command]]).
set -euo pipefail

index="${1:?usage: switch-tab.sh <index>}"

tab_id=$(herdr api snapshot | python3 -c "
import json, sys

idx = int(sys.argv[1])
snap = json.load(sys.stdin)['result']['snapshot']
ws = snap['focused_workspace_id']
tabs = sorted(
    (t for t in snap['tabs'] if t['workspace_id'] == ws),
    key=lambda t: t['number'],
)
if idx - 1 < len(tabs):
    print(tabs[idx - 1]['tab_id'])
" "$index")

if [ -n "$tab_id" ]; then
    herdr tab focus "$tab_id"
fi
