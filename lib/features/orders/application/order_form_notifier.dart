import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:alora_mobile/features/orders/application/providers.dart';
import 'package:alora_mobile/features/orders/application/order_form_state.dart';

part 'order_form_notifier.g.dart';

@riverpod
class OrderFormNotifier extends _$OrderFormNotifier {
  @override
  OrderFormState build() {
    return const OrderFormState();
  }

  void initialize(Map<String, dynamic> initialValues) {
    state = state.copyWith(
      initialValues: Map.from(initialValues),
      values: Map.from(initialValues),
    );
  }

  void updateField(String key, dynamic value) {
    final newValues = Map<String, dynamic>.from(state.values);
    newValues[key] = value;
    state = state.copyWith(values: newValues, fieldErrors: {});
  }

  Future<void> submit(String? orderId, String userRole) async {
    state = state.copyWith(isSubmitting: true, submitError: null);

    // validate discount limit
    final discountPercent =
        double.tryParse(state.values['discount_percent']?.toString() ?? '0') ??
        0;
    if (userRole == 'employee' && discountPercent > 5) {
      state = state.copyWith(
        isSubmitting: false,
        fieldErrors: {'discount_percent': 'Chegirma chegarasi employee (5%)'},
      );
      throw ValidationFailure(state.fieldErrors);
    } else if (userRole == 'manager' && discountPercent > 15) {
      state = state.copyWith(
        isSubmitting: false,
        fieldErrors: {'discount_percent': 'Chegirma chegarasi manager (15%)'},
      );
      throw ValidationFailure(state.fieldErrors);
    }

    try {
      final repo = ref.read(ordersRepositoryProvider);
      final changes = state.changedFields;

      if (orderId == null) {
        // Create new
        await repo.createOrder(state.values);
      } else {
        // Edit existing with PATCH body faqat o'zgargan maydonlar
        if (changes.isNotEmpty) {
          // Assume updateOrder exists on repo and takes changes
          await repo.patchOrder(orderId, changes);
        }
      }
      state = state.copyWith(isSubmitting: false, isSuccess: true);
    } catch (e) {
      state = state.copyWith(isSubmitting: false, submitError: e.toString());
      if (e is ValidationFailure) {
        state = state.copyWith(fieldErrors: e.fieldErrors);
      }
      rethrow;
    }
  }
}
