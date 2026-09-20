import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/error/failure_l10n.dart';
import 'package:alora_mobile/core/utils/date_format.dart';
import 'package:alora_mobile/features/conversations/application/conversations_notifier.dart';
import 'package:alora_mobile/features/conversations/application/conversations_state.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_stage.dart';
import 'package:alora_mobile/features/conversations/presentation/conversation_date_groups.dart';
import 'package:alora_mobile/features/conversations/presentation/widgets/conversation_row.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';
import 'package:alora_mobile/shared/widgets/app_dialog.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/empty_state.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

class ConversationsPane extends ConsumerStatefulWidget {
  const ConversationsPane({super.key, this.clock});
  final DateTime Function()? clock;

  @override
  ConsumerState<ConversationsPane> createState() => _ConversationsPaneState();
}

class _ConversationsPaneState extends ConsumerState<ConversationsPane> {
  static const double _loadMoreThreshold = 300;

  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.extentAfter < _loadMoreThreshold) {
      ref.read(conversationsProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(conversationsProvider);
    final notifier = ref.read(conversationsProvider.notifier);
    final filterType = state.maybeWhen(
      loaded: (_, _, _, _, filterType) => filterType,
      empty: (_, filterType) => filterType,
      error: (_, _, filterType) => filterType,
      orElse: () => ConversationFilterType.all,
    );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenH,
            AppSpacing.l,
            AppSpacing.screenH,
            0,
          ),
          child: AppTextField(
            type: AppTextFieldType.search,
            hintText: l10n.conversations_searchHint,
            controller: _searchController,
            onChanged: notifier.search,
          ),
        ),
        const SizedBox(height: AppSpacing.m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenH),
          child: Row(
            children: [
              Expanded(
                child: _FilterChip(
                  label: l10n.conversations_filterAll,
                  isSelected: filterType == ConversationFilterType.all,
                  onTap: () => notifier.setFilter(ConversationFilterType.all),
                ),
              ),
              const SizedBox(width: AppSpacing.s),
              Expanded(
                child: _FilterChip(
                  label: l10n.conversations_filterHasOrder,
                  isSelected: filterType == ConversationFilterType.hasOrder,
                  onTap: () => notifier.setFilter(ConversationFilterType.hasOrder),
                ),
              ),
              const SizedBox(width: AppSpacing.s),
              Expanded(
                child: _FilterChip(
                  label: l10n.conversations_filterInProgress,
                  isSelected: filterType == ConversationFilterType.inProgress,
                  onTap: () => notifier.setFilter(ConversationFilterType.inProgress),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.l),
        Expanded(
          child: _PaneBody(state: state, clock: widget.clock, scrollController: _scrollController),
        ),
      ],
    );
  }
}

class _PaneBody extends ConsumerWidget {
  final ConversationsState state;
  final DateTime Function()? clock;
  final ScrollController scrollController;

  const _PaneBody({required this.state, required this.clock, required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return state.maybeWhen(
      initial: () => const _PaneLoading(),
      loading: (_, _) => const _PaneLoading(),
      error: (failure, _, _) => ErrorState(
        message: failure.localizedMessage(context),
        onRetry: ref.read(conversationsProvider.notifier).retry,
      ),
      empty: (_, _) => EmptyState(
        icon: AppIcons.chat,
        title: l10n.conversations_emptyTitle,
        message: l10n.conversations_emptyMessage,
      ),
      loaded: (items, _, _, _, filterType) => _PaneLoaded(
        items: items,
        filterType: filterType,
        clock: clock,
        scrollController: scrollController,
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }
}

class _PaneLoading extends StatelessWidget {
  const _PaneLoading();

  @override
  Widget build(BuildContext context) {
    return const SkeletonList(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenH),
      itemCount: 6,
      itemBuilder: SkeletonBox(height: 84),
    );
  }
}

class _PaneLoaded extends ConsumerWidget {
  final List<Conversation> items;
  final ConversationFilterType filterType;
  final DateTime Function()? clock;
  final ScrollController scrollController;

  const _PaneLoaded({
    required this.items,
    required this.filterType,
    required this.clock,
    required this.scrollController,
  });

  Future<bool?> _confirmArchive(BuildContext context, String id) async {
    final l10n = AppLocalizations.of(context)!;
    return showDialog<bool>(
      context: context,
      builder: (context) => AppDialog(
        title: l10n.conversations_archiveDialogTitle,
        content: l10n.conversations_archiveDialogMessage,
        primaryActionText: l10n.conversations_archive,
        secondaryActionText: l10n.common_cancel,
        isDestructive: true,
        onPrimaryAction: () => Navigator.of(context).pop(true),
        onSecondaryAction: () => Navigator.of(context).pop(false),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final filtered = applyConversationFilter(items, filterType);
    if (filtered.isEmpty) {
      return EmptyState(
        icon: AppIcons.search,
        title: l10n.conversations_emptyFilteredTitle,
        message: l10n.conversations_emptyFilteredMessage,
      );
    }

    final now = (clock ?? DateTime.now)();
    final grouped = groupConversationsByDate(filtered, now: now);
    final entries = <_PaneEntry>[];
    for (final group in ConversationDateGroup.values) {
      final groupItems = grouped[group]!;
      if (groupItems.isEmpty) continue;
      entries.add(_PaneHeader(group: group));
      for (final conversation in groupItems) {
        entries.add(_PaneRow(group: group, conversation: conversation));
      }
    }

    return RefreshIndicator(
      onRefresh: ref.read(conversationsProvider.notifier).refresh,
      child: ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final entry = entries[index];
          return switch (entry) {
            _PaneHeader(:final group) => Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.screenH,
                AppSpacing.l,
                AppSpacing.screenH,
                AppSpacing.s,
              ),
              child: SectionLabel(_headerLabel(context, group)),
            ),
            _PaneRow(:final conversation, :final group) => Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.screenH,
                AppSpacing.xs,
                AppSpacing.screenH,
                AppSpacing.xs,
              ),
              child: Dismissible(
                key: ValueKey(conversation.id),
                direction: DismissDirection.endToStart,
                background: const _ArchiveBackground(),
                confirmDismiss: (_) => _confirmArchive(context, conversation.id),
                onDismissed: (_) =>
                    unawaited(ref.read(conversationsProvider.notifier).archive(conversation.id)),
                child: ConversationRow(
                  conversation: conversation,
                  stageLabel: _stageLabel(context, conversation.stage),
                  timeLabel: _timeLabel(context, conversation, group),
                  onTap: () => context.push(AppRoutes.chatConversation(conversation.id)),
                ),
              ),
            ),
          };
        },
      ),
    );
  }

  String _headerLabel(BuildContext context, ConversationDateGroup group) {
    final l10n = AppLocalizations.of(context)!;
    return switch (group) {
      ConversationDateGroup.today => l10n.conversations_groupToday,
      ConversationDateGroup.yesterday => l10n.conversations_groupYesterday,
      ConversationDateGroup.thisWeek => l10n.conversations_groupThisWeek,
      ConversationDateGroup.older => l10n.conversations_groupOlder,
    };
  }

  String _stageLabel(BuildContext context, ConversationStage stage) {
    final l10n = AppLocalizations.of(context)!;
    return switch (stage) {
      ConversationStage.need => l10n.conversations_stageNeed,
      ConversationStage.recommend => l10n.conversations_stageRecommend,
      ConversationStage.measure => l10n.conversations_stageMeasure,
      ConversationStage.calc => l10n.conversations_stageCalc,
      ConversationStage.variants => l10n.conversations_stageVariants,
      ConversationStage.order => l10n.conversations_stageOrder,
      ConversationStage.unknown => l10n.conversations_stageUnknown,
    };
  }

  String _timeLabel(BuildContext context, Conversation conversation, ConversationDateGroup group) {
    final date = conversation.lastMessageAt;
    if (date == null) return '';
    if (group == ConversationDateGroup.older) {
      return formatDate(date, context: context, short: true);
    }
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

class _ArchiveBackground extends StatelessWidget {
  const _ArchiveBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.dangerSoft,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.fromLTRB(0, 0, AppSpacing.xl, 0),
      child: Icon(AppIcons.inbox, color: context.colors.danger),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppChip(
      label: label,
      expand: true,
      onTap: onTap,
      state: isSelected ? AppChipState.selected : AppChipState.unselected,
    );
  }
}

sealed class _PaneEntry {
  const _PaneEntry();
}

class _PaneHeader extends _PaneEntry {
  final ConversationDateGroup group;

  const _PaneHeader({required this.group});
}

class _PaneRow extends _PaneEntry {
  final ConversationDateGroup group;
  final Conversation conversation;

  const _PaneRow({required this.group, required this.conversation});
}
