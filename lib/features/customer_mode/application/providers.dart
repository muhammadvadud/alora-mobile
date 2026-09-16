import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Mijoz rejimi yoqilganligi.
/// Hozircha har doim false; haqiqiy holat 16-bosqichda ulanadi.
final customerModeEnabledProvider = Provider<bool>((ref) => false);
