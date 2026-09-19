// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'settings_notifiers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PromptHistoryNotifier)
final promptHistoryProvider = PromptHistoryNotifierProvider._();

final class PromptHistoryNotifierProvider
    extends $AsyncNotifierProvider<PromptHistoryNotifier, PromptHistory> {
  PromptHistoryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'promptHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$promptHistoryNotifierHash();

  @$internal
  @override
  PromptHistoryNotifier create() => PromptHistoryNotifier();
}

String _$promptHistoryNotifierHash() => r'fcd8b046ae8970d48620f3eb45c9cfbc605f1048';

abstract class _$PromptHistoryNotifier extends $AsyncNotifier<PromptHistory> {
  FutureOr<PromptHistory> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PromptHistory>, PromptHistory>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PromptHistory>, PromptHistory>,
              AsyncValue<PromptHistory>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ModelPricingsNotifier)
final modelPricingsProvider = ModelPricingsNotifierProvider._();

final class ModelPricingsNotifierProvider
    extends $AsyncNotifierProvider<ModelPricingsNotifier, List<ModelPricing>> {
  ModelPricingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modelPricingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modelPricingsNotifierHash();

  @$internal
  @override
  ModelPricingsNotifier create() => ModelPricingsNotifier();
}

String _$modelPricingsNotifierHash() => r'171caffe035f926392c5ff556ac7f9ca0ce64fad';

abstract class _$ModelPricingsNotifier extends $AsyncNotifier<List<ModelPricing>> {
  FutureOr<List<ModelPricing>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<ModelPricing>>, List<ModelPricing>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ModelPricing>>, List<ModelPricing>>,
              AsyncValue<List<ModelPricing>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
