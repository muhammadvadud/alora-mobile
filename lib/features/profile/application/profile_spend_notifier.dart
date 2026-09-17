import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/utils/app_logger.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart' show authProvider;
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/shared/models/role.dart';

import 'profile_spend_data.dart';
import 'providers.dart';

part 'profile_spend_notifier.g.dart';

/// Profil sarf ma'lumotlarini olib boruvchi notifier.
/// `auth/me/` limit blo'gi va (manager/admin uchun) bugungi sarf
/// har 5 daqiqada yangilanadi (10.3).
@Riverpod(keepAlive: true)
class ProfileSpendNotifier extends _$ProfileSpendNotifier {
  static const Duration refreshInterval = Duration(minutes: 5);

  Timer? _timer;

  @override
  Future<ProfileSpendData> build() async {
    final auth = ref.watch(authProvider);
    final user = auth.maybeWhen(authenticated: (u) => u, orElse: () => null);

    _cancelTimer();

    if (user == null) return const ProfileSpendData();
    ref.onDispose(_cancelTimer);

    final repository = ref.watch(profileRepositoryProvider);
    final limit = await repository.getLimit();

    int? todayCost;
    if (user.role.hasAccess(Role.manager)) {
      try {
        todayCost = await repository.getTodayCost(user.id);
      } on Failure catch (error) {
        logger.w('Bugungi sarfni olishda xatolik: $error');
      }
    }

    _timer = Timer.periodic(refreshInterval, (_) => ref.invalidateSelf());

    return ProfileSpendData(limit: limit, todayCost: todayCost);
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }
}