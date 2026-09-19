#!/usr/bin/env bash
# rules.md §14.2: `dart format` (page_width 100, analysis_options.yaml) — faqat qo'lda yozilgan
# fayllar tekshiriladi. Generatsiya fayllari (*.g.dart, *.freezed.dart, l10n) CI'da build_runner /
# gen-l10n tomonidan qayta yoziladi va formatlanmagan holda chiqadi, shu sabab chetlab o'tiladi.
set -euo pipefail
cd "$(dirname "$0")/.."
mapfile -t FILES < <(git ls-files 'lib/**/*.dart' 'lib/*.dart' 'test/**/*.dart' 'integration_test/**/*.dart' \
  | grep -vE '\.(g|freezed)\.dart$|^lib/app/l10n/app_localizations')
dart format --set-exit-if-changed -o none "${FILES[@]}"
