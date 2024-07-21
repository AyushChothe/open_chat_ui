// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ollama_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ollamaBaseUrlHash() => r'ef6995bc15823c06ca0b741e7660917ebfcd84b8';

/// See also [ollamaBaseUrl].
@ProviderFor(ollamaBaseUrl)
final ollamaBaseUrlProvider = AutoDisposeProvider<String?>.internal(
  ollamaBaseUrl,
  name: r'ollamaBaseUrlProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ollamaBaseUrlHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OllamaBaseUrlRef = AutoDisposeProviderRef<String?>;
String _$modelsHash() => r'132c80a7de736defcc3af52a861dfdc0eb295fd5';

/// See also [models].
@ProviderFor(models)
final modelsProvider = AutoDisposeFutureProvider<List<Model>>.internal(
  models,
  name: r'modelsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$modelsHash,
  dependencies: <ProviderOrFamily>[ollamaControllerProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    ollamaControllerProvider,
    ...?ollamaControllerProvider.allTransitiveDependencies
  },
);

typedef ModelsRef = AutoDisposeFutureProviderRef<List<Model>>;
String _$ollamaControllerHash() => r'69b447d62750568deb8b674ccd70f28e15016bd6';

/// See also [OllamaController].
@ProviderFor(OllamaController)
final ollamaControllerProvider =
    AutoDisposeNotifierProvider<OllamaController, ModelState>.internal(
  OllamaController.new,
  name: r'ollamaControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ollamaControllerHash,
  dependencies: <ProviderOrFamily>[ollamaBaseUrlProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    ollamaBaseUrlProvider,
    ...?ollamaBaseUrlProvider.allTransitiveDependencies
  },
);

typedef _$OllamaController = AutoDisposeNotifier<ModelState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
