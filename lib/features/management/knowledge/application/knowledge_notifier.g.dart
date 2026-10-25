// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'knowledge_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(KnowledgeNotifier)
final knowledgeProvider = KnowledgeNotifierProvider._();

final class KnowledgeNotifierProvider
    extends $NotifierProvider<KnowledgeNotifier, KnowledgeState> {
  KnowledgeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'knowledgeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$knowledgeNotifierHash();

  @$internal
  @override
  KnowledgeNotifier create() => KnowledgeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(KnowledgeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<KnowledgeState>(value),
    );
  }
}

String _$knowledgeNotifierHash() => r'78518be682b644992eb4c91a358cf5b613591e27';

abstract class _$KnowledgeNotifier extends $Notifier<KnowledgeState> {
  KnowledgeState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<KnowledgeState, KnowledgeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<KnowledgeState, KnowledgeState>,
              KnowledgeState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
