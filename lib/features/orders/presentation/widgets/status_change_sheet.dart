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
import 'package:alora_mobile/features/orders/domain/entities/status_transition.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';

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

  Future<void> _save() async {
    if (_selectedStatus == null) return;
    await ref
        .read(orderDetailProvider(widget.order.id).notifier)
        .changeStatus(
          _selectedStatus!,
          note: _noteController.text.isNotEmpty ? _noteController.text : null,
        );
    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
                  _StatusRadioList(
                    statuses: statuses,
                    allowed: allowed,
                    selectedStatus: _selectedStatus,
                    onChanged: (val) => setState(() => _selectedStatus = val),
                  ),
                  _SheetActions(
                    noteController: _noteController,
                    isEnabled: _selectedStatus != null,
                    onSave: _save,
                  ),
                ],
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(AppSpacing.m),
              child: SkeletonList(
                itemCount: 4,
                itemBuilder: SkeletonBox(
                  width: double.infinity,
                  height: 48,
                  borderRadius: AppRadius.card,
                ),
              ),
            ),
            error: (err, st) =>
                Center(child: Text(context.l10n.errorLoadingStatuses)),
          );
        },
        loading: () => const Padding(
          padding: EdgeInsets.all(AppSpacing.m),
          child: SkeletonList(
            itemCount: 4,
            itemBuilder: SkeletonBox(
              width: double.infinity,
              height: 48,
              borderRadius: AppRadius.card,
            ),
          ),
        ),
        error: (err, st) =>
            Center(child: Text(context.l10n.errorLoadingTransitions)),
      ),
    );
  }
}

class _StatusRadioList extends StatelessWidget {
  final List<StatusTransition> statuses;
  final List<String> allowed;
  final String? selectedStatus;
  final ValueChanged<String?> onChanged;

  const _StatusRadioList({
    required this.statuses,
    required this.allowed,
    required this.selectedStatus,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Column(
      children: [
        ...statuses.map((s) {
          final isAllowed = allowed.contains(s.code);

          return RadioListTile<String>(
            value: s.code,
            // ignore: deprecated_member_use
            groupValue: selectedStatus,
            // ignore: deprecated_member_use
            onChanged: isAllowed
                ? (val) {
                    onChanged(val);
                  }
                : null,
            title: Text(
              s.label,
              style: typography.bodyL.copyWith(
                color: isAllowed ? colors.textPrimary : colors.textDisabled,
              ),
            ),
            activeColor: colors.accent,
            contentPadding: EdgeInsets.zero,
          );
        }),
      ],
    );
  }
}

class _SheetActions extends StatelessWidget {
  final TextEditingController noteController;
  final bool isEnabled;
  final VoidCallback onSave;

  const _SheetActions({
    required this.noteController,
    required this.isEnabled,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: AppSpacing.m),
        AppTextField(controller: noteController, hintText: 'Izoh (ixtiyoriy)'),
        const SizedBox(height: AppSpacing.l),
        AppButton(text: 'Saqlash', isEnabled: isEnabled, onPressed: onSave),
        const SizedBox(height: AppSpacing.m),
      ],
    );
  }
}
