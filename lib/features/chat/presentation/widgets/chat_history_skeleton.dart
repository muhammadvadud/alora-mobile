import 'package:flutter/material.dart';

import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

/// Eski suhbat tarixi yuklanayotgan paytdagi chat ko'rinishi.
class ChatHistorySkeleton extends StatelessWidget {
  const ChatHistorySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l, vertical: AppSpacing.l),
      itemCount: 5,
      separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.l),
      itemBuilder: (context, index) {
        final isUser = index.isEven;
        return Align(
          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isUser) ...[
                const SkeletonBox(width: 32, height: 32, shape: BoxShape.circle),
                const SizedBox(width: AppSpacing.s),
              ],
              SkeletonBox(
                width: isUser ? 190 : 235,
                height: index == 2 ? 58 : 44,
                borderRadius: 18,
              ),
            ],
          ),
        );
      },
    );
  }
}
