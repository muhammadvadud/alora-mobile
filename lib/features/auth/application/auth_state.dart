import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/entities/user.dart';

part 'auth_state.freezed.dart';

/// Auth holati: sessiya tiklanayotganda [unknown],
/// kirilmaganda [unauthenticated], muvaffaqiyatli bo'lsa [authenticated].
@Freezed()
sealed class AuthState with _$AuthState {
  const factory AuthState.unknown() = _AuthStateUnknown;

  const factory AuthState.unauthenticated() = _AuthStateUnauthenticated;

  const factory AuthState.authenticated({required User user}) =
      _AuthStateAuthenticated;
}
