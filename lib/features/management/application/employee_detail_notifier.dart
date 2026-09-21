import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/shared/models/role.dart';

import '../domain/entities/usage_limit.dart';
import 'employee_detail_state.dart';
import 'employees_notifier.dart';
import 'providers.dart';

part 'employee_detail_notifier.g.dart';

/// Bitta xodim tafsiloti (S-21): profilni yangilash, bloklash, limit o'rnatish.
/// AutoDispose — tafsilot ekrani qayta ochilganda yangi ma'lumot olinadi.
@riverpod
class EmployeeDetailNotifier extends _$EmployeeDetailNotifier {
  @override
  EmployeeDetailState build(String employeeId) {
    unawaited(load());
    return const EmployeeDetailState.initial();
  }

  Future<void> load() async {
    state = const EmployeeDetailState.loading();
    try {
      final repository = ref.read(teamRepositoryProvider);
      final employee = await repository.employee(employeeId);
      state = EmployeeDetailState.loaded(employee: employee);
    } on Failure catch (error) {
      state = EmployeeDetailState.error(failure: error);
    }
  }

  /// Profil (ism, rol) yangilash.
  Future<void> updateProfile({required String fullName, required Role role}) async {
    try {
      final repository = ref.read(teamRepositoryProvider);
      await repository.updateEmployee(
        id: employeeId,
        patch: {'full_name': fullName, 'role': role.name},
      );
      await load();
      _refreshEmployees();
    } on Failure catch (_) {
      rethrow;
    }
  }

  /// Xodimni bloklash / faollashtirish.
  Future<void> toggleBlocked(bool blocked) async {
    try {
      final repository = ref.read(teamRepositoryProvider);
      await repository.updateEmployee(id: employeeId, patch: {'is_active': !blocked});
      await load();
      _refreshEmployees();
    } on Failure catch (_) {
      rethrow;
    }
  }

  /// Xodim parolini yangilash.
  Future<void> changePassword({
    required String password,
    required String passwordConfirmation,
  }) async {
    final repository = ref.read(teamRepositoryProvider);
    await repository.changeEmployeePassword(
      id: employeeId,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }

  /// Xodim limitini o'rnatish. Limit POST javobidan keladi.
  Future<void> setLimit({required Map<String, dynamic> body}) async {
    final repository = ref.read(teamRepositoryProvider);
    final limit = await repository.setEmployeeLimit(id: employeeId, body: body);
    final current = state.maybeWhen(loaded: (employee, _) => employee, orElse: () => null);
    if (current != null) {
      state = EmployeeDetailState.loaded(employee: current, limit: limit);
    }
    _refreshEmployees();
  }

  /// Ro'yxat ekrani ochiq bo'lsa darhol qayta yuklanadi (limit/profil o'zgarishlari).
  void _refreshEmployees() {
    ref.invalidate(employeesProvider);
  }

  UsageLimit? get limit => state.maybeWhen(loaded: (_, limit) => limit, orElse: () => null);
}
