#!/usr/bin/env python3
"""Download Stitch screen.html, screenshot.png, and extract embedded images. Run from repo root.

새 screen_* 폴더가 생기면 pubspec.yaml의 flutter.assets에 그 디렉터리 경로(끝에 /)를
추가해야 이미지가 앱 번들에 포함됩니다. 상위 project 폴더 한 줄만으로는 하위 폴더가 빠집니다.
"""
from __future__ import annotations

import json
import re
import subprocess
import sys
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
STITCH_ROOT = ROOT / "assets" / "stitch" / "project_4269727575092483625"
MANIFEST = Path(__file__).parent / "stitch_screens_manifest.json"


def curl_download(url: str, dest: Path) -> None:
    dest.parent.mkdir(parents=True, exist_ok=True)
    subprocess.run(
        ["curl", "-fsSL", url, "-o", str(dest)],
        check=True,
    )


def extract_images(html_path: Path, out_dir: Path) -> None:
    html = html_path.read_text(encoding="utf-8", errors="replace")
    urls = set(re.findall(r"https://[^\s\"'<>]+", html))
    candidates: list[str] = []
    for u in urls:
        u = u.rstrip(").,;")
        if "googleusercontent" in u or re.search(r"\.(png|jpe?g|webp|gif|svg)(\?|$)", u, re.I):
            candidates.append(u)
    out_dir.mkdir(parents=True, exist_ok=True)
    for i, u in enumerate(sorted(candidates)):
        try:
            tail = u.split("/")[-1].split("?")[0][:80] or f"asset_{i}"
            safe = re.sub(r"[^\w.\-]", "_", tail)
            path = out_dir / f"img_{i}_{safe}.png"
            urllib.request.urlretrieve(u, path)
            print("  img OK", path.name)
        except Exception as e:
            print("  img SKIP", u[:80], e)


def main() -> None:
    data = json.loads(MANIFEST.read_text(encoding="utf-8"))
    meta_out = {"fetchedAt": __import__("datetime").datetime.now(tz=__import__("datetime").timezone.utc).isoformat(), "screens": []}
    for entry in data:
        sid = entry["id"]
        title = entry.get("title", "")
        out = STITCH_ROOT / f"screen_{sid}"
        print(f"== {sid} {title}")
        try:
            curl_download(entry["html_url"], out / "screen.html")
            curl_download(entry["screenshot_url"], out / "screenshot.png")
            extract_images(out / "screen.html", out)
            meta_out["screens"].append({"id": sid, "title": title, "ok": True})
        except Exception as e:
            print("  FAIL", e)
            meta_out["screens"].append({"id": sid, "title": title, "ok": False, "error": str(e)})
    (STITCH_ROOT / "fetch_manifest.json").write_text(
        json.dumps(meta_out, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )
    print("Wrote", STITCH_ROOT / "fetch_manifest.json")


if __name__ == "__main__":
    sys.exit(main() or 0)
