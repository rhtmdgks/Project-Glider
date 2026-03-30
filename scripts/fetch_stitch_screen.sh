#!/usr/bin/env bash
# Stitch: Project Glider — 4269727575092483625
# Screen: B Mart Purchase with Logo — 65f6b546efc446ccae8a6703fb3f6e68
#
# Cursor Stitch MCP가 이 프로젝트에 접근할 수 없을 때(permission), Stitch 웹에서
# 화면 HTML 내보내기 / 개발자도구 Network에서 htmlCode.downloadUrl 을 복사해 사용하세요.
#
# 사용법:
#   export STITCH_HTML_URL='https://contribution.usercontent.google.com/download?...'
#   export STITCH_SCREENSHOT_URL='https://...'   # 선택
#   ./scripts/fetch_stitch_screen.sh
#
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="${ROOT}/assets/stitch/project_4269727575092483625/screen_65f6b546efc446ccae8a6703fb3f6e68"
mkdir -p "$OUT"

if [[ -z "${STITCH_HTML_URL:-}" ]]; then
  echo "STITCH_HTML_URL 이 비어 있습니다. Stitch에서 get_screen / 내보내기로 받은 HTML 다운로드 URL을 설정하세요." >&2
  exit 1
fi

echo "Downloading HTML..."
curl -fsSL "$STITCH_HTML_URL" -o "$OUT/screen.html"

if [[ -n "${STITCH_SCREENSHOT_URL:-}" ]]; then
  echo "Downloading screenshot..."
  curl -fsSL "$STITCH_SCREENSHOT_URL" -o "$OUT/screenshot.png"
fi

echo "Extracting image URLs from HTML (requires Python 3)..."
export OUT
python3 <<'PY'
import re, pathlib, urllib.request, os

out = pathlib.Path(os.environ["OUT"])
html = (out / "screen.html").read_text(encoding="utf-8", errors="replace")
urls = set(re.findall(r'https://[^\s"\'<>]+', html))
candidates = []
for u in urls:
    u = u.rstrip(').,;')
    if "googleusercontent" in u or re.search(r"\.(png|jpe?g|webp|gif|svg)(\?|$)", u, re.I):
        candidates.append(u)

for i, u in enumerate(sorted(candidates)):
    try:
        tail = u.split("/")[-1].split("?")[0][:80] or f"asset_{i}"
        safe = re.sub(r"[^\w.\-]", "_", tail)
        path = out / f"img_{i}_{safe}"
        urllib.request.urlretrieve(u, path)
        print("OK", path.name)
    except Exception as e:
        print("SKIP", u[:72], e)
PY

echo "Done: $OUT"
