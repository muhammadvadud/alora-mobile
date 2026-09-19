import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';

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
    final canSend = _hasText && !widget.isStreaming && !widget.disabled;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.s),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadius.pillBorder,
        border: Border.all(color: colors.border, width: 1.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _AddButton(
            disabled: widget.disabled,
            onAddPressed: widget.onAddPressed,
          ),
          Expanded(
            child: _InputField(
              controller: _controller,
              disabled: widget.disabled,
            ),
          ),
          if (!_hasText)
            _MicButton(
              disabled: widget.disabled,
              onMicPressed: widget.onMicPressed,
            ),
          const SizedBox(width: 4),
          _SendButton(canSend: canSend, onSend: _handleSend),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final bool disabled;
  final VoidCallback onAddPressed;

  const _AddButton({required this.disabled, required this.onAddPressed});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = AppLocalizations.of(context)!;
    return IconButton(
      onPressed: disabled ? null : onAddPressed,
      icon: Icon(AppIcons.plus, color: colors.textSecondary),
      tooltip: l10n.chat_addAttachment,
      constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
      padding: EdgeInsets.zero,
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final bool disabled;

  const _InputField({required this.controller, required this.disabled});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = AppLocalizations.of(context)!;

    return TextField(
      controller: controller,
      enabled: !disabled,
      maxLines: 6,
      minLines: 1,
      style: context.text.bodyM.copyWith(color: colors.textPrimary),
      decoration: InputDecoration(
        hintText: l10n.chat_inputHint,
        hintStyle: context.text.bodyM.copyWith(color: colors.textSecondary),
        border: InputBorder.none,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
      ),
    );
  }
}

class _MicButton extends StatelessWidget {
  final bool disabled;
  final VoidCallback onMicPressed;

  const _MicButton({required this.disabled, required this.onMicPressed});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = AppLocalizations.of(context)!;

    return IconButton(
      onPressed: disabled ? null : onMicPressed,
      icon: Icon(AppIcons.mic, color: colors.textSecondary),
      tooltip: l10n.chat_microphone,
      constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
      padding: EdgeInsets.zero,
    );
  }
}

class _SendButton extends StatelessWidget {
  final bool canSend;
  final VoidCallback onSend;

  const _SendButton({required this.canSend, required this.onSend});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = AppLocalizations.of(context)!;

    return Semantics(
      button: true,
      label: l10n.chat_send,
      child: Container(
        width: 48,
        height: 48,
        alignment: Alignment.center,
        child: InkWell(
          onTap: canSend ? onSend : null,
          borderRadius: AppRadius.pillBorder,
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: canSend ? colors.accent : colors.surfaceDisabled,
              shape: BoxShape.circle,
            ),
            child: Icon(
              AppIcons.send,
              color: canSend ? colors.onAccent : colors.textDisabled,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
