import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/chat/domain/entities/quote.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/quote_card.dart';
import 'package:alora_mobile/features/management/pricing/application/pricing_notifier.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/calc_preview_dto.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/widgets/app_bottom_sheet.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';

/// "Hisobni sinash" bottom sheet'i: o'lchamlar kiritiladi va
/// `calc/preview` orqali natija `QuoteCardView` da ko'rsatiladi.
class CalcPreviewSheet extends ConsumerStatefulWidget {
  const CalcPreviewSheet({super.key});

  @override
  ConsumerState<CalcPreviewSheet> createState() => _CalcPreviewSheetState();
}

class _CalcPreviewSheetState extends ConsumerState<CalcPreviewSheet> {
  final _hCtrl = TextEditingController(text: '2.5');
  final _wCtrl = TextEditingController(text: '3.0');
  final _qtyCtrl = TextEditingController(text: '1');

  bool _loading = false;
  Quote? _quote;

  @override
  void dispose() {
    _hCtrl.dispose();
    _wCtrl.dispose();
    _qtyCtrl.dispose();
    super.dispose();
  }

  Future<void> _calculate() async {
    final w = _wCtrl.text.trim();
    final h = _hCtrl.text.trim();
    final qty = int.tryParse(_qtyCtrl.text.trim()) ?? 1;
    final wVal = double.tryParse(w);
    final hVal = double.tryParse(h);
    if (wVal == null || hVal == null || qty < 1) return;

    setState(() {
      _loading = true;
      _quote = null;
    });

    try {
      final request = CalcPreviewRequestDto(
        measurements: [
          CalcPreviewMeasurementDto(length: w, height: h, parts: const [], accessories: const []),
          for (var i = 1; i < qty; i++)
            CalcPreviewMeasurementDto(length: w, height: h, parts: const [], accessories: const []),
        ],
        services: const [],
      );
      final quote = await ref.read(pricingProvider.notifier).calcPreview(request);
      if (mounted) setState(() => _quote = quote);
    } on Exception {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(context.l10n.management_pricingPreviewError)));
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      title: context.l10n.management_pricingTest,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  controller: _wCtrl,
                  type: AppTextFieldType.number,
                  hintText: context.l10n.management_pricingCalcPreviewWidth,
                ),
              ),
              const SizedBox(width: AppSpacing.s),
              Expanded(
                child: AppTextField(
                  controller: _hCtrl,
                  type: AppTextFieldType.number,
                  hintText: context.l10n.management_pricingCalcPreviewHeight,
                ),
              ),
              const SizedBox(width: AppSpacing.s),
              Expanded(
                child: AppTextField(
                  controller: _qtyCtrl,
                  type: AppTextFieldType.number,
                  hintText: context.l10n.management_pricingCalcPreviewPieces,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.m),
          if (_quote != null) ...[
            SizedBox(
              height: 360,
              child: SingleChildScrollView(child: QuoteCardView(quote: _quote!)),
            ),
            const SizedBox(height: AppSpacing.m),
          ],
        ],
      ),
      action: AppButton(
        text: context.l10n.management_pricingCalcPreviewCalc,
        onPressed: _loading ? null : _calculate,
        isLoading: _loading,
      ),
    );
  }
}
