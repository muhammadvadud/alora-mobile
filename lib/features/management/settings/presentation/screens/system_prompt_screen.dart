import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/utils/date_format.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart' show authProvider;
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/features/management/settings/application/settings_notifiers.dart';
import 'package:alora_mobile/features/management/settings/domain/entities/prompt_version.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/models/role.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/app_dialog.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/role_gate.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

class SystemPromptScreen extends ConsumerStatefulWidget {
  const SystemPromptScreen({super.key});

  @override
  ConsumerState<SystemPromptScreen> createState() => _SystemPromptScreenState();
}

class _SystemPromptScreenState extends ConsumerState<SystemPromptScreen> {
  final TextEditingController _controller = TextEditingController();
  String? _lastSetContent;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _syncController(AsyncValue<PromptHistory> state) {
    final content = state.asData?.value.current.content;
    if (content != null && content != _lastSetContent) {
      _lastSetContent = content;
      _controller.text = content;
    }
  }

  void _save() {
    unawaited(ref.read(promptHistoryProvider.notifier).createPrompt(_controller.text));
  }

  Future<void> _rollback(String id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AppDialog(
        title: context.l10n.settings_rollbackConfirmTitle,
        content: context.l10n.settings_rollbackConfirmMessage,
        primaryActionText: context.l10n.settings_rollback,
        onPrimaryAction: () => Navigator.of(dialogContext).pop(true),
        secondaryActionText: context.l10n.common_cancel,
        onSecondaryAction: () => Navigator.of(dialogContext).pop(false),
      ),
    );

    if (confirmed == true) {
      unawaited(ref.read(promptHistoryProvider.notifier).rollbackPrompt(id));
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(promptHistoryProvider, (previous, next) {
      _syncController(next);
    });

    final state = ref.watch(promptHistoryProvider);

    final currentRole = ref
        .watch(authProvider)
        .maybeWhen(authenticated: (user) => user.role, orElse: () => Role.employee);

    return RoleGate(
      minRole: Role.admin,
      currentRole: currentRole,
      child: Scaffold(
        appBar: AppBar(title: Text(context.l10n.settings_systemPromptTitle)),
        body: state.when(
          data: (history) => SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.l),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionLabel(context.l10n.settings_currentPrompt),
                const SizedBox(height: AppSpacing.s),
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppTextField(
                        controller: _controller,
                        hintText: context.l10n.settings_promptHint,
                        type: AppTextFieldType.multiline,
                        maxLines: 10,
                      ),
                      const SizedBox(height: AppSpacing.m),
                      AppButton(
                        text: context.l10n.settings_saveNewVersion,
                        onPressed: _save,
                        type: AppButtonType.primary,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                SectionLabel(context.l10n.settings_versionHistory),
                const SizedBox(height: AppSpacing.s),
                if (history.history.isNotEmpty)
                  AppCard.sections(
                    sections: history.history
                        .map((v) => _VersionCard(version: v, onRollback: _rollback))
                        .toList(),
                  ),
              ],
            ),
          ),
          loading: () => const Padding(
            padding: EdgeInsets.all(AppSpacing.l),
            child: SkeletonList(
              itemCount: 3,
              itemBuilder: SkeletonBox(
                width: double.infinity,
                height: 100,
                borderRadius: AppRadius.card,
              ),
            ),
          ),
          error: (e, st) => ErrorState(onRetry: () => ref.invalidate(promptHistoryProvider)),
        ),
      ),
    );
  }
}

class _VersionCard extends StatelessWidget {
  final PromptVersion version;
  final ValueChanged<String> onRollback;

  const _VersionCard({required this.version, required this.onRollback});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.settings_version(version.version), style: typography.titleS),
              if (version.createdAt != null)
                Text(
                  formatDate(version.createdAt!, context: context),
                  style: typography.bodyS.copyWith(color: colors.textSecondary),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            version.authorName ?? l10n.settings_authorUnknown,
            style: typography.bodyS.copyWith(color: colors.textSecondary),
          ),
          const SizedBox(height: AppSpacing.m),
          AppButton(
            text: l10n.settings_rollback,
            onPressed: () => onRollback(version.id),
            type: AppButtonType.secondary,
          ),
        ],
      ),
    );
  }
}
