import "package:alora_mobile/app/theme/app_spacing.dart";
import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

class UserBubble extends StatelessWidget {
  final String text;

  const UserBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.8),
        margin: const EdgeInsets.only(bottom: AppSpacing.l),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l, vertical: 14),
        decoration: BoxDecoration(
          color: colors.surfaceMuted,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: Text(text, style: typography.bodyL.copyWith(color: colors.textPrimary)),
      ),
    );
  }
}

class AssistantMessageView extends StatelessWidget {
  final String text;

  const AssistantMessageView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final typography = context.text;
    final colors = context.colors;

    return Padding(
      padding: EdgeInsets.zero,
      child: _MarkdownLite(
        text: text,
        style: typography.bodyM.copyWith(color: colors.textPrimary),
      ),
    );
  }
}

class _MarkdownLite extends StatelessWidget {
  final String text;
  final TextStyle style;

  const _MarkdownLite({required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    final RegExp boldExp = RegExp(r'\*\*(.*?)\*\*');
    final matches = boldExp.allMatches(text);

    if (matches.isEmpty) {
      return Text(text, style: style);
    }

    final spans = <TextSpan>[];
    int currentPos = 0;

    for (final match in matches) {
      if (match.start > currentPos) {
        spans.add(TextSpan(text: text.substring(currentPos, match.start)));
      }
      spans.add(
        TextSpan(
          text: match.group(1),
          style: style.copyWith(fontWeight: FontWeight.w600),
        ),
      );
      currentPos = match.end;
    }

    if (currentPos < text.length) {
      spans.add(TextSpan(text: text.substring(currentPos)));
    }

    return RichText(
      text: TextSpan(style: style, children: spans),
    );
  }
}
