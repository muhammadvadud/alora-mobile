import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/core/storage/secure_storage.dart';

class CustomerModeNotifier extends Notifier<bool> {
  int _errorCount = 0;
  DateTime? _lockUntil;

  @override
  bool build() {
    _init();
    return false;
  }

  Future<void> _init() async {
    final storage = ref.read(secureStorageProvider);
    final pin = await storage.getPin();
    if (pin != null && pin.isNotEmpty) {
      state = true;
    }
  }

  Future<void> enable(String pin) async {
    final storage = ref.read(secureStorageProvider);
    await storage.savePin(pin);
    state = true;
    _errorCount = 0;
    _lockUntil = null;
  }

  Future<bool> disable(String pin) async {
    if (_lockUntil != null && DateTime.now().isBefore(_lockUntil!)) {
      final seconds = _lockUntil!.difference(DateTime.now()).inSeconds;
      throw Exception('3 marta xato. $seconds soniya kuting.');
    }

    final storage = ref.read(secureStorageProvider);
    final savedPin = await storage.getPin();

    if (savedPin == pin) {
      await storage.clearPin();
      state = false;
      _errorCount = 0;
      _lockUntil = null;
      return true;
    } else {
      _errorCount++;
      if (_errorCount >= 3) {
        _lockUntil = DateTime.now().add(const Duration(seconds: 30));
        _errorCount = 0;
        throw Exception('3 marta xato. 30 soniya kuting.');
      }
      return false;
    }
  }

  int get errorCount => _errorCount;
  DateTime? get lockUntil => _lockUntil;
}

final customerModeNotifierProvider =
    NotifierProvider<CustomerModeNotifier, bool>(CustomerModeNotifier.new);

final customerModeEnabledProvider = Provider<bool>((ref) {
  return ref.watch(customerModeNotifierProvider);
});
