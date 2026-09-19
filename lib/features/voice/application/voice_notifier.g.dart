// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'voice_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VoiceNotifier)
final voiceProvider = VoiceNotifierProvider._();

final class VoiceNotifierProvider extends $NotifierProvider<VoiceNotifier, VoiceState> {
  VoiceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'voiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$voiceNotifierHash();

  @$internal
  @override
  VoiceNotifier create() => VoiceNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VoiceState value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<VoiceState>(value));
  }
}

String _$voiceNotifierHash() => r'9af23f0b7eae47ea05dca121f61d0cc85ab117a8';

abstract class _$VoiceNotifier extends $Notifier<VoiceState> {
  VoiceState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<VoiceState, VoiceState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<VoiceState, VoiceState>,
              VoiceState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
