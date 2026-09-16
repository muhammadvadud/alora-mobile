import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:alora_mobile/features/orders/application/providers.dart';
import 'package:alora_mobile/features/orders/domain/entities/status_transition.dart';

part 'statuses_notifier.g.dart';

@riverpod
class OrderStatusesNotifier extends _$OrderStatusesNotifier {
  @override
  FutureOr<List<StatusTransition>> build() async {
    final repo = ref.watch(ordersRepositoryProvider);
    final res = await repo.getStatuses();
    return res.statuses;
  }
}

@riverpod
class OrderTransitionsNotifier extends _$OrderTransitionsNotifier {
  @override
  FutureOr<Map<String, List<String>>> build() async {
    final repo = ref.watch(ordersRepositoryProvider);
    final res = await repo.getStatuses();
    return res.transitions;
  }

  bool isAllowed(String currentStatus, String targetStatus) {
    if (state.value == null) return false;
    final allowed = state.value![currentStatus] ?? [];
    return allowed.contains(targetStatus);
  }
}
