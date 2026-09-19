import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_bottom_sheet.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';

import '../../data/dto/catalog_write_dtos.dart';

import 'package:alora_mobile/features/catalog/domain/entities/product_variant.dart';

enum _BulkPriceMode { percent, amount }

class BulkPriceSheet extends StatefulWidget {
  final List<ProductVariant> selectedVariants;
  final ValueChanged<BulkPriceDto> onSave;

  const BulkPriceSheet({
    super.key,
    required this.selectedVariants,
    required this.onSave,
  });

  @override
  State<BulkPriceSheet> createState() => _BulkPriceSheetState();
}

class _BulkPriceSheetState extends State<BulkPriceSheet> {
  _BulkPriceMode _mode = _BulkPriceMode.percent;
  String _value = '';

  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = _value;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int? _previewPrice(int oldPrice) {
    final valNum = double.tryParse(_value);
    if (valNum == null) return null;
    if (_mode == _BulkPriceMode.percent) {
      return (oldPrice * (1 + valNum / 100)).round();
    }
    return valNum.round();
  }

  void _select(_BulkPriceMode mode, String value) {
    setState(() {
      _mode = mode;
      _value = value;
      _controller.text = value;
    });
  }

  AppChipState _chipState(_BulkPriceMode mode, String? value) {
    if (mode == _BulkPriceMode.amount) {
      return _mode == mode ? AppChipState.selected : AppChipState.unselected;
    }
    return _mode == mode && _value == value
        ? AppChipState.selected
        : AppChipState.unselected;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AppBottomSheet(
      title: context.l10n.management_bulkPriceTitle,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppChip(
                label: context.l10n.management_bulkPricePercent10,
                state: _chipState(_BulkPriceMode.percent, '+10'),
                onTap: () => _select(_BulkPriceMode.percent, '+10'),
              ),
              const SizedBox(width: AppSpacing.s),
              AppChip(
                label: context.l10n.management_bulkPricePercent5,
                state: _chipState(_BulkPriceMode.percent, '-5'),
                onTap: () => _select(_BulkPriceMode.percent, '-5'),
              ),
              const SizedBox(width: AppSpacing.s),
              AppChip(
                label: context.l10n.management_bulkPriceAmount,
                state: _chipState(_BulkPriceMode.amount, null),
                onTap: () => _select(_BulkPriceMode.amount, ''),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.l),
          AppTextField(
            controller: _controller,
            type: AppTextFieldType.number,
            hintText: _mode == _BulkPriceMode.percent
                ? context.l10n.management_bulkPricePercentHint
                : context.l10n.management_bulkPriceAmountHint,
            onChanged: (val) => setState(() => _value = val),
          ),
          const SizedBox(height: AppSpacing.l),
          Text(
            context.l10n.management_bulkPricePreview,
            style: context.text.labelL.copyWith(color: colors.textSecondary),
          ),
          const SizedBox(height: AppSpacing.s),
          ...widget.selectedVariants.take(3).map((v) {
            final preview = _previewPrice(v.price);
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: Text(
                '${v.colorName}: ${v.price} -> ${preview ?? v.price}',
                style: context.text.bodyS,
              ),
            );
          }),
        ],
      ),
      action: AppButton(
        text: context.l10n.common_save,
        onPressed: () {
          final val = _value.trim();
          final value = double.tryParse(val);
          if (value == null) return;
          final dto = BulkPriceDto(
            variantIds: widget.selectedVariants.map((e) => e.id).toList(),
            value: value,
            type: _mode.name,
          );
          widget.onSave(dto);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
