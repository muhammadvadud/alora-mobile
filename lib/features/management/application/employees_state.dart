import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:alora_mobile/core/error/failure.dart';

import '../domain/entities/employee.dart';

part 'employees_state.freezed.dart';

/// Xodimlar ro'yxati holati (qidiruv query'asi bilan).
@Freezed(makeCollectionsUnmodifiable: false)
sealed class EmployeesState with _$EmployeesState {
  const factory EmployeesState.initial() = _EmployeesInitial;

  const factory EmployeesState.loading({@Default('') String searchQuery}) =
      _EmployeesLoading;

  const factory EmployeesState.loaded({
    required List<Employee> items,
    @Default('') String searchQuery,
  }) = _EmployeesLoaded;

  const factory EmployeesState.empty({@Default('') String searchQuery}) =
      _EmployeesEmpty;

  const factory EmployeesState.error({
    required Failure failure,
    @Default('') String searchQuery,
  }) = _EmployeesError;
}
