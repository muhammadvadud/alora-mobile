import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/chat/domain/entities/order_draft.dart';
import 'package:alora_mobile/shared/widgets/app_bottom_sheet.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/phone_field.dart';

/// Buyurtma yaratishdan oldin mijoz ma'lumotlarini (ism, telefon, manzil) so'raydigan forma.
///
/// Nega: mijoz shaxsiy ma'lumoti AI suhbatiga yozilmasligi kerak (AI rules §1.6) —
/// sotuvchi uni shu formada kiritadi va u to'g'ridan-to'g'ri `POST /orders/` ga ketadi.
class CustomerDetailsFormSheet extends StatefulWidget {
  final OrderDraft draft;

  const CustomerDetailsFormSheet({super.key, required this.draft});

  static Future<OrderDraft?> show(BuildContext context, OrderDraft draft) {
    return showModalBottomSheet<OrderDraft>(
      context: context,
      isScrollControlled: true,
      builder: (_) => CustomerDetailsFormSheet(draft: draft),
    );
  }

  @override
  State<CustomerDetailsFormSheet> createState() => _CustomerDetailsFormSheetState();
}

class _CustomerDetailsFormSheetState extends State<CustomerDetailsFormSheet> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;

  String? _nameError;
  String? _phoneError;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.draft.customerName ?? '');
    _phoneController = TextEditingController(text: widget.draft.phone ?? '');
    _addressController = TextEditingController(text: widget.draft.address ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _validateAndSubmit() {
    final l10n = AppLocalizations.of(context)!;
    final name = _nameController.text.trim();
    final phone = _phoneController.text.replaceAll(' ', '');

    bool isValid = true;
    setState(() {
      _nameError = null;
      _phoneError = null;

      if (name.length < 2 || name.length > 255) {
        _nameError = l10n.error_required_field;
        isValid = false;
      }

      if (phone.isEmpty) {
        _phoneError = l10n.error_required_field;
        isValid = false;
      } else if (!phone.startsWith('+998') || phone.length != 13) {
        _phoneError = l10n.error_invalid_phone;
        isValid = false;
      }
    });

    if (isValid) {
      final updatedDraft = widget.draft.copyWith(
        customerName: name,
        // Validatsiyadan o'tgan bo'shliqsiz qiymat yuboriladi — backend va qidiruv bir xil formatni ko'radi.
        phone: phone,
        address: _addressController.text.trim().isEmpty ? null : _addressController.text.trim(),
      );
      Navigator.of(context).pop(updatedDraft);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AppBottomSheet(
      title: l10n.chat_draft_customer,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextField(
            label: l10n.chat_draft_customer,
            controller: _nameController,
            errorText: _nameError,
            onChanged: (_) {
              if (_nameError != null) setState(() => _nameError = null);
            },
          ),
          const SizedBox(height: AppSpacing.m),
          PhoneField(
            label: l10n.chat_draft_phone,
            controller: _phoneController,
            errorText: _phoneError,
            onChanged: (_) {
              if (_phoneError != null) setState(() => _phoneError = null);
            },
          ),
          const SizedBox(height: AppSpacing.m),
          AppTextField(
            label: l10n.chat_draft_address,
            controller: _addressController,
            type: AppTextFieldType.multiline,
            maxLines: 2,
          ),
        ],
      ),
      action: Row(
        children: [
          Expanded(
            child: AppButton.secondary(
              text: l10n.common_cancel,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          const SizedBox(width: AppSpacing.s),
          Expanded(
            child: AppButton(
              text: l10n.chat_draft_createOrder,
              onPressed: _validateAndSubmit,
            ),
          ),
        ],
      ),
    );
  }
}
