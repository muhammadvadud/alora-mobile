import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_bottom_sheet.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

import '../../data/dto/catalog_write_dtos.dart';

import 'package:alora_mobile/features/catalog/domain/entities/product_variant.dart';

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
  String _mode = 'percent';
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
    if (_mode == 'percent') {
      return (oldPrice * (1 + valNum / 100)).round();
    }
    return valNum.round();
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
              ChoiceChip(
                label: Text(context.l10n.management_bulkPricePercent10),
                selected: _mode == 'percent' && _value == '+10',
                onSelected: (val) {
                  if (val) {
                    setState(() {
                      _mode = 'percent';
                      _value = '+10';
                      _controller.text = _value;
                    });
                  }
                },
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: Text(context.l10n.management_bulkPricePercent5),
                selected: _mode == 'percent' && _value == '-5',
                onSelected: (val) {
                  if (val) {
                    setState(() {
                      _mode = 'percent';
                      _value = '-5';
                      _controller.text = _value;
                    });
                  }
                },
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: Text(context.l10n.management_bulkPriceAmount),
                selected: _mode == 'amount',
                onSelected: (val) {
                  if (val) {
                    setState(() {
                      _mode = 'amount';
                      _value = '';
                      _controller.text = _value;
                    });
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppTextField(
            controller: _controller,
            type: AppTextFieldType.number,
            hintText: _mode == 'percent'
                ? context.l10n.management_bulkPricePercentHint
                : context.l10n.management_bulkPriceAmountHint,
            onChanged: (val) => setState(() => _value = val),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.management_bulkPricePreview,
            style: context.text.labelL.copyWith(color: colors.textSecondary),
          ),
          const SizedBox(height: 8),
          ...widget.selectedVariants.take(3).map((v) {
            final preview = _previewPrice(v.price);
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
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
            type: _mode,
          );
          widget.onSave(dto);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
