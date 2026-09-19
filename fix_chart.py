import re
with open("lib/features/management/presentation/widgets/management_spend_chart.dart", "r") as f:
    text = f.read()

text = re.sub(
    r"if \(index < 0 \|\| index >= daily\.length\).*?return const SizedBox\.shrink\(\);",
    "if (index < 0 || index >= daily.length) { return const SizedBox.shrink(); }",
    text,
    flags=re.DOTALL
)

with open("lib/features/management/presentation/widgets/management_spend_chart.dart", "w") as f:
    f.write(text)
