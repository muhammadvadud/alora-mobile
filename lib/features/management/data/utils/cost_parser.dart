/// Backend `cost_uzs` xml (masalan "45702.00") ni so'mga aylantiruvchi yordamchi.
int? parseCostUzs(Object? raw) {
  if (raw is num) return raw.round();
  if (raw is String && raw.isNotEmpty) {
    final value = double.tryParse(raw);
    if (value != null) return value.round();
  }
  return null;
}
