import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:alora_mobile/features/chat/application/providers.dart';
import 'package:alora_mobile/features/chat/application/chat_state.dart';
import 'package:alora_mobile/core/sse/sse_event.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/features/customer_mode/application/providers.dart';

part 'chat_notifier.g.dart';

@Riverpod(keepAlive: true)
class ChatNotifier extends _$ChatNotifier {
  StreamSubscription<SseEvent>? _activeStream;
  CancelToken? _cancelToken;

  Timer? _throttleTimer;
  ChatState? _pendingState;

  @override
  ChatState build(String conversationId) {
    ref.onDispose(() {
      _cancelToken?.cancel();
      _activeStream?.cancel();
      _throttleTimer?.cancel();
    });

    _loadMessages();
    return const ChatState();
  }

  Future<void> _loadMessages() async {
    try {
      final repository = ref.read(chatRepositoryProvider);
      final result = await repository.getMessages(conversationId);
      // Backend returns ordered, we need to reverse it for ListView.builder reverse: true
      state = state.copyWith(messages: result.results.reversed.toList());
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  void _updateStateThrottled(ChatState newState) {
    _pendingState = newState;
    if (_throttleTimer == null || !_throttleTimer!.isActive) {
      _throttleTimer = Timer(const Duration(milliseconds: 50), () {
        if (_pendingState != null) {
          state = _pendingState!;
          _pendingState = null;
        }
      });
    }
  }

  Future<void> sendMessage(String content, {String? overrideLocale}) async {
    if (state.isStreaming) return;

    final customerMode = ref.read(customerModeEnabledProvider);
    final locale =
        overrideLocale ?? 'uz'; // We can get this from LocaleNotifier later

    final userMsg = Message(
      id: 'temp_user_${DateTime.now().millisecondsSinceEpoch}',
      role: MessageRole.user,
      content: content,
      createdAt: DateTime.now(),
      status: MessageStatus.sending,
    );

    final assistantMsgId = 'temp_ai_${DateTime.now().millisecondsSinceEpoch}';
    final assistantMsg = Message(
      id: assistantMsgId,
      role: MessageRole.assistant,
      content: '',
      createdAt: DateTime.now(),
      status: MessageStatus.streaming,
    );

    state = state.copyWith(
      messages: [assistantMsg, userMsg, ...state.messages],
      isStreaming: true,
      error: null,
      quickReplies: [],
    );

    _cancelToken = CancelToken();
    final repository = ref.read(chatRepositoryProvider);

    final stream = repository.sendMessage(
      conversationId,
      content,
      locale,
      customerMode,
      state.stage,
      cancelToken: _cancelToken,
    );

    _activeStream = stream.listen(
      (event) {
        _handleEvent(event, assistantMsgId);
      },
      onError: (e) {
        _handleError(e.toString(), assistantMsgId);
      },
      onDone: () {
        _handleDone(assistantMsgId);
      },
    );
  }

  void _handleEvent(SseEvent event, String msgId) {
    final msgs = List<Message>.from(state.messages);
    final idx = msgs.indexWhere((m) => m.id == msgId);
    if (idx == -1) return;

    Message msg = msgs[idx];

    event.when(
      start: () {},
      thinking: () {},
      content: (String c) {
        msg = msg.copyWith(content: msg.content + c);
      },
      toolCall: (String tool) {
        final blocks = List<RichBlock>.from(msg.richBlocks);
        blocks.add(
          RichBlock.toolChip(tool: tool, state: ToolChipState.running),
        );
        msg = msg.copyWith(richBlocks: blocks);
      },
      toolArgs: (String tool, String args) {
        final blocks = List<RichBlock>.from(msg.richBlocks);
        final bIdx = blocks.lastIndexWhere(
          (b) => b.mapOrNull(toolChip: (t) => t.tool == tool) != null,
        );
        if (bIdx != -1) {
          final oldBlock = blocks[bIdx];
          blocks[bIdx] = oldBlock.maybeMap(
            toolChip: (t) => t.copyWith(rawArgs: args),
            orElse: () => oldBlock,
          );
          msg = msg.copyWith(richBlocks: blocks);
        }
      },
      toolResult: (String tool, String result) {
        final blocks = List<RichBlock>.from(msg.richBlocks);
        final bIdx = blocks.lastIndexWhere(
          (b) => b.mapOrNull(toolChip: (t) => t.tool == tool) != null,
        );
        if (bIdx != -1) {
          final oldBlock = blocks[bIdx];
          blocks[bIdx] = oldBlock.maybeMap(
            toolChip: (t) =>
                t.copyWith(state: ToolChipState.done, rawResult: result),
            orElse: () => oldBlock,
          );
        }

        final parsedBlock = ref
            .read(chatRepositoryProvider)
            .parseToolResult(tool, result);
        // We add the parsed block after the tool chip
        blocks.add(parsedBlock);
        msg = msg.copyWith(richBlocks: blocks);
      },
      done:
          (Map<String, dynamic>? usage, List<Map<String, dynamic>>? products) {
            msg = msg.copyWith(status: MessageStatus.done);
            if (products != null && products.isNotEmpty) {
              // We might need to add quick replies here if provided in usage or something, but backend API says `quick_replies`?
              // The backend doc for done says: done(usage, products). Maybe quickReplies are inside usage?
            }
          },
      error: (String detail) {
        msg = msg.copyWith(status: MessageStatus.error);
        _handleError(detail, msgId);
      },
      unknown: () {},
    );

    msgs[idx] = msg;
    _updateStateThrottled(state.copyWith(messages: msgs));
  }

  void _handleError(String error, String msgId) {
    final msgs = List<Message>.from(state.messages);
    final idx = msgs.indexWhere((m) => m.id == msgId);
    if (idx != -1) {
      msgs[idx] = msgs[idx].copyWith(status: MessageStatus.error);
    }
    _updateStateThrottled(
      state.copyWith(error: error, isStreaming: false, messages: msgs),
    );
  }

  void _handleDone(String msgId) {
    final msgs = List<Message>.from(state.messages);
    final idx = msgs.indexWhere((m) => m.id == msgId);
    if (idx != -1) {
      msgs[idx] = msgs[idx].copyWith(status: MessageStatus.done);
      // Let's also update the sending user message to done
      if (idx + 1 < msgs.length && msgs[idx + 1].role == MessageRole.user) {
        msgs[idx + 1] = msgs[idx + 1].copyWith(status: MessageStatus.done);
      }
    }
    _updateStateThrottled(state.copyWith(isStreaming: false, messages: msgs));
  }

  void cancelStream() {
    _cancelToken?.cancel();
    _activeStream?.cancel();
    state = state.copyWith(isStreaming: false);
  }

  Future<void> resetConversation() async {
    cancelStream();
    await ref.read(chatRepositoryProvider).resetConversation(conversationId);
    state = const ChatState();
  }
}
