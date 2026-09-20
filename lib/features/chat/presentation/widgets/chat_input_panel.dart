import 'package:alora_mobile/app/theme/app_spacing.dart';
import "package:alora_mobile/app/theme/app_radius.dart";
import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/widgets/app_icon_button.dart';

class ChatInputPanel extends StatefulWidget {
  final ValueChanged<String> onSend;
  final VoidCallback onMicPressed;
  final VoidCallback onAddPressed;
  final bool isStreaming;
  final bool disabled;

  const ChatInputPanel({
    super.key,
    required this.onSend,
    required this.onMicPressed,
    required this.onAddPressed,
    this.isStreaming = false,
    this.disabled = false,
  });

  @override
  State<ChatInputPanel> createState() => _ChatInputPanelState();
}

class _ChatInputPanelState extends State<ChatInputPanel> {
  final _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final hasText = _controller.text.trim().isNotEmpty;
      if (hasText != _hasText) {
        setState(() => _hasText = hasText);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isNotEmpty && !widget.isStreaming && !widget.disabled) {
      widget.onSend(text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = AppLocalizations.of(context)!;
    final canSend = _hasText && !widget.isStreaming && !widget.disabled;

    return Container(
      color: colors.background,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m, vertical: AppSpacing.s),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs), // center align with 44 height
            child: AppIconButton.muted(
              icon: AppIcons.plus,
              onPressed: widget.disabled ? null : widget.onAddPressed,
              semanticLabel: l10n.chat_addAttachment,
            ),
          ),
          const SizedBox(width: AppSpacing.s),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(minHeight: 44),
              decoration: BoxDecoration(
                color: colors.surfaceMuted,
                borderRadius: AppRadius.multilineInputBorder,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppSpacing.l),
                      child: TextField(
                        controller: _controller,
                        enabled: !widget.disabled,
                        maxLines: 6,
                        minLines: 1,
                        style: context.text.bodyL.copyWith(color: colors.textPrimary),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: l10n.chat_inputHint,
                          hintStyle: context.text.bodyL.copyWith(color: colors.textDisabled),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                        ),
                      ),
                    ),
                  ),
                  if (!_hasText)
                    _MicButton(
                      enabled: !widget.disabled,
                      onTap: widget.onMicPressed,
                      label: l10n.chat_microphone,
                    ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6, right: 6, left: AppSpacing.xs),
                    child: AppIconButton.accent(
                      icon: _hasText ? AppIcons.send : AppIcons.audioLines,
                      onPressed: _hasText
                          ? (canSend ? _handleSend : null)
                          : (widget.disabled ? null : widget.onMicPressed),
                      semanticLabel: _hasText ? l10n.chat_send : l10n.chat_microphone,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Pill ichidagi mikrofon ikonkasi (matn bo'sh bo'lganda ko'rinadi).
class _MicButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback? onTap;
  final String label;

  const _MicButton({required this.enabled, required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.s, right: AppSpacing.s, left: AppSpacing.s),
      child: Semantics(
        button: true,
        label: label,
        child: GestureDetector(
          onTap: enabled ? onTap : null,
          child: Icon(AppIcons.mic, color: context.colors.textSecondary, size: 24),
        ),
      ),
    );
  }
}
