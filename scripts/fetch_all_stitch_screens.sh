#!/usr/bin/env bash
# Batch-download Stitch screens listed in stitch_screens_manifest.json
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
exec python3 scripts/download_stitch_screens.py
