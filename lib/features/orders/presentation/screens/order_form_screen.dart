import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/features/chat/domain/entities/order_draft.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/features/orders/application/orders_notifiers.dart';
import 'package:alora_mobile/features/orders/application/providers.dart';
import 'package:go_router/go_router.dart';

class OrderFormScreen extends ConsumerStatefulWidget {
  /// [initialDraft] — chatdagi qoralamadan (S-07 "Tahrirlash") oldindan to'ldirish.
  const OrderFormScreen({super.key, this.initialDraft});

  final OrderDraft? initialDraft;

  @override
  ConsumerState<OrderFormScreen> createState() => _OrderFormScreenState();
}

class _OrderFormScreenState extends ConsumerState<OrderFormScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _discountController = TextEditingController();
  final _prepaymentController = TextEditingController();
  final _noteController = TextEditingController();

  bool _isDiscountPercent = false;
  bool _isPrepaymentPercent = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final draft = widget.initialDraft;
    if (draft != null) {
      _nameController.text = draft.customerName ?? '';
      _phoneController.text = draft.phone ?? '';
      _addressController.text = draft.address ?? '';
      if (draft.prepayment != null) {
        _prepaymentController.text = draft.prepayment.toString();
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _discountController.dispose();
    _prepaymentController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_nameController.text.trim().isEmpty ||
        _phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.nameAndPhoneRequired)),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final repo = ref.read(ordersRepositoryProvider);

      final body = <String, dynamic>{
        'customer_name': _nameController.text.trim(),
        'customer_phone': _phoneController.text.trim(),
      };

      if (_addressController.text.isNotEmpty) {
        body['address'] = _addressController.text.trim();
      }
      if (_noteController.text.isNotEmpty) {
        body['note'] = _noteController.text.trim();
      }

      if (_discountController.text.isNotEmpty) {
        if (_isDiscountPercent) {
          body['discount_percent'] = _discountController.text;
        } else {
          body['discount_amount'] = _discountController.text;
        }
      }

      if (_prepaymentController.text.isNotEmpty) {
        if (_isPrepaymentPercent) {
          body['prepayment_percent'] = _prepaymentController.text;
        } else {
          body['prepayment'] = _prepaymentController.text;
        }
      }

      final newOrder = await repo.createOrder(body);
      ref.invalidate(ordersListProvider);
      if (mounted) {
        context.pop();
        await context.push(AppRoutes.order(newOrder.id));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.errorOccurred(e.toString()))),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.newOrder,
          style: typography.titleL.copyWith(color: colors.textPrimary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.screenH),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(context.l10n.customer, style: typography.titleM),
            const SizedBox(height: AppSpacing.s),
            AppTextField(controller: _nameController, hintText: 'Ism *'),
            const SizedBox(height: AppSpacing.s),
            AppTextField(
              controller: _phoneController,
              hintText: 'Telefon *',
              type: AppTextFieldType.number,
            ),
            const SizedBox(height: AppSpacing.s),
            AppTextField(
              controller: _addressController,
              hintText: 'Manzil (ixtiyoriy)',
            ),
            const SizedBox(height: AppSpacing.l),

            Text(context.l10n.discount, style: typography.titleM),
            _AmountToggleRow(
              controller: _discountController,
              isPercent: _isDiscountPercent,
              onPercentChanged: (val) =>
                  setState(() => _isDiscountPercent = val),
            ),
            const SizedBox(height: AppSpacing.l),

            Text(context.l10n.prepayment, style: typography.titleM),
            _AmountToggleRow(
              controller: _prepaymentController,
              isPercent: _isPrepaymentPercent,
              onPercentChanged: (val) =>
                  setState(() => _isPrepaymentPercent = val),
            ),
            const SizedBox(height: AppSpacing.l),

            Text(context.l10n.note, style: typography.titleM),
            const SizedBox(height: AppSpacing.s),
            AppTextField(
              controller: _noteController,
              hintText: 'Qo\'shimcha izoh',
              type: AppTextFieldType.multiline,
              maxLines: 3,
            ),
            const SizedBox(height: AppSpacing.xxl),

            AppButton(
              text: 'Yaratish',
              isLoading: _isLoading,
              onPressed: _submit,
            ),
          ],
        ),
      ),
    );
  }
}

class _AmountToggleRow extends StatelessWidget {
  final TextEditingController controller;
  final bool isPercent;
  final ValueChanged<bool> onPercentChanged;

  const _AmountToggleRow({
    required this.controller,
    required this.isPercent,
    required this.onPercentChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      children: [
        Expanded(
          child: AppTextField(
            controller: controller,
            hintText: isPercent ? 'Foiz (%)' : 'Summa',
            type: AppTextFieldType.number,
          ),
        ),
        const SizedBox(width: AppSpacing.m),
        Text(context.l10n.amount),
        Switch(
          value: isPercent,
          onChanged: onPercentChanged,
          activeTrackColor: colors.accent,
        ),
        const Text('%'),
      ],
    );
  }
}
