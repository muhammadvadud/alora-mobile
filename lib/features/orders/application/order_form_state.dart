import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_form_state.freezed.dart';

@freezed
abstract class OrderFormState with _$OrderFormState {
  const factory OrderFormState({
    @Default({}) Map<String, dynamic> initialValues,
    @Default({}) Map<String, dynamic> values,
    @Default({}) Map<String, String> fieldErrors,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    String? submitError,
  }) = _OrderFormState;

  const OrderFormState._();

  bool get isDirty => initialValues.toString() != values.toString();

  Map<String, dynamic> get changedFields {
    final Map<String, dynamic> changes = {};
    for (final key in values.keys) {
      if (values[key] != initialValues[key]) {
        changes[key] = values[key];
      }
    }
    return changes;
  }
}

class ValidationFailure implements Exception {
  final Map<String, String> fieldErrors;
  ValidationFailure(this.fieldErrors);
}
