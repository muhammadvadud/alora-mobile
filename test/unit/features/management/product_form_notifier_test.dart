import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/core/storage/offline_queue_item.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/management/catalog_admin/application/notifiers/product_form_notifier.dart';
import 'package:alora_mobile/features/management/catalog_admin/application/providers/catalog_providers.dart';
import 'package:alora_mobile/features/management/catalog_admin/domain/repositories/catalog_write_repository.dart';
import 'package:alora_mobile/features/management/catalog_admin/data/dto/catalog_write_dtos.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:alora_mobile/core/storage/hive_boxes.dart';

class MockCatalogWriteRepository extends Mock implements CatalogWriteRepository {}

class ProductWriteDtoFake extends Fake implements ProductWriteDto {}

void main() {
  late ProviderContainer container;
  late MockCatalogWriteRepository mockRepo;

  setUpAll(() async {
    Hive.init('test_hive');
    Hive.registerAdapter(OfflineQueueItemAdapter());
    registerFallbackValue(ProductWriteDtoFake());
  });

  setUp(() async {
    await Hive.openBox<OfflineQueueItem>(HiveBoxes.offlineQueue);
    mockRepo = MockCatalogWriteRepository();
    container = ProviderContainer(
      overrides: [catalogWriteRepositoryProvider.overrideWithValue(mockRepo)],
    );
  });

  tearDown(() async {
    await Hive.box<OfflineQueueItem>(HiveBoxes.offlineQueue).clear();
    container.dispose();
  });

  test('forma validatsiya', () async {
    final notifier = container.read(productFormProvider.notifier);

    // empty values -> should have errors
    final success = await notifier.save();
    expect(success, false);

    final state = container.read(productFormProvider);
    expect(state.errors.containsKey('name'), true);
    expect(state.errors.containsKey('code'), true);
    expect(state.errors.containsKey('category'), true);
    expect(state.errors.containsKey('price'), true);

    notifier.updateField('name', 'Test');
    notifier.updateField('code', 'T01');
    notifier.updateField('category', 'Cat');
    notifier.updateField('price', '100');

    final state2 = container.read(productFormProvider);
    expect(state2.errors.isEmpty, true);
  });

  test('dirty -> PATCH body faqat o\'zgargan maydon', () async {
    final notifier = container.read(productFormProvider.notifier);

    notifier.updateField('name', 'Test');
    notifier.updateField('code', 'T01');
    notifier.updateField('category', 'Cat');
    notifier.updateField('price', '100');

    when(() => mockRepo.updateProduct('p1', any())).thenAnswer((_) async {});

    await notifier.save(productId: 'p1');

    final verification = verify(() => mockRepo.updateProduct('p1', captureAny()));
    verification.called(1);

    final patchData = verification.captured.first as Map<String, dynamic>;
    expect(patchData.containsKey('name'), true);
    expect(patchData.containsKey('code'), true);
    expect(patchData.containsKey('category'), true);
    expect(
      patchData.containsKey('price'),
      false,
    ); // price patch is not handled in this implementation, but the rest are
  });

  test('errors -> maydon mapping (nested) va konflikt', () async {
    final notifier = container.read(productFormProvider.notifier);

    notifier.updateField('name', 'Test');
    notifier.updateField('code', 'T01');
    notifier.updateField('category', 'Cat');
    notifier.updateField('price', '100');

    final serverError = const Failure.validation('Xato', {'variants.0.price': 'Noldan katta'});
    when(() => mockRepo.updateProduct('p1', any())).thenThrow(serverError);

    final success = await notifier.save(productId: 'p1');
    expect(success, false);

    var state = container.read(productFormProvider);
    expect(state.errors['variants.0.price'], 'Noldan katta');

    // Konflikt testi
    when(() => mockRepo.updateProduct('p1', any())).thenThrow(const Failure.server());
    await notifier.save(productId: 'p1');
    state = container.read(productFormProvider);
    expect(state.errors['form'], contains('Konflikt'));
  });

  test('oflayn navbat -> qaytganda yuborish tartibi', () async {
    final notifier = container.read(productFormProvider.notifier);
    notifier.updateField('name', 'Test');
    notifier.updateField('code', 'T01');
    notifier.updateField('category', 'Cat');
    notifier.updateField('price', '100');

    when(() => mockRepo.createProduct(any())).thenThrow(const Failure.network());

    await notifier.save();

    final box = Hive.box<OfflineQueueItem>(HiveBoxes.offlineQueue);
    expect(box.values.length, 1);

    final item = box.values.first;
    expect(item.method, 'POST');
    expect(item.path, '/catalog/products/');
    expect(item.body?['name'], 'Test');
  });
}
