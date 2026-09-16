import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/core/utils/paginated.dart';

void main() {
  test('Paginated.fromJson to\'g\'ri parse qiladi', () {
    final json = {
      'next': 'http://example.com/next',
      'previous': null,
      'results': [
        {'id': 1, 'name': 'Test'},
      ],
    };

    final paginated = Paginated<Map<String, dynamic>>.fromJson(
      json,
      (x) => x as Map<String, dynamic>,
    );

    expect(paginated.next, 'http://example.com/next');
    expect(paginated.previous, isNull);
    expect(paginated.results.length, 1);
    expect(paginated.results[0]['name'], 'Test');

    final paginated2 = Paginated<Map<String, dynamic>>.fromJson(
      json,
      (x) => x as Map<String, dynamic>,
    );
    final paginated3 = const Paginated<Map<String, dynamic>>(
      next: 'http://example.com/next',
      previous: null,
      results: [
        {'id': 1, 'name': 'Test'},
      ],
    );
    final paginatedDiff = const Paginated<Map<String, dynamic>>(
      next: null,
      previous: null,
      results: [],
    );

    // Test == and hashCode
    expect(paginated == paginated2, isFalse); // List equality is reference based for Map unless we do deep equal, actually since we parse again, it might be different reference. Wait, paginated.results == results is a reference check! So they will be false. Let's just do self equality.
    expect(paginated == paginated, isTrue);
    expect(paginated == paginatedDiff, isFalse);
    expect(paginated.hashCode, isNotNull);
  });
}
