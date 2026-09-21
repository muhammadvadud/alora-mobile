import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/utils/app_logger.dart';
import 'package:alora_mobile/features/chat/application/providers.dart';
import 'package:alora_mobile/features/chat/application/chat_state.dart';
import 'package:alora_mobile/core/sse/sse_event.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/features/customer_mode/application/providers.dart';
import 'package:alora_mobile/features/conversations/application/conversations_notifier.dart';

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

  /// Turli manbalardan kelgan xatoni tiplangan [Failure]'ga keltiradi.
  /// Dio interceptor allaqachon [Failure] qaytargan bo'lsa — o'sha ishlatiladi;
  /// aks holda umumiy [Failure.unknown] (detail bo'sh → l10n matni).
  Failure _mapFailure(Object error) {
    if (error is Failure) return error;
    if (error is DioException && error.error is Failure) {
      return error.error! as Failure;
    }
    // Tiplanmagan xato: xom matn UI'ga chiqmaydi (§8.3), faqat log'ga.
    logger.w('Chat: tiplanmagan xato', error: error);
    return const Failure.unknown('');
  }

  /// SSE `error` eventining `detail` matni — backend'dan kelgan, foydalanuvchiga
  /// ko'rsatiladi (§8.3). Limit haqidagi xabar `LimitExceededView` ga olib boradi.
  Failure _mapSseErrorDetail(String detail) {
    final lower = detail.toLowerCase();
    if (lower.contains('429') || lower.contains('limit')) {
      return Failure.limit(detail);
    }
    if (lower.contains('500') || lower.contains('server') || lower.contains('internal')) {
      return const Failure.server();
    }
    if (lower.contains('503') || lower.contains('unavailable')) {
      return const Failure.serviceUnavailable();
    }
    return Failure.unknown(detail);
  }

  /// Tarixni yuklaydi: avval Hive keshini darhol ko'rsatadi (§11 — oflayn yoki
  /// server natijasi kelguncha), keyin server natijasini kesh/optimistik
  /// xabarlar bilan birlashtiradi.
  ///
  /// Server xabarlari **yangi birinchi** tartibda keladi (backend
  /// `order_by("-created_at")`). State ham shu tartibda saqlanadi: `messages[0]`
  /// — eng yangi xabar (`reverse: true` ListView'da pastda, input ustida).
  /// Bunda `reversed` qilinmaydi — aks holda barcha xabarlar teskari tartibda
  /// (oxirgisi tepada) ko'rinib qolardi.
  Future<void> _loadMessages() async {
    final repository = ref.read(chatRepositoryProvider);

    // 1) Kesh bor bo'lsa — darhol ko'rsatamiz (server kutilguncha yoki oflayn).
    try {
      final cached = await repository.getCachedMessages(conversationId);
      if (cached.isNotEmpty) {
        _commitNow(
          _latest.copyWith(
            messages: _mergeMessages(_latest.messages, cached),
            isLoadingHistory: false,
          ),
        );
      }
    } catch (_) {
      // Kesh o'qilmadi — server natijasini kutamiz.
    }

    // 2) Server — asosiy manba.
    try {
      final result = await repository.getMessages(conversationId);
      _commitNow(
        _latest.copyWith(
          messages: _mergeMessages(_latest.messages, result.results),
          nextCursor: result.next,
          isLoadingHistory: false,
          error: null,
        ),
      );
    } catch (e) {
      _commitNow(_latest.copyWith(error: _mapFailure(e), isLoadingHistory: false));
    }
  }

  /// Eski xabarlarni cursor bo'yicha yuklaydi va ro'yxat bilan birlashtiradi
  /// (§8.4 — cursor pagination, sahifa raqami ishlatilmaydi).
  Future<void> loadOlderMessages() async {
    if (state.isLoadingOlder || state.isStreaming) return;
    final cursor = state.nextCursor;
    if (cursor == null || cursor.isEmpty) return;

    _commitNow(_latest.copyWith(isLoadingOlder: true));
    try {
      final result = await ref
          .read(chatRepositoryProvider)
          .getMessages(conversationId, cursor: cursor);
      _commitNow(
        _latest.copyWith(
          messages: _mergeMessages(_latest.messages, result.results),
          nextCursor: result.next,
          isLoadingOlder: false,
        ),
      );
    } catch (e) {
      logger.w('Eski xabarlarni yuklashda xato', error: e);
      _commitNow(_latest.copyWith(isLoadingOlder: false));
    }
  }

  /// Xabarlarni yagona tartibga keltiradi: id bo'yicha dedupe + createdAt
  /// (teng bo'lsa id) bo'yicha eng yangisi boshida. Kesh+server yoki sahifa-
  /// sahifa birlashuvida hech bir xabar yo'qolmaydi; ayni id kelganda [incoming]
  /// (server/kesh nusxasi) ustun turadi.
  List<Message> _mergeMessages(List<Message> current, List<Message> incoming) {
    final retained = _reconcileOptimistic(current, incoming);
    final byId = <String, Message>{};
    // `incoming` (server/kesh nusxasi) oxirgi yoziladi — ayni id bo'lsa u ustun.
    for (final message in [...retained, ...incoming]) {
      byId[message.id] = message;
    }
    final merged = byId.values.toList();
    merged.sort(_newestFirst);
    return merged;
  }

  /// Optimistik (`temp_`) xabar serverda aynan shu rol+mazmun bilan saqlangan
  /// bo'lsa, uni olib tashlaymiz va server nusxasini qoldiramiz. Aks holda
  /// yuborilgan xabar server tasdiqlagach dublikat bo'lib qolardi.
  List<Message> _reconcileOptimistic(List<Message> current, List<Message> incoming) {
    final confirmed = <String>{};
    for (final message in incoming) {
      if (_isOptimistic(message)) continue;
      confirmed.add('${message.role.name}|${message.content}');
    }
    return current
        .where((message) {
          if (!_isOptimistic(message)) return true;
          return !confirmed.contains('${message.role.name}|${message.content}');
        })
        .toList();
  }

  bool _isOptimistic(Message message) => message.id.startsWith('temp_');

  /// `reverse: true` ListView uchun eng yangisi birinchi (index 0 — pastda).
  /// Vaqt teng bo'lsa id bo'yicha teskari — server pagination bilan mos.
  static int _newestFirst(Message a, Message b) {
    final byTime = b.createdAt.compareTo(a.createdAt);
    if (byTime != 0) return byTime;
    return b.id.compareTo(a.id);
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
    final locale = overrideLocale ?? 'uz'; // We can get this from LocaleNotifier later

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
        isLoadingHistory: false,
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
      onError: (Object e) {
        _handleError(e, assistantMsgId);
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
    Failure? streamError;

    event.when(
      start: () {},
      thinking: () {},
      content: (String c) {
        msg = msg.copyWith(content: msg.content + c);
      },
      toolCall: (String tool) {
        final blocks = List<RichBlock>.from(msg.richBlocks);
        final chipIndex = blocks.lastIndexWhere(
          (block) => block.mapOrNull(toolChip: (_) => true) == true,
        );
        final chip = RichBlock.toolChip(tool: tool, state: ToolChipState.running);
        if (chipIndex == -1) {
          blocks.add(chip);
        } else {
          blocks[chipIndex] = chip;
        }
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
            toolChip: (t) => t.copyWith(state: ToolChipState.done, rawResult: result),
            orElse: () => oldBlock,
          );
        }

        final parsedBlock = ref.read(chatRepositoryProvider).parseToolResult(tool, result);
        // Bitta javob ichida tool qayta chaqirilsa, oraliq hisob kartasi
        // yakuniy hisob bilan almashtiriladi. Aks holda UI'da bir nechta
        // hisob cardi paydo bo'ladi.
        if (parsedBlock.mapOrNull(quote: (_) => true) == true) {
          blocks.removeWhere((block) => block.mapOrNull(quote: (_) => true) == true);
        }

        blocks.add(parsedBlock);
        msg = msg.copyWith(richBlocks: blocks);
      },
      done: (Map<String, dynamic>? usage, List<Map<String, dynamic>>? products) {
        msg = msg.copyWith(status: MessageStatus.done);
        if (products != null && products.isNotEmpty) {
          // We might need to add quick replies here if provided in usage or something, but backend API says `quick_replies`?
          // The backend doc for done says: done(usage, products). Maybe quickReplies are inside usage?
        }
      },
      error: (String detail) {
        msg = msg.copyWith(status: MessageStatus.error);
        streamError = _mapSseErrorDetail(detail);
      },
      unknown: () {},
    );

    msgs[idx] = msg;
    _updateStateThrottled(
      streamError == null
          ? base.copyWith(messages: msgs)
          : base.copyWith(messages: msgs, error: streamError, isStreaming: false),
    );
  }

  void _handleError(Object error, String msgId) {
    final base = _latest;
    final msgs = List<Message>.from(base.messages);
    final idx = msgs.indexWhere((m) => m.id == msgId);
    if (idx != -1) {
      msgs[idx] = msgs[idx].copyWith(status: MessageStatus.error);
    }
    _updateStateThrottled(
      base.copyWith(error: _mapFailure(error), isStreaming: false, messages: msgs),
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
    unawaited(ref.read(conversationsProvider.notifier).refresh());
  }

  /// Uzilgan/xato bo'lgan eng so'nggi javobni qayta so'raydi: xabarlar ro'yxati
  /// yangi xabarlarni boshida saqlagani uchun birinchi user xabari olinadi.
  /// Faqat xato bo'lgan assistant/user juftligi olib tashlanadi (§8.5).
  Future<void> retryLast() async {
    if (state.isStreaming) return;
    final msgs = List<Message>.from(_latest.messages);
    final latestUserIdx = msgs.indexWhere((m) => m.role == MessageRole.user);
    if (latestUserIdx == -1) {
      // Tarix yuklanmagan (getMessages xatosi) — qayta yuklash.
      _commitNow(_latest.copyWith(error: null));
      await _loadMessages();
      return;
    }
    final content = msgs[latestUserIdx].content;
    final assistantIdx = latestUserIdx > 0 && msgs[latestUserIdx - 1].role == MessageRole.assistant
        ? latestUserIdx - 1
        : latestUserIdx;
    msgs.removeRange(assistantIdx, latestUserIdx + 1);
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
    state = const ChatState(isLoadingHistory: false);
  }
}
