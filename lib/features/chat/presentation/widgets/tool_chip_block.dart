import "package:alora_mobile/app/theme/app_spacing.dart";
import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/tool_chip.dart' as ui_tool_chip;

class ToolChipBlockView extends StatelessWidget {
  final String tool;
  final ToolChipState state;
  final String? resultText;
  final VoidCallback? onTap;

  const ToolChipBlockView({
    super.key,
    required this.tool,
    required this.state,
    this.resultText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    final typography = context.text;

    String toolLabel = l10n.tool_label_unknown;
    switch (tool) {
      case 'product_search':
        toolLabel = l10n.tool_label_product_search;
        break;
      case 'curtain_calculate':
        toolLabel = l10n.tool_label_curtain_calculate;
        break;
      case 'price_quote':
        toolLabel = l10n.tool_label_price_quote;
        break;
      case 'order_draft':
        toolLabel = l10n.tool_label_order_draft;
        break;
      case 'variants':
        toolLabel = l10n.tool_label_variants;
        break;
      case 'build_options':
        toolLabel = l10n.tool_label_variants;
        break;
    }

    String labelText = toolLabel;

    if (state == ToolChipState.running) {
      // labelText remains toolLabel
    } else if (state == ToolChipState.done) {
      if (resultText != null && resultText!.isNotEmpty) {
        labelText = resultText!;
      } else {
        labelText = l10n.chat_tool_result;
      }
    } else {
      labelText = l10n.common_error;
    }

    ui_tool_chip.ToolChipState widgetState = ui_tool_chip.ToolChipState.running;
    if (state == ToolChipState.done) {
      widgetState = ui_tool_chip.ToolChipState.done;
    }
    if (state == ToolChipState.error) {
      widgetState = ui_tool_chip.ToolChipState.error;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.s, top: AppSpacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (state == ToolChipState.done || state == ToolChipState.error) ...[
            Text(toolLabel, style: typography.bodyS.copyWith(color: colors.textSecondary)),
            const SizedBox(height: 4),
          ],
          ui_tool_chip.ToolChip(text: labelText, state: widgetState, onTap: onTap),
        ],
      ),
    );
  }
}
