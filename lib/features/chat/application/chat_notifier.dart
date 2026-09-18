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

  /// Throttle buferidagi eng so'nggi holat (hali `state` ga yozilmagan) yoki `state`.
  /// SSE eventlari 50 ms ichida ketma-ket kelganda oldingi o'zgarish yo'qolmasligi uchun
  /// har event shu asosdan hisoblanadi (§3.4 — bufer, yo'qotish emas).
  ChatState get _latest => _pendingState ?? state;

  /// Buferni bekor qilib darhol yozadi (yangi xabar, retry, reset).
  void _commitNow(ChatState newState) {
    _throttleTimer?.cancel();
    _pendingState = null;
    state = newState;
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

    _commitNow(
      _latest.copyWith(
        messages: [assistantMsg, userMsg, ..._latest.messages],
        isStreaming: true,
        error: null,
        quickReplies: [],
      ),
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
    final base = _latest;
    final msgs = List<Message>.from(base.messages);
    final idx = msgs.indexWhere((m) => m.id == msgId);
    if (idx == -1) return;

    Message msg = msgs[idx];
    String? streamError;

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
        streamError = detail;
      },
      unknown: () {},
    );

    msgs[idx] = msg;
    _updateStateThrottled(
      streamError == null
          ? base.copyWith(messages: msgs)
          : base.copyWith(
              messages: msgs,
              error: streamError,
              isStreaming: false,
            ),
    );
  }

  void _handleError(String error, String msgId) {
    final base = _latest;
    final msgs = List<Message>.from(base.messages);
    final idx = msgs.indexWhere((m) => m.id == msgId);
    if (idx != -1) {
      msgs[idx] = msgs[idx].copyWith(status: MessageStatus.error);
    }
    _updateStateThrottled(
      base.copyWith(error: error, isStreaming: false, messages: msgs),
    );
  }

  void _handleDone(String msgId) {
    final base = _latest;
    final msgs = List<Message>.from(base.messages);
    final idx = msgs.indexWhere((m) => m.id == msgId);
    if (idx != -1) {
      msgs[idx] = msgs[idx].copyWith(status: MessageStatus.done);
      // Let's also update the sending user message to done
      if (idx + 1 < msgs.length && msgs[idx + 1].role == MessageRole.user) {
        msgs[idx + 1] = msgs[idx + 1].copyWith(status: MessageStatus.done);
      }
    }
    _updateStateThrottled(base.copyWith(isStreaming: false, messages: msgs));
  }

  /// Uzilgan/xato bo'lgan oxirgi javobni qayta so'raydi: oxirgi user xabari
  /// qayta yuboriladi, xato holatidagi assistant xabari olib tashlanadi (§8.5).
  Future<void> retryLast() async {
    if (state.isStreaming) return;
    final msgs = List<Message>.from(_latest.messages);
    final lastUserIdx = msgs.lastIndexWhere((m) => m.role == MessageRole.user);
    if (lastUserIdx == -1) {
      // Tarix yuklanmagan (getMessages xatosi) — qayta yuklash.
      _commitNow(_latest.copyWith(error: null));
      await _loadMessages();
      return;
    }
    final content = msgs[lastUserIdx].content;
    msgs.removeRange(lastUserIdx, msgs.length);
    _commitNow(_latest.copyWith(messages: msgs, error: null));
    await sendMessage(content);
  }

  void cancelStream() {
    _cancelToken?.cancel();
    _activeStream?.cancel();
    _commitNow(_latest.copyWith(isStreaming: false));
  }

  Future<void> resetConversation() async {
    cancelStream();
    await ref.read(chatRepositoryProvider).resetConversation(conversationId);
    state = const ChatState();
  }
}
