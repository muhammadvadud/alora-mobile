import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'providers.dart';

part 'profile_password_notifier.g.dart';

/// Joriy foydalanuvchining parolini almashtirish oqimi.
@Riverpod(keepAlive: true)
class ProfilePasswordNotifier extends _$ProfilePasswordNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> change({required String password, required String passwordConfirmation}) async {
    await ref
        .read(profileRepositoryProvider)
        .changePassword(password: password, passwordConfirmation: passwordConfirmation);
  }
}
