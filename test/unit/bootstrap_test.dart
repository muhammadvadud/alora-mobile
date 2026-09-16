import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/app/app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App starts and displays Alora', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: AloraApp()));
    await tester.pumpAndSettle();
    expect(find.text('Alora'), findsOneWidget);
  });
}
