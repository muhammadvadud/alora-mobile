import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/core/storage/secure_storage.dart';
import 'package:alora_mobile/core/utils/app_logger.dart';
import 'package:alora_mobile/features/customer_mode/application/pin_result.dart';

class CustomerModeNotifier extends Notifier<bool> {
  static const int maxAttempts = 3;
  static const Duration lockDuration = Duration(seconds: 30);

  int _errorCount = 0;
  DateTime? _lockUntil;

  @override
  bool build() {
    _init();
    return false;
  }

  /// PIN va qulf holati secure storage'dan tiklanadi — ilova qayta ochilsa
  /// ham brute-force hisoblagichi nolga tushmaydi (§12.5).
  Future<void> _init() async {
    final storage = ref.read(secureStorageProvider);
    try {
      final pin = await storage.getPin();
      _errorCount = await storage.getPinErrorCount();
      _lockUntil = await storage.getPinLockUntil();
      if (pin != null && pin.isNotEmpty) {
        state = true;
      }
    } catch (error) {
      // Keystore/Keychain o'qilmasa rejim o'chiq qoladi — ilova yiqilmaydi.
      logger.w('Mijoz rejimi holatini o\'qib bo\'lmadi', error: error);
    }
  }

  Future<void> enable(String pin) async {
    final storage = ref.read(secureStorageProvider);
    await storage.savePin(pin);
    await storage.clearPinLock();
    state = true;
    _errorCount = 0;
    _lockUntil = null;
  }

  Future<PinResult> disable(String pin) async {
    final storage = ref.read(secureStorageProvider);
    final now = DateTime.now();
    final lockUntil = _lockUntil;
    if (lockUntil != null && now.isBefore(lockUntil)) {
      return PinLocked(seconds: lockUntil.difference(now).inSeconds);
    }
    if (lockUntil != null) {
      _lockUntil = null;
      await storage.savePinLock(errorCount: _errorCount);
    }

    final savedPin = await storage.getPin();

    if (savedPin == pin) {
      await storage.clearPin();
      await storage.clearPinLock();
      state = false;
      _errorCount = 0;
      _lockUntil = null;
      return const PinOk();
    }

    _errorCount++;
    if (_errorCount >= maxAttempts) {
      _lockUntil = DateTime.now().add(lockDuration);
      _errorCount = 0;
      await storage.savePinLock(errorCount: 0, lockUntil: _lockUntil);
      return PinLocked(seconds: lockDuration.inSeconds);
    }
    await storage.savePinLock(errorCount: _errorCount);
    return PinWrong(attemptsLeft: maxAttempts - _errorCount);
  }

  int get errorCount => _errorCount;
  DateTime? get lockUntil => _lockUntil;
}

final customerModeNotifierProvider =
    NotifierProvider<CustomerModeNotifier, bool>(CustomerModeNotifier.new);

final customerModeEnabledProvider = Provider<bool>((ref) {
  return ref.watch(customerModeNotifierProvider);
});
