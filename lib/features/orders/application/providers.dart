import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Qoralama buyurtmalar soni (tab badge uchun).
/// Hozircha 0; haqiqiy qiymat 9-bosqichda ulanadi.
final draftOrdersCountProvider = Provider<int>((ref) => 0);
