// coverage:ignore-file
int? parseCostUzs(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toInt();
  if (value is String) {
    final parsed = double.tryParse(value);
    if (parsed != null) return parsed.toInt();
  }
  return null;
}
