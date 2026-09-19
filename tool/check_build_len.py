#!/usr/bin/env python3
"""rules.md §14.6 tekshiruvi: `build()` ≤ 80 qator, `Widget _xxx()` yordamchi metodlar yo'q.

Ishlatish: `python3 tool/check_build_len.py` (chiqish kodi 1 — buzilish bor).
`lib/core/dev/` (faqat dev galereyasi) tekshirilmaydi.
"""
import os
import re
import sys

LIMIT = 80
SKIP_DIRS = ("lib/core/dev",)
violations = []


def check(path):
    lines = open(path, encoding="utf-8").readlines()
    in_build, depth, start = False, 0, 0
    for i, line in enumerate(lines):
        if not in_build and re.search(r"Widget build\(", line):
            in_build, depth, start = True, 0, i
        if in_build:
            depth += line.count("{") - line.count("}")
            if depth == 0 and "{" in "".join(lines[start : i + 1]):
                n = i - start + 1
                if n > LIMIT:
                    violations.append(f"{path}:{start + 1}: build() {n} qator (> {LIMIT})")
                in_build = False
        if re.match(r"^\s*Widget _[A-Za-z0-9_]*\(", line):
            violations.append(f"{path}:{i + 1}: yordamchi `Widget _xxx()` metod (klass bo'lishi kerak)")


for root, _, files in os.walk("lib"):
    if root.startswith(SKIP_DIRS):
        continue
    for f in files:
        if f.endswith(".dart") and not f.endswith((".g.dart", ".freezed.dart")):
            check(os.path.join(root, f))

print("\n".join(violations) if violations else "OK: build() ≤ 80 qator, yordamchi metodlar yo'q")
sys.exit(1 if violations else 0)
