#!/usr/bin/env bash
# pubspec.yaml `version: X.Y.Z+N` → `--dart-define=APP_VERSION=X.Y.Z --dart-define=BUILD_NUMBER=N`
# Foydalanish: flutter build apk ... $(tool/version_defines.sh)
set -euo pipefail
cd "$(dirname "$0")/.."
v=$(grep -E '^version:' pubspec.yaml | sed -E 's/^version:[[:space:]]*//')
echo "--dart-define=APP_VERSION=${v%%+*} --dart-define=BUILD_NUMBER=${v##*+}"
