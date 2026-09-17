// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'transcript_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Suhbat transkripti (manager uchun o'qish rejimi).

@ProviderFor(TranscriptNotifier)
final transcriptProvider = TranscriptNotifierFamily._();

/// Suhbat transkripti (manager uchun o'qish rejimi).
final class TranscriptNotifierProvider
    extends
        $AsyncNotifierProvider<TranscriptNotifier, List<TranscriptMessage>> {
  /// Suhbat transkripti (manager uchun o'qish rejimi).
  TranscriptNotifierProvider._({
    required TranscriptNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'transcriptProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$transcriptNotifierHash();

  @override
  String toString() {
    return r'transcriptProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TranscriptNotifier create() => TranscriptNotifier();

  @override
  bool operator ==(Object other) {
    return other is TranscriptNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$transcriptNotifierHash() =>
    r'a0623fb8c76ad76c794dd291fb26c96004820411';

/// Suhbat transkripti (manager uchun o'qish rejimi).

final class TranscriptNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TranscriptNotifier,
          AsyncValue<List<TranscriptMessage>>,
          List<TranscriptMessage>,
          FutureOr<List<TranscriptMessage>>,
          String
        > {
  TranscriptNotifierFamily._()
    : super(
        retry: null,
        name: r'transcriptProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Suhbat transkripti (manager uchun o'qish rejimi).

  TranscriptNotifierProvider call(String conversationId) =>
      TranscriptNotifierProvider._(argument: conversationId, from: this);

  @override
  String toString() => r'transcriptProvider';
}

/// Suhbat transkripti (manager uchun o'qish rejimi).

abstract class _$TranscriptNotifier
    extends $AsyncNotifier<List<TranscriptMessage>> {
  late final _$args = ref.$arg as String;
  String get conversationId => _$args;

  FutureOr<List<TranscriptMessage>> build(String conversationId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<TranscriptMessage>>,
              List<TranscriptMessage>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<TranscriptMessage>>,
                List<TranscriptMessage>
              >,
              AsyncValue<List<TranscriptMessage>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
