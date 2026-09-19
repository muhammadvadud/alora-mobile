#!/bin/bash
cd /home/muhammadvadud/it/alora/projects/mobil

# List of all targeted files/directories
TARGETS=(
  "lib/features/chat/presentation"
  "lib/features/management/presentation"
  "lib/features/profile/presentation/widgets/spend_section.dart"
  "lib/features/profile/presentation/widgets/language_section.dart"
  "lib/features/customer_mode/presentation/widgets/pin_dialogs.dart"
  "lib/features/conversations/presentation/widgets/conversations_pane.dart"
  "lib/features/voice/presentation/widgets/voice_panel.dart"
  "lib/shared/widgets/product_card.dart"
  "lib/shared/widgets/app_button.dart"
)

# Function to check file
check_file() {
  local file=$1
  local has_method=0
  local long_build=0

  # check for Widget _xxx(
  if grep -q -E "^\s*Widget _[a-zA-Z]*\(" "$file"; then
    has_method=1
  fi

  # check build method length (approximate)
  # using awk to count lines between Widget build( and the matching closing brace
  # Actually, a simpler way is to just find files manually or with a simpler python script.
}

# Just grep for Widget _
echo "Files with Widget _xxx methods:"
for target in "${TARGETS[@]}"; do
  if [ -d "$target" ]; then
    find "$target" -name "*.dart" -exec grep -lE "^\s*Widget _[a-zA-Z0-9_]*\(" {} +
  elif [ -f "$target" ]; then
    grep -lE "^\s*Widget _[a-zA-Z0-9_]*\(" "$target"
  fi
done

