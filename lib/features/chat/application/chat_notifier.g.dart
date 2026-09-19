// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'chat_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChatNotifier)
final chatProvider = ChatNotifierFamily._();

final class ChatNotifierProvider
    extends $NotifierProvider<ChatNotifier, ChatState> {
  ChatNotifierProvider._({
    required ChatNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'chatProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$chatNotifierHash();

  @override
  String toString() {
    return r'chatProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ChatNotifier create() => ChatNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChatNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$chatNotifierHash() => r'1d65a4218c32f525f026bc9367ba25530995bd3e';

final class ChatNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ChatNotifier,
          ChatState,
          ChatState,
          ChatState,
          String
        > {
  ChatNotifierFamily._()
    : super(
        retry: null,
        name: r'chatProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ChatNotifierProvider call(String conversationId) =>
      ChatNotifierProvider._(argument: conversationId, from: this);

  @override
  String toString() => r'chatProvider';
}

abstract class _$ChatNotifier extends $Notifier<ChatState> {
  late final _$args = ref.$arg as String;
  String get conversationId => _$args;

  ChatState build(String conversationId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ChatState, ChatState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ChatState, ChatState>,
              ChatState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
