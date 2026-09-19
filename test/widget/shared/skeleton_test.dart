import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('Skeleton testlari', () {
    testWidgets('SkeletonBox normal holatda ko\'rsatiladi', (tester) async {
      await tester.pumpWidget(const SkeletonBox(width: 100, height: 50).pumpApp());

      expect(find.byType(SkeletonBox), findsOneWidget);
    });

    testWidgets('SkeletonList normal holatda ko\'rsatiladi va elementlar soni to\'g\'ri', (
      tester,
    ) async {
      await tester.pumpWidget(
        const SkeletonList(
          itemCount: 4,
          itemBuilder: SkeletonBox(width: 100, height: 50),
        ).pumpApp(),
      );

      expect(find.byType(SkeletonList), findsOneWidget);
      expect(find.byType(SkeletonBox), findsNWidgets(4));
    });
  });
}
