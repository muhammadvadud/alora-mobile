import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/utils/debounce.dart';
import 'package:alora_mobile/core/utils/money_format.dart';
import 'package:alora_mobile/features/catalog/application/catalog_filter.dart';
import 'package:alora_mobile/features/catalog/application/catalog_notifier.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_enums.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_bottom_sheet.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';

/// [CatalogFilterSheet] natijasi.
class CatalogFilterSheetResult {
  final CatalogFilter filter;
  final bool applied;

  const CatalogFilterSheetResult({required this.filter, required this.applied});
}

/// Filtr sheeti (S-17): tur, uslub, xona, naqsh, shaffoflik, segment,
/// narx slayderi; "Tozalash" · "Ko'rsatish (N ta)".
class CatalogFilterSheet extends ConsumerStatefulWidget {
  final CatalogFilter initial;

  const CatalogFilterSheet({super.key, required this.initial});

  @override
  ConsumerState<CatalogFilterSheet> createState() => _CatalogFilterSheetState();
}

class _CatalogFilterSheetState extends ConsumerState<CatalogFilterSheet> {
  late CatalogFilter _draft;
  final _countDebouncer = Debouncer(delay: const Duration(milliseconds: 300));
  int _previewCount = 0;

  @override
  void initState() {
    super.initState();
    _draft = widget.initial;
  }

  @override
  void dispose() {
    _countDebouncer.cancel();
    super.dispose();
  }

  void _update(CatalogFilter next) {
    setState(() => _draft = next);
    _countDebouncer.run(() async {
      final count = await ref.read(catalogProvider.notifier).previewCount(next);
      if (mounted) setState(() => _previewCount = count);
    });
  }

  void _clear() {
    _update(const CatalogFilter());
  }

  void _apply() {
    Navigator.of(context).pop(CatalogFilterSheetResult(filter: _draft, applied: true));
  }

  int _defaultCount() => ref.read(catalogProvider).products.length;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AppBottomSheet(
      title: l10n.catalog_filter,
      content: _FilterContent(filter: _draft, onUpdate: _update),
      action: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: AppButton.text(text: l10n.catalog_filterClear, onPressed: _clear),
          ),
          const SizedBox(height: AppSpacing.m),
          AppButton(
            text: l10n.catalog_filterShow(_previewCount > 0 ? _previewCount : _defaultCount()),
            onPressed: _apply,
          ),
        ],
      ),
    );
  }
}

class _FilterContent extends StatelessWidget {
  static final List<ProductStyle> _styleValues = ProductStyle.values
      .where((s) => s != ProductStyle.unknown)
      .toList();
  static final List<ProductRoom> _roomValues = ProductRoom.values
      .where((r) => r != ProductRoom.unknown)
      .toList();
  static final List<ProductPattern> _patternValues = ProductPattern.values
      .where((p) => p != ProductPattern.unknown)
      .toList();
  static final List<ProductTransparency> _transparencyValues = ProductTransparency.values
      .where((t) => t != ProductTransparency.unknown)
      .toList();
  static final List<ProductSegment> _segmentValues = ProductSegment.values
      .where((s) => s != ProductSegment.unknown)
      .toList();

  final CatalogFilter filter;
  final ValueChanged<CatalogFilter> onUpdate;

  const _FilterContent({required this.filter, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final current = filter;

    return ListView(
      shrinkWrap: true,
      children: [
        _EnumChipSection<ProductType>(
          label: l10n.catalog_filterType,
          values: const [ProductType.fabric, ProductType.accessory],
          current: current.type,
          labelFor: (l10n, v) => v == ProductType.fabric
              ? l10n.catalog_filterTypeFabric
              : l10n.catalog_filterTypeAccessory,
          onSelect: (v) => onUpdate(current.copyWith(type: current.type == v ? null : v)),
        ),
        _EnumChipSection<ProductStyle>(
          label: l10n.catalog_filterStyle,
          values: _styleValues,
          current: current.style,
          labelFor: _styleLabel,
          onSelect: (v) => onUpdate(current.copyWith(style: current.style == v ? null : v)),
        ),
        _EnumChipSection<ProductRoom>(
          label: l10n.catalog_filterRoom,
          values: _roomValues,
          current: current.room,
          labelFor: _roomLabel,
          onSelect: (v) => onUpdate(current.copyWith(room: current.room == v ? null : v)),
        ),
        _EnumChipSection<ProductPattern>(
          label: l10n.catalog_filterPattern,
          values: _patternValues,
          current: current.pattern,
          labelFor: _patternLabel,
          onSelect: (v) => onUpdate(current.copyWith(pattern: current.pattern == v ? null : v)),
        ),
        _EnumChipSection<ProductTransparency>(
          label: l10n.catalog_filterTransparency,
          values: _transparencyValues,
          current: current.transparency,
          labelFor: _transparencyLabel,
          onSelect: (v) =>
              onUpdate(current.copyWith(transparency: current.transparency == v ? null : v)),
        ),
        _EnumChipSection<ProductSegment>(
          label: l10n.catalog_filterSegment,
          values: _segmentValues,
          current: current.segment,
          labelFor: _segmentLabel,
          onSelect: (v) => onUpdate(current.copyWith(segment: current.segment == v ? null : v)),
        ),
        _PriceRangeSection(
          filter: current,
          onChanged: (minPrice, maxPrice) =>
              onUpdate(current.copyWith(minPrice: minPrice, maxPrice: maxPrice)),
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  final String label;
  final List<Widget> children;

  const _Section({required this.label, required this.children});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: typography.overline.copyWith(color: colors.brass)),
        const SizedBox(height: AppSpacing.s),
        Wrap(spacing: AppSpacing.s, runSpacing: AppSpacing.s, children: children),
        const SizedBox(height: AppSpacing.l),
      ],
    );
  }
}

class _EnumChipSection<T> extends StatelessWidget {
  final String label;
  final List<T> values;
  final T? current;
  final String Function(AppLocalizations l10n, T value) labelFor;
  final ValueChanged<T> onSelect;

  const _EnumChipSection({
    required this.label,
    required this.values,
    required this.current,
    required this.labelFor,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return _Section(
      label: label,
      children: [
        for (final value in values)
          AppChip(
            label: labelFor(l10n, value),
            state: current == value ? AppChipState.selected : AppChipState.unselected,
            onTap: () => onSelect(value),
          ),
      ],
    );
  }
}

class _PriceRangeSection extends StatelessWidget {
  static const double _minPriceBound = 0;
  static const double _maxPriceBound = 1000000;
  static const double _priceStep = 10000;

  final CatalogFilter filter;
  final void Function(int? minPrice, int? maxPrice) onChanged;

  const _PriceRangeSection({required this.filter, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    final minPrice = filter.minPrice ?? _minPriceBound.toInt();
    final maxPrice = filter.maxPrice ?? _maxPriceBound.toInt();

    return _Section(
      label: l10n.catalog_filterPrice,
      children: [
        Text(
          l10n.catalog_filterPriceRangeFormatted(
            formatMoneyPlain(minPrice),
            formatMoneyPlain(maxPrice),
          ),
          style: typography.bodyM.copyWith(color: colors.textSecondary),
        ),
        const SizedBox(height: AppSpacing.s),
        RangeSlider(
          values: RangeValues(
            minPrice.toDouble().clamp(_minPriceBound, _maxPriceBound),
            maxPrice.toDouble().clamp(_minPriceBound, _maxPriceBound),
          ),
          min: _minPriceBound,
          max: _maxPriceBound,
          divisions: ((_maxPriceBound - _minPriceBound) / _priceStep).round(),
          activeColor: colors.accent,
          inactiveColor: colors.border,
          onChanged: (values) => onChanged(values.start.round(), values.end.round()),
        ),
      ],
    );
  }
}

String _styleLabel(AppLocalizations l10n, ProductStyle style) {
  switch (style) {
    case ProductStyle.klassik:
      return l10n.catalog_filterStyleKlassik;
    case ProductStyle.zamonaviy:
      return l10n.catalog_filterStyleZamonaviy;
    case ProductStyle.minimalist:
      return l10n.catalog_filterStyleMinimalist;
    case ProductStyle.unknown:
      return '';
  }
}

String _roomLabel(AppLocalizations l10n, ProductRoom room) {
  switch (room) {
    case ProductRoom.mehmonxona:
      return l10n.catalog_filterRoomMehmonxona;
    case ProductRoom.yotoqxona:
      return l10n.catalog_filterRoomYotoqxona;
    case ProductRoom.oshxona:
      return l10n.catalog_filterRoomOshxona;
    case ProductRoom.bolalarXonasi:
      return l10n.catalog_filterRoomBolalarXonasi;
    case ProductRoom.ofis:
      return l10n.catalog_filterRoomOfis;
    case ProductRoom.unknown:
      return '';
  }
}

String _patternLabel(AppLocalizations l10n, ProductPattern pattern) {
  switch (pattern) {
    case ProductPattern.yassi:
      return l10n.catalog_filterPatternYassi;
    case ProductPattern.gulli:
      return l10n.catalog_filterPatternGulli;
    case ProductPattern.chiziqli:
      return l10n.catalog_filterPatternChiziqli;
    case ProductPattern.geometrik:
      return l10n.catalog_filterPatternGeometrik;
    case ProductPattern.unknown:
      return '';
  }
}

String _transparencyLabel(AppLocalizations l10n, ProductTransparency transparency) {
  switch (transparency) {
    case ProductTransparency.yopiq:
      return l10n.catalog_filterTransparencyYopiq;
    case ProductTransparency.yarimYorug:
      return l10n.catalog_filterTransparencyYarimYorug;
    case ProductTransparency.yorug:
      return l10n.catalog_filterTransparencyYorug;
    case ProductTransparency.unknown:
      return '';
  }
}

String _segmentLabel(AppLocalizations l10n, ProductSegment segment) {
  switch (segment) {
    case ProductSegment.economy:
      return l10n.catalog_filterSegmentEconomy;
    case ProductSegment.standard:
      return l10n.catalog_filterSegmentStandard;
    case ProductSegment.premium:
      return l10n.catalog_filterSegmentPremium;
    case ProductSegment.unknown:
      return '';
  }
}
