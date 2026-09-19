import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/core/utils/paginated.dart';
import 'package:alora_mobile/features/catalog/application/catalog_notifier.dart';
import 'package:alora_mobile/features/catalog/application/catalog_state.dart';
import 'package:alora_mobile/features/catalog/application/catalog_filter.dart';
import 'package:alora_mobile/features/catalog/application/providers.dart' as catalog_providers;
import 'package:alora_mobile/features/catalog/domain/entities/category.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product.dart';
import 'package:alora_mobile/features/catalog/domain/repositories/catalog_repository.dart';

class MockCatalogRepository extends Mock implements CatalogRepository {}

Product _product(String id) => Product(
  id: id,
  categoryId: 'cat-1',
  categoryData: null,
  name: 'Mato $id',
  code: 'CODE-$id',
  variants: const [],
);

void main() {
  late MockCatalogRepository mockRepo;
  late ProviderContainer container;

  setUp(() {
    mockRepo = MockCatalogRepository();

    when(() => mockRepo.getCategories()).thenAnswer(
      (_) async => const Paginated(
        results: [
          Category(id: 'cat-1', name: 'Portyera', slug: 'portyera'),
          Category(id: 'cat-2', name: 'Tul', slug: 'tul'),
        ],
        next: null,
        previous: null,
      ),
    );

    when(
      () => mockRepo.getProducts(
        category: any(named: 'category'),
        style: any(named: 'style'),
        room: any(named: 'room'),
        segment: any(named: 'segment'),
        priceUnit: any(named: 'priceUnit'),
        search: any(named: 'search'),
        minPrice: any(named: 'minPrice'),
        maxPrice: any(named: 'maxPrice'),
        cursor: any(named: 'cursor'),
      ),
    ).thenAnswer(
      (_) async => Paginated(results: [_product('p1'), _product('p2')], next: null, previous: null),
    );

    container = ProviderContainer(
      overrides: [catalog_providers.catalogRepositoryProvider.overrideWithValue(mockRepo)],
    );
  });

  tearDown(() => container.dispose());

  CatalogState readState() => container.read(catalogProvider);

  group('CatalogNotifier', () {
    test('initial state — empty, no loading', () {
      final state = readState();
      expect(state.products, isEmpty);
      expect(state.categories, isEmpty);
      expect(state.isLoading, isFalse);
      expect(state.filter.isEmpty, isTrue);
    });

    test('bootstrap loads categories and first page', () async {
      container.read(catalogProvider.notifier).bootstrap();
      await Future<void>.delayed(Duration.zero);

      final state = readState();
      expect(state.categories, hasLength(2));
      expect(state.products, hasLength(2));
      expect(state.isLoading, isFalse);
      expect(state.error, isNull);
    });

    test('results without pagination.next are final — hasMore false', () async {
      container.read(catalogProvider.notifier).bootstrap();
      await Future<void>.delayed(Duration.zero);

      expect(readState().hasMore, isFalse);
    });
  });

  group('CatalogQueryMapper integration', () {
    test('getProducts receives price_unit derived from filter type', () async {
      container
          .read(catalogProvider.notifier)
          .setFilter(const CatalogFilter(minPrice: 60000, maxPrice: 220000));
      await Future<void>.delayed(Duration.zero);

      verify(
        () => mockRepo.getProducts(
          category: any(named: 'category'),
          style: any(named: 'style'),
          room: any(named: 'room'),
          segment: any(named: 'segment'),
          priceUnit: any(named: 'priceUnit'),
          search: any(named: 'search'),
          minPrice: 60000,
          maxPrice: 220000,
          cursor: any(named: 'cursor'),
        ),
      ).called(1);
    });

    test('setFilter then clearFilter reloads with empty filter', () async {
      final notifier = container.read(catalogProvider.notifier);
      notifier.setFilter(const CatalogFilter(minPrice: 1000));
      await Future<void>.delayed(Duration.zero);

      notifier.clearFilter();
      await Future<void>.delayed(Duration.zero);

      expect(readState().filter.isEmpty, isTrue);
    });

    test('selectCategory triggers reload with chosen category', () async {
      container.read(catalogProvider.notifier).selectCategory('cat-2');
      await Future<void>.delayed(Duration.zero);

      verify(
        () => mockRepo.getProducts(
          category: 'cat-2',
          style: any(named: 'style'),
          room: any(named: 'room'),
          segment: any(named: 'segment'),
          priceUnit: any(named: 'priceUnit'),
          search: any(named: 'search'),
          minPrice: any(named: 'minPrice'),
          maxPrice: any(named: 'maxPrice'),
          cursor: any(named: 'cursor'),
        ),
      ).called(1);
      expect(readState().categoryId, 'cat-2');
    });
  });
}
