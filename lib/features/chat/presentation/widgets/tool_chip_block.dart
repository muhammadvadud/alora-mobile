import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
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

    String label = l10n.tool_label_unknown;
    switch (tool) {
      case 'product_search':
        label = l10n.tool_label_product_search;
        break;
      case 'curtain_calculate':
        label = l10n.tool_label_curtain_calculate;
        break;
      case 'price_quote':
        label = l10n.tool_label_price_quote;
        break;
      case 'order_draft':
        label = l10n.tool_label_order_draft;
        break;
      case 'variants':
        label = l10n.tool_label_variants;
        break;
    }

    if (state == ToolChipState.running) {
      // label is used internally
    } else if (state == ToolChipState.done) {
      if (resultText != null && resultText!.isNotEmpty) {
        label = resultText!;
      } else {
        label = l10n.chat_tool_result;
      }
    } else {
      label = l10n.common_error;
    }

    ui_tool_chip.ToolChipState widgetState = ui_tool_chip.ToolChipState.running;
    if (state == ToolChipState.done) {
      widgetState = ui_tool_chip.ToolChipState.done;
    }
    if (state == ToolChipState.error) {
      widgetState = ui_tool_chip.ToolChipState.error;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
      child: ui_tool_chip.ToolChip(
        text: label,
        state: widgetState,
        onTap: onTap,
      ),
    );
  }
}
