import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/core/storage/secure_storage.dart';
import 'package:alora_mobile/features/customer_mode/application/pin_result.dart';

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

  Future<PinResult> disable(String pin) async {
    final now = DateTime.now();
    final lockUntil = _lockUntil;
    if (lockUntil != null && now.isBefore(lockUntil)) {
      return PinLocked(seconds: lockUntil.difference(now).inSeconds);
    }
    if (lockUntil != null) {
      _lockUntil = null;
    }

    final storage = ref.read(secureStorageProvider);
    final savedPin = await storage.getPin();

    if (savedPin == pin) {
      await storage.clearPin();
      state = false;
      _errorCount = 0;
      _lockUntil = null;
      return const PinOk();
    }

    _errorCount++;
    if (_errorCount >= 3) {
      _lockUntil = DateTime.now().add(const Duration(seconds: 30));
      _errorCount = 0;
      return const PinLocked(seconds: 30);
    }
    return PinWrong(attemptsLeft: 3 - _errorCount);
  }

  int get errorCount => _errorCount;
  DateTime? get lockUntil => _lockUntil;
}

final customerModeNotifierProvider =
    NotifierProvider<CustomerModeNotifier, bool>(CustomerModeNotifier.new);

final customerModeEnabledProvider = Provider<bool>((ref) {
  return ref.watch(customerModeNotifierProvider);
});
