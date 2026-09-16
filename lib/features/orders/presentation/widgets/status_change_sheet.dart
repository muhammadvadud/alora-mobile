import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/app_bottom_sheet.dart';
import 'package:alora_mobile/features/orders/application/statuses_notifier.dart';
import 'package:alora_mobile/features/orders/application/orders_notifiers.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';

class StatusChangeSheet extends ConsumerStatefulWidget {
  final Order order;

  const StatusChangeSheet({super.key, required this.order});

  static Future<void> show(BuildContext context, Order order) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: StatusChangeSheet(order: order),
      ),
    );
  }

  @override
  ConsumerState<StatusChangeSheet> createState() => _StatusChangeSheetState();
}

class _StatusChangeSheetState extends ConsumerState<StatusChangeSheet> {
  String? _selectedStatus;
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    final transitionsState = ref.watch(orderTransitionsProvider);
    final statusesState = ref.watch(orderStatusesProvider);

    final currentStatusCode = widget.order.status.name;

    return AppBottomSheet(
      title: 'Status o\'zgartirish',
      content: transitionsState.when(
        data: (transitionsMap) {
          final allowed = transitionsMap[currentStatusCode] ?? [];

          return statusesState.when(
            data: (statuses) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...statuses.map((s) {
                    final isAllowed = allowed.contains(s.code);

                    return RadioListTile<String>(
                      value: s.code,
                      // ignore: deprecated_member_use
                      groupValue: _selectedStatus,
                      // ignore: deprecated_member_use
                      onChanged: isAllowed
                          ? (val) {
                              setState(() {
                                _selectedStatus = val;
                              });
                            }
                          : null,
                      title: Text(
                        s.label,
                        style: typography.bodyL.copyWith(
                          color: isAllowed
                              ? colors.textPrimary
                              : colors.textDisabled,
                        ),
                      ),
                      activeColor: colors.accent,
                      contentPadding: EdgeInsets.zero,
                    );
                  }),
                  const SizedBox(height: AppSpacing.m),
                  AppTextField(
                    controller: _noteController,
                    hintText: 'Izoh (ixtiyoriy)',
                  ),
                  const SizedBox(height: AppSpacing.l),
                  AppButton(
                    text: 'Saqlash',
                    isEnabled: _selectedStatus != null,
                    onPressed: () async {
                      if (_selectedStatus == null) return;
                      await ref
                          .read(orderDetailProvider(widget.order.id).notifier)
                          .changeStatus(
                            _selectedStatus!,
                            note: _noteController.text.isNotEmpty
                                ? _noteController.text
                                : null,
                          );
                      if (!context.mounted) return;
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: AppSpacing.m),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, st) =>
                Center(child: Text(context.l10n.errorLoadingStatuses)),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) =>
            Center(child: Text(context.l10n.errorLoadingTransitions)),
      ),
    );
  }
}
