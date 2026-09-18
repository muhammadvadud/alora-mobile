import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/chat/domain/entities/quote.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/quote_card.dart';
import 'package:alora_mobile/features/management/pricing/application/pricing_notifier.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/calc_preview_dto.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/calc_rule.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/discount_policy.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/discount_tier.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/order_defaults.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_bottom_sheet.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';

class PricingRulesScreen extends ConsumerWidget {
  const PricingRulesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pricingProvider);
    final notifier = ref.read(pricingProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.management_pricingTitle),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.calculator),
            onPressed: () => _showPreviewSheet(context),
            tooltip: context.l10n.management_pricingTest,
          ),
        ],
      ),
      body: state.isLoading
          ? const Padding(
              padding: EdgeInsets.all(AppSpacing.m),
              child: SkeletonList(
                itemCount: 5,
                itemBuilder: SkeletonBox(
                  width: double.infinity,
                  height: 60,
                  borderRadius: AppRadius.card,
                ),
              ),
            )
          : state.error != null
          ? Center(child: Text(state.error!))
          : RefreshIndicator(
              onRefresh: () => notifier.loadData(),
              child: ListView(
                padding: const EdgeInsets.all(AppSpacing.m),
                children: [
                  _SectionTitle(title: context.l10n.management_pricingCoefs),
                  _CalcRulesSection(rules: state.calcRules),
                  const SizedBox(height: AppSpacing.xl),

                  _SectionTitle(
                    title: context.l10n.management_pricingTiersTitle,
                  ),
                  _DiscountTiersTable(
                    tiers: state.discountTiers,
                    onAdd: (min, pct) => notifier.addDiscountTier(min, pct),
                    onDelete: (id) => notifier.deleteDiscountTier(id),
                  ),
                  if (state.discountPolicy != null) ...[
                    const SizedBox(height: AppSpacing.m),
                    _DiscountPolicyForm(policy: state.discountPolicy!),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      context.l10n.management_pricingPolicyHint,
                      style: context.text.bodyS.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.xl),

                  _SectionTitle(
                    title: context.l10n.management_pricingDefaultsTitle,
                  ),
                  if (state.orderDefaults != null)
                    _OrderDefaultsForm(defaults: state.orderDefaults!),
                ],
              ),
            ),
    );
  }

  void _showPreviewSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => const _CalcPreviewSheet(),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.m),
      child: Text(title, style: context.text.titleM),
    );
  }
}

class _FieldRow extends StatelessWidget {
  final String label;
  final String description;
  final Widget field;

  const _FieldRow({
    required this.label,
    required this.description,
    required this.field,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: context.text.bodyM),
                if (description.isNotEmpty)
                  Text(
                    description,
                    style: context.text.bodyS.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.m),
          SizedBox(width: 110, child: field),
        ],
      ),
    );
  }
}

class _CalcRulesSection extends ConsumerStatefulWidget {
  final List<CalcRule> rules;

  const _CalcRulesSection({required this.rules});

  @override
  ConsumerState<_CalcRulesSection> createState() => _CalcRulesSectionState();
}

class _CalcRulesSectionState extends ConsumerState<_CalcRulesSection> {
  final Map<String, TextEditingController> _controllers = {};
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _syncControllers();
  }

  @override
  void didUpdateWidget(covariant _CalcRulesSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncControllers();
  }

  void _syncControllers() {
    for (final key in _controllers.keys.toList()) {
      if (!widget.rules.any((r) => r.key == key)) {
        _controllers.remove(key)?.dispose();
      }
    }
    for (final rule in widget.rules) {
      _controllers.putIfAbsent(
        rule.key,
        () => TextEditingController(text: rule.value.toString()),
      );
    }
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    final changes = <String, String>{};
    for (final rule in widget.rules) {
      final raw = _controllers[rule.key]!.text.trim();
      final parsed = double.tryParse(raw);
      if (parsed == null || parsed == rule.value) continue;
      changes[rule.key] = raw;
    }
    if (changes.isEmpty) return;

    setState(() => _isSaving = true);
    final notifier = ref.read(pricingProvider.notifier);
    try {
      await Future.wait([
        for (final entry in changes.entries)
          notifier.updateCalcRule(entry.key, entry.value),
      ]);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.management_pricingSaveError)),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.rules.isEmpty)
          Text(
            context.l10n.management_pricingCoefsEmpty,
            style: context.text.bodyS.copyWith(
              color: context.colors.textSecondary,
            ),
          )
        else
          for (final rule in widget.rules)
            _FieldRow(
              label: rule.key,
              description: rule.description,
              field: AppTextField(
                controller: _controllers[rule.key],
                type: AppTextFieldType.number,
                hintText: rule.unit,
              ),
            ),
        if (widget.rules.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.m),
          AppButton(
            text: context.l10n.common_save,
            onPressed: _isSaving ? null : _save,
            isLoading: _isSaving,
          ),
        ],
      ],
    );
  }
}

class _DiscountTiersTable extends StatelessWidget {
  final List<DiscountTier> tiers;
  final void Function(int minAmount, double percent) onAdd;
  final void Function(String id) onDelete;

  const _DiscountTiersTable({
    required this.tiers,
    required this.onAdd,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (tiers.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.management_pricingTiersEmpty,
            style: context.text.bodyS.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.s),
          AppButton.secondary(
            text: context.l10n.management_pricingAddTier,
            onPressed: () => _showAddTierDialog(context),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowHeight: 40,
            dataRowMinHeight: 48,
            dataRowMaxHeight: 48,
            columns: [
              DataColumn(
                label: Text(context.l10n.management_pricingTierMinAmount),
              ),
              DataColumn(
                numeric: true,
                label: Text(context.l10n.management_pricingTierPercent),
              ),
              const DataColumn(label: Text('')),
            ],
            rows: [
              for (final t in tiers)
                DataRow(
                  cells: [
                    DataCell(Text(t.minAmount.toString())),
                    DataCell(Text('${t.percent}%')),
                    DataCell(
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(
                            LucideIcons.trash,
                            size: 18,
                            color: context.colors.danger,
                          ),
                          onPressed: () => onDelete(t.id),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.s),
        AppButton.secondary(
          text: context.l10n.management_pricingAddTier,
          onPressed: () => _showAddTierDialog(context),
        ),
      ],
    );
  }

  Future<void> _showAddTierDialog(BuildContext context) async {
    final minCtrl = TextEditingController();
    final pctCtrl = TextEditingController();
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.management_pricingAddTier),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              controller: minCtrl,
              type: AppTextFieldType.number,
              hintText: context.l10n.management_pricingTierMinAmount,
            ),
            const SizedBox(height: AppSpacing.s),
            AppTextField(
              controller: pctCtrl,
              type: AppTextFieldType.number,
              hintText: context.l10n.management_pricingTierPercent,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(context.l10n.management_pricingTierSave),
          ),
        ],
      ),
    );
    if (result != true) return;
    final min = int.tryParse(minCtrl.text.trim());
    final pct = double.tryParse(pctCtrl.text.trim());
    if (min != null && pct != null) onAdd(min, pct);
  }
}

class _DiscountPolicyForm extends ConsumerStatefulWidget {
  final DiscountPolicy policy;

  const _DiscountPolicyForm({required this.policy});

  @override
  ConsumerState<_DiscountPolicyForm> createState() =>
      _DiscountPolicyFormState();
}

class _DiscountPolicyFormState extends ConsumerState<_DiscountPolicyForm> {
  late final TextEditingController _empCtrl;
  late final TextEditingController _mgrCtrl;
  late bool _stackWithTier;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _empCtrl = TextEditingController(
      text: widget.policy.manualMaxPercentEmployee.toString(),
    );
    _mgrCtrl = TextEditingController(
      text: widget.policy.manualMaxPercentManager.toString(),
    );
    _stackWithTier = widget.policy.stackWithTier;
  }

  @override
  void didUpdateWidget(covariant _DiscountPolicyForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.policy.manualMaxPercentEmployee.toString() != _empCtrl.text) {
      _empCtrl.text = widget.policy.manualMaxPercentEmployee.toString();
    }
    if (widget.policy.manualMaxPercentManager.toString() != _mgrCtrl.text) {
      _mgrCtrl.text = widget.policy.manualMaxPercentManager.toString();
    }
    _stackWithTier = widget.policy.stackWithTier;
  }

  @override
  void dispose() {
    _empCtrl.dispose();
    _mgrCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final emp = double.tryParse(_empCtrl.text.trim());
    final mgr = double.tryParse(_mgrCtrl.text.trim());
    if (emp == null || mgr == null) return;
    if (emp == widget.policy.manualMaxPercentEmployee &&
        mgr == widget.policy.manualMaxPercentManager &&
        _stackWithTier == widget.policy.stackWithTier) {
      return;
    }

    setState(() => _isSaving = true);
    final notifier = ref.read(pricingProvider.notifier);
    try {
      await notifier.updateDiscountPolicy(
        emp,
        mgr,
        stackWithTier: _stackWithTier,
      );
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.management_pricingSaveError)),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller: _empCtrl,
                type: AppTextFieldType.number,
                hintText: context.l10n.management_pricingMaxEmployee,
              ),
            ),
            const SizedBox(width: AppSpacing.s),
            Expanded(
              child: AppTextField(
                controller: _mgrCtrl,
                type: AppTextFieldType.number,
                hintText: context.l10n.management_pricingMaxManager,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.s),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            context.l10n.management_pricingStackWithTier,
            style: context.text.bodyM,
          ),
          value: _stackWithTier,
          onChanged: (v) => setState(() => _stackWithTier = v),
        ),
        const SizedBox(height: AppSpacing.s),
        AppButton(
          text: context.l10n.common_save,
          onPressed: _isSaving ? null : _save,
          isLoading: _isSaving,
        ),
      ],
    );
  }
}

class _OrderDefaultsForm extends ConsumerStatefulWidget {
  final OrderDefaults defaults;

  const _OrderDefaultsForm({required this.defaults});

  @override
  ConsumerState<_OrderDefaultsForm> createState() => _OrderDefaultsFormState();
}

class _OrderDefaultsFormState extends ConsumerState<_OrderDefaultsForm> {
  late final TextEditingController _advCtrl;
  late final TextEditingController _delCtrl;
  late final TextEditingController _daysCtrl;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _advCtrl = TextEditingController(
      text: widget.defaults.defaultPrepaymentPercent.toString(),
    );
    _delCtrl = TextEditingController(
      text: widget.defaults.defaultDeliveryAmount.toString(),
    );
    _daysCtrl = TextEditingController(
      text: widget.defaults.deadlineDays.toString(),
    );
  }

  @override
  void didUpdateWidget(covariant _OrderDefaultsForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.defaults.defaultPrepaymentPercent.toString() != _advCtrl.text) {
      _advCtrl.text = widget.defaults.defaultPrepaymentPercent.toString();
    }
    if (widget.defaults.defaultDeliveryAmount.toString() != _delCtrl.text) {
      _delCtrl.text = widget.defaults.defaultDeliveryAmount.toString();
    }
    if (widget.defaults.deadlineDays.toString() != _daysCtrl.text) {
      _daysCtrl.text = widget.defaults.deadlineDays.toString();
    }
  }

  @override
  void dispose() {
    _advCtrl.dispose();
    _delCtrl.dispose();
    _daysCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final adv = double.tryParse(_advCtrl.text.trim());
    final del = int.tryParse(_delCtrl.text.trim());
    final days = int.tryParse(_daysCtrl.text.trim());
    if (adv == null || del == null || days == null) return;
    if (adv == widget.defaults.defaultPrepaymentPercent &&
        del == widget.defaults.defaultDeliveryAmount &&
        days == widget.defaults.deadlineDays) {
      return;
    }

    setState(() => _isSaving = true);
    final notifier = ref.read(pricingProvider.notifier);
    try {
      await notifier.updateOrderDefaults(adv, del, days);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.management_pricingSaveError)),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller: _advCtrl,
                type: AppTextFieldType.number,
                hintText: context.l10n.management_pricingAdvancePercent,
              ),
            ),
            const SizedBox(width: AppSpacing.s),
            Expanded(
              child: AppTextField(
                controller: _delCtrl,
                type: AppTextFieldType.number,
                hintText: context.l10n.management_pricingDeliveryPrice,
              ),
            ),
            const SizedBox(width: AppSpacing.s),
            Expanded(
              child: AppTextField(
                controller: _daysCtrl,
                type: AppTextFieldType.number,
                hintText: context.l10n.management_pricingDeadlineDays,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.m),
        AppButton(
          text: context.l10n.common_save,
          onPressed: _isSaving ? null : _save,
          isLoading: _isSaving,
        ),
      ],
    );
  }
}

class _CalcPreviewSheet extends ConsumerStatefulWidget {
  const _CalcPreviewSheet();

  @override
  ConsumerState<_CalcPreviewSheet> createState() => _CalcPreviewSheetState();
}

class _CalcPreviewSheetState extends ConsumerState<_CalcPreviewSheet> {
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
          CalcPreviewMeasurementDto(
            length: w,
            height: h,
            parts: const [],
            accessories: const [],
          ),
          for (var i = 1; i < qty; i++)
            CalcPreviewMeasurementDto(
              length: w,
              height: h,
              parts: const [],
              accessories: const [],
            ),
        ],
        services: const [],
      );
      final quote = await ref
          .read(pricingProvider.notifier)
          .calcPreview(request);
      if (mounted) setState(() => _quote = quote);
    } on Exception {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.management_pricingPreviewError)),
        );
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
              child: SingleChildScrollView(
                child: QuoteCardView(quote: _quote!),
              ),
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
