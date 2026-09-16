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
  static const double _minPriceBound = 0;
  static const double _maxPriceBound = 1000000;
  static const double _priceStep = 10000;

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
    Navigator.of(context)
        .pop(CatalogFilterSheetResult(filter: _draft, applied: true));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    final typography = context.text;
    final filter = _draft;

    return AppBottomSheet(
      title: l10n.catalog_filter,
      content: ListView(
        shrinkWrap: true,
        children: [
          _Section(
            label: l10n.catalog_filterType,
            children: [
              AppChip(
                label: l10n.catalog_filterTypeFabric,
                state: filter.type == ProductType.fabric
                    ? AppChipState.selected
                    : AppChipState.unselected,
                onTap: () => _update(
                  filter.copyWith(
                    type: filter.type == ProductType.fabric
                        ? null
                        : ProductType.fabric,
                  ),
                ),
              ),
              AppChip(
                label: l10n.catalog_filterTypeAccessory,
                state: filter.type == ProductType.accessory
                    ? AppChipState.selected
                    : AppChipState.unselected,
                onTap: () => _update(
                  filter.copyWith(
                    type: filter.type == ProductType.accessory
                        ? null
                        : ProductType.accessory,
                  ),
                ),
              ),
            ],
          ),
          _Section(
            label: l10n.catalog_filterStyle,
            children: [
              for (final style in ProductStyle.values) ...[
                if (style != ProductStyle.unknown)
                  AppChip(
                    label: _styleLabel(l10n, style),
                    state: filter.style == style
                        ? AppChipState.selected
                        : AppChipState.unselected,
                    onTap: () => _update(
                      filter.copyWith(
                        style: filter.style == style ? null : style,
                      ),
                    ),
                  ),
              ],
            ],
          ),
          _Section(
            label: l10n.catalog_filterRoom,
            children: [
              for (final room in ProductRoom.values) ...[
                if (room != ProductRoom.unknown)
                  AppChip(
                    label: _roomLabel(l10n, room),
                    state: filter.room == room
                        ? AppChipState.selected
                        : AppChipState.unselected,
                    onTap: () => _update(
                      filter.copyWith(room: filter.room == room ? null : room),
                    ),
                  ),
              ],
            ],
          ),
          _Section(
            label: l10n.catalog_filterPattern,
            children: [
              for (final pattern in ProductPattern.values) ...[
                if (pattern != ProductPattern.unknown)
                  AppChip(
                    label: _patternLabel(l10n, pattern),
                    state: filter.pattern == pattern
                        ? AppChipState.selected
                        : AppChipState.unselected,
                    onTap: () => _update(
                      filter.copyWith(
                        pattern: filter.pattern == pattern ? null : pattern,
                      ),
                    ),
                  ),
              ],
            ],
          ),
          _Section(
            label: l10n.catalog_filterTransparency,
            children: [
              for (final transparency in ProductTransparency.values) ...[
                if (transparency != ProductTransparency.unknown)
                  AppChip(
                    label: _transparencyLabel(l10n, transparency),
                    state: filter.transparency == transparency
                        ? AppChipState.selected
                        : AppChipState.unselected,
                    onTap: () => _update(
                      filter.copyWith(
                        transparency: filter.transparency == transparency
                            ? null
                            : transparency,
                      ),
                    ),
                  ),
              ],
            ],
          ),
          _Section(
            label: l10n.catalog_filterSegment,
            children: [
              for (final segment in ProductSegment.values) ...[
                if (segment != ProductSegment.unknown)
                  AppChip(
                    label: _segmentLabel(l10n, segment),
                    state: filter.segment == segment
                        ? AppChipState.selected
                        : AppChipState.unselected,
                    onTap: () => _update(
                      filter.copyWith(
                        segment: filter.segment == segment ? null : segment,
                      ),
                    ),
                  ),
              ],
            ],
          ),
          _Section(
            label: l10n.catalog_filterPrice,
            children: [
              Text(
                l10n.catalog_filterPriceRangeFormatted(
                  formatMoneyPlain(_minPrice(filter)),
                  formatMoneyPlain(_maxPrice(filter)),
                ),
                style: typography.bodyM.copyWith(color: colors.textSecondary),
              ),
              const SizedBox(height: AppSpacing.s),
              RangeSlider(
                values: RangeValues(
                  _minPrice(filter)
                      .toDouble()
                      .clamp(_minPriceBound, _maxPriceBound),
                  _maxPrice(filter)
                      .toDouble()
                      .clamp(_minPriceBound, _maxPriceBound),
                ),
                min: _minPriceBound,
                max: _maxPriceBound,
                divisions: ((_maxPriceBound - _minPriceBound) / _priceStep)
                    .round(),
                activeColor: colors.accent,
                inactiveColor: colors.border,
                onChanged: (values) => _update(
                  filter.copyWith(
                    minPrice: values.start.round(),
                    maxPrice: values.end.round(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      action: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: AppButton.text(
              text: l10n.catalog_filterClear,
              onPressed: _clear,
            ),
          ),
          const SizedBox(height: AppSpacing.m),
          AppButton(
            text: l10n.catalog_filterShow(
              _previewCount > 0 ? _previewCount : _defaultCount(),
            ),
            onPressed: _apply,
          ),
        ],
      ),
    );
  }

  int _minPrice(CatalogFilter filter) =>
      filter.minPrice ?? _minPriceBound.toInt();

  int _maxPrice(CatalogFilter filter) =>
      filter.maxPrice ?? _maxPriceBound.toInt();

  int _defaultCount() => ref.read(catalogProvider).products.length;

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

  String _transparencyLabel(
    AppLocalizations l10n,
    ProductTransparency transparency,
  ) {
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
        Wrap(
          spacing: AppSpacing.s,
          runSpacing: AppSpacing.s,
          children: children,
        ),
        const SizedBox(height: AppSpacing.l),
      ],
    );
  }
}
