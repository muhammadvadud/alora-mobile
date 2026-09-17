import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:alora_mobile/core/error/failure.dart';

import '../domain/entities/employee.dart';
import '../domain/entities/usage_limit.dart';

part 'employee_detail_state.freezed.dart';

/// Bitta xodim tafsiloti holati (profil + limit).
@Freezed(makeCollectionsUnmodifiable: false)
sealed class EmployeeDetailState with _$EmployeeDetailState {
  const factory EmployeeDetailState.initial() = _EmployeeDetailInitial;

  const factory EmployeeDetailState.loading() = _EmployeeDetailLoading;

  const factory EmployeeDetailState.loaded({
    required Employee employee,
    UsageLimit? limit,
  }) = _EmployeeDetailLoaded;

  const factory EmployeeDetailState.error({required Failure failure}) =
      _EmployeeDetailError;
}
