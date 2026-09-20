import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/management/pricing/application/pricing_notifier.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/service_price.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:alora_mobile/shared/widgets/app_bottom_sheet.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/app_list_tile.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/unit_text.dart';

/// Hisobda ishlatiladigan xizmatlar va ularning narxlarini tahrirlash bo'limi.
class ServicePricesSection extends StatelessWidget {
  const ServicePricesSection({super.key, required this.services});

  final List<ServicePrice> services;

  @override
  Widget build(BuildContext context) {
    if (services.isEmpty) {
      return Text(
        context.l10n.management_pricingServicesEmpty,
        style: context.text.bodyS.copyWith(color: context.colors.textSecondary),
      );
    }

    return AppCard.sections(
      sections: services
          .map(
            (service) => AppListTile(
              title: service.name.isEmpty ? service.key : service.name,
              subtitle: service.isActive
                  ? context.l10n.management_pricingServiceActive
                  : context.l10n.management_pricingServiceInactive,
              trailing: UnitText(amount: service.price, unit: _priceUnit(service.unit)),
              showDivider: false,
              onTap: () => _openEditor(context, service),
            ),
          )
          .toList(),
    );
  }

  PriceUnit _priceUnit(String value) {
    return switch (value) {
      'per_sqm' => PriceUnit.perSqm,
      'per_piece' => PriceUnit.perPiece,
      'per_meter' => PriceUnit.perMeter,
      _ => PriceUnit.unknown,
    };
  }

  void _openEditor(BuildContext context, ServicePrice service) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _ServicePriceEditSheet(service: service),
    );
  }
}

class _ServicePriceEditSheet extends ConsumerStatefulWidget {
  const _ServicePriceEditSheet({required this.service});

  final ServicePrice service;

  @override
  ConsumerState<_ServicePriceEditSheet> createState() => _ServicePriceEditSheetState();
}

class _ServicePriceEditSheetState extends ConsumerState<_ServicePriceEditSheet> {
  late final TextEditingController _controller;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.service.price.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final price = int.tryParse(_controller.text.trim());
    if (price == null || price < 0) return;
    if (price == widget.service.price) {
      if (mounted) Navigator.of(context).pop();
      return;
    }

    setState(() => _isSaving = true);
    try {
      await ref.read(pricingProvider.notifier).updateService(widget.service, price);
      if (mounted) Navigator.of(context).pop();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(context.l10n.management_pricingSaveError)));
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: AppBottomSheet(
        title: widget.service.name,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.management_pricingServicePriceHint,
              style: context.text.bodyS.copyWith(color: context.colors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.m),
            AppTextField(
              controller: _controller,
              type: AppTextFieldType.number,
              hintText: context.l10n.management_pricingServicePrice,
            ),
            const SizedBox(height: AppSpacing.xl),
            AppButton(
              text: context.l10n.common_save,
              onPressed: _isSaving ? null : _save,
              isLoading: _isSaving,
            ),
          ],
        ),
      ),
    );
  }
}
