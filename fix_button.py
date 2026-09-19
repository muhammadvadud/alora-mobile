import re
with open("lib/shared/widgets/app_button.dart", "r") as f:
    text = f.read()

text = text.replace("late final Color backgroundColor;", "late Color backgroundColor;")
text = text.replace("late final Color textColor;", "late Color textColor;")
text = text.replace("late final BorderSide borderSide;", "late BorderSide borderSide;")
text = text.replace("late final Color overlayColor;", "late Color overlayColor;")

with open("lib/shared/widgets/app_button.dart", "w") as f:
    f.write(text)
