// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'offline_flush_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Offline navbatni yuborishda muvaffaqiyatsiz bo'lgan amallar xabarlari.
/// UI qatlami (GlobalListeners) shu xabarlarni tinglab snackbar ko'rsatadi.

@ProviderFor(OfflineFlushMessages)
final offlineFlushMessagesProvider = OfflineFlushMessagesProvider._();

/// Offline navbatni yuborishda muvaffaqiyatsiz bo'lgan amallar xabarlari.
/// UI qatlami (GlobalListeners) shu xabarlarni tinglab snackbar ko'rsatadi.
final class OfflineFlushMessagesProvider
    extends $NotifierProvider<OfflineFlushMessages, List<String>> {
  /// Offline navbatni yuborishda muvaffaqiyatsiz bo'lgan amallar xabarlari.
  /// UI qatlami (GlobalListeners) shu xabarlarni tinglab snackbar ko'rsatadi.
  OfflineFlushMessagesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'offlineFlushMessagesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$offlineFlushMessagesHash();

  @$internal
  @override
  OfflineFlushMessages create() => OfflineFlushMessages();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$offlineFlushMessagesHash() => r'fc3595b6307f98e31ba3bc9adc11c9bcecdd7dd3';

/// Offline navbatni yuborishda muvaffaqiyatsiz bo'lgan amallar xabarlari.
/// UI qatlami (GlobalListeners) shu xabarlarni tinglab snackbar ko'rsatadi.

abstract class _$OfflineFlushMessages extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
