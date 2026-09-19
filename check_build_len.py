import os
import re

TARGETS = [
    "lib/features/chat/presentation",
    "lib/features/management/presentation",
    "lib/features/profile/presentation/widgets/spend_section.dart",
    "lib/features/profile/presentation/widgets/language_section.dart",
    "lib/features/customer_mode/presentation/widgets/pin_dialogs.dart",
    "lib/features/conversations/presentation/widgets/conversations_pane.dart",
    "lib/features/voice/presentation/widgets/voice_panel.dart",
    "lib/shared/widgets/product_card.dart",
    "lib/shared/widgets/app_button.dart"
]

def check_file(filepath):
    try:
        with open(filepath, 'r') as f:
            lines = f.readlines()
    except:
        return
        
    in_build = False
    brace_count = 0
    build_start = 0
    
    for i, line in enumerate(lines):
        if re.search(r'Widget build\(', line) and not in_build:
            in_build = True
            brace_count = 0
            build_start = i
            
        if in_build:
            brace_count += line.count('{')
            brace_count -= line.count('}')
            
            if brace_count == 0 and '{' in ''.join(lines[build_start:i+1]):
                build_len = i - build_start + 1
                if build_len > 80:
                    print(f"{filepath}: build() is {build_len} lines (starts at {build_start+1})")
                in_build = False

for t in TARGETS:
    if os.path.isdir(t):
        for root, dirs, files in os.walk(t):
            for file in files:
                if file.endswith('.dart'):
                    check_file(os.path.join(root, file))
    elif os.path.isfile(t):
        check_file(t)
