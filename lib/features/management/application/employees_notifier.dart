import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alora_mobile/core/error/failure.dart';

import '../domain/entities/employee.dart';
import '../domain/entities/usage_period.dart';
import 'employees_state.dart';
import 'providers.dart';

part 'employees_notifier.g.dart';

/// Xodimlar ro'yxati notifier'i (qidiruv 300ms debounce bilan, S-20).
@Riverpod(keepAlive: true)
class EmployeesNotifier extends _$EmployeesNotifier {
  static const Duration _debounceDuration = Duration(milliseconds: 300);

  Timer? _debounceTimer;

  @override
  EmployeesState build() {
    scheduleMicrotask(_load);
    ref.onDispose(() => _debounceTimer?.cancel());
    return const EmployeesState.initial();
  }

  Future<void> _load() async {
    final query = _currentQuery();
    state = EmployeesState.loading(searchQuery: query);
    try {
      final repository = ref.read(teamRepositoryProvider);
      final employees = await repository.employees();
      final enriched = await _withTodayCost(employees);
      final items = _applyQuery(enriched, query);
      if (items.isEmpty) {
        state = EmployeesState.empty(searchQuery: query);
      } else {
        state = EmployeesState.loaded(items: items, searchQuery: query);
      }
    } on Failure catch (error) {
      state = EmployeesState.error(failure: error, searchQuery: query);
    }
  }

  /// Qayta yuklash.
  Future<void> refresh() => _load();

  /// Xatoni retry qilish (qidiruvni saqlab).
  Future<void> retry() => _load();

  /// Qidiruv query'si (debounce bilan).
  void search(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounceDuration, () => _applySearch(query.trim()));
  }

  void _applySearch(String query) {
    state = state.maybeWhen(
      loaded: (items, _) {
        final filtered = _applyQuery(items, query);
        if (filtered.isEmpty) {
          return EmployeesState.empty(searchQuery: query);
        }
        return EmployeesState.loaded(items: filtered, searchQuery: query);
      },
      empty: (_) => state,
      orElse: () => state,
    );
  }

  String _currentQuery() {
    return state.maybeWhen(
      loaded: (_, query) => query,
      empty: (query) => query,
      error: (_, query) => query,
      orElse: () => '',
    );
  }

  List<Employee> _applyQuery(List<Employee> items, String query) {
    if (query.isEmpty) return items;
    final needle = query.toLowerCase();
    return items
        .where((e) => e.fullName.toLowerCase().contains(needle))
        .toList();
  }

  /// Xodimlar ro'yxatidagi `today_cost` no'q backend'da mavjud emas —
  /// har bir xodim uchun `usage/summary?period=day&user=<id>` so'raladi.
  /// Agar so'rov muvaffaqiyatsiz bo'lsa `null` (—) qoladi.
  Future<List<Employee>> _withTodayCost(List<Employee> employees) async {
    final usageRepository = ref.read(usageRepositoryProvider);
    return Future.wait(
      employees.map((employee) async {
        try {
          final summary = await usageRepository.summary(
            period: UsagePeriod.day,
            userId: employee.id,
          );
          return _copyWithCost(employee, summary.costUzs);
        } on Failure {
          return employee;
        }
      }),
    );
  }

  Employee _copyWithCost(Employee employee, int? todayCost) {
    return Employee(
      id: employee.id,
      phone: employee.phone,
      fullName: employee.fullName,
      role: employee.role,
      isActive: employee.isActive,
      lastLoginAt: employee.lastLoginAt,
      createdAt: employee.createdAt,
      todayTokens: employee.todayTokens,
      todayMessages: employee.todayMessages,
      todayConversations: employee.todayConversations,
      todayCost: todayCost,
    );
  }
}
