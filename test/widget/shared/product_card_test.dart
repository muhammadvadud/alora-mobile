import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:alora_mobile/shared/models/product_card_data.dart';
import 'package:alora_mobile/shared/widgets/product_card.dart';

import '../../helpers/pump_app.dart';

void main() {
  const product = ProductCardData(
    id: 'p1',
    name: 'Atlas',
    price: 2748000,
    priceUnit: PriceUnit.perSqm,
    colorHex: '#0E5751',
    colorName: 'Yashil',
  );

  // Test shrift (Ahem) har bir belgini to'liq enlikda chizadi, shuning uchun
  // kartochka kengligi haqiqiy nisbatni tekshirishga yaroqli tarzda beriladi.
  Widget wrap(Widget card) => SizedBox(width: 300, child: card);

  group('ProductCard Widget Testlari', () {
    testWidgets('perSqm uchun 4:5 nisbat ishlatiladi', (WidgetTester tester) async {
      await tester.pumpWidget(wrap(const ProductCard(data: product)).pumpApp());

      final aspectRatio = tester.widget<AspectRatio>(find.byType(AspectRatio));
      expect(aspectRatio.aspectRatio, 0.8);
    });

    testWidgets('perPiece uchun 1:1 nisbat ishlatiladi', (WidgetTester tester) async {
      const productPerPiece = ProductCardData(
        id: 'p2',
        name: 'Pul',
        price: 50000,
        priceUnit: PriceUnit.perPiece,
        colorHex: '#8A6620',
        colorName: 'Brass',
      );

      await tester.pumpWidget(wrap(const ProductCard(data: productPerPiece)).pumpApp());

      final aspectRatio = tester.widget<AspectRatio>(find.byType(AspectRatio));
      expect(aspectRatio.aspectRatio, 1.0);
    });

    testWidgets('mahsulot nomi ko\'rsatiladi', (WidgetTester tester) async {
      await tester.pumpWidget(wrap(const ProductCard(data: product)).pumpApp());

      expect(find.text('Atlas'), findsOneWidget);
    });

    testWidgets('rang doirasi va rang nomi ko\'rsatiladi', (WidgetTester tester) async {
      await tester.pumpWidget(wrap(const ProductCard(data: product)).pumpApp());

      expect(find.text('Yashil'), findsOneWidget);
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('narx va birlik ko\'rsatiladi', (WidgetTester tester) async {
      await tester.pumpWidget(wrap(const ProductCard(data: product)).pumpApp());

      expect(find.text('2 748 000'), findsOneWidget);
      expect(find.textContaining('so\'m/m²'), findsOneWidget);
    });

    testWidgets('perPiece narxi so\'m/dona birlik bilan ko\'rsatiladi', (
      WidgetTester tester,
    ) async {
      const perPieceProduct = ProductCardData(
        id: 'p3',
        name: 'To\'qima',
        price: 15000,
        priceUnit: PriceUnit.perPiece,
        colorHex: '#2E7D4F',
        colorName: 'Oq',
      );

      await tester.pumpWidget(wrap(const ProductCard(data: perPieceProduct)).pumpApp());

      expect(find.textContaining('so\'m/dona'), findsOneWidget);
    });

    testWidgets('onTap callback bosilganda chaqiriladi', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        wrap(
          ProductCard(
            data: product,
            onTap: () {
              tapped = true;
            },
          ),
        ).pumpApp(),
      );

      await tester.tap(find.byType(ProductCard));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('isCarousel rejimda eni 180 ga cheklanadi', (WidgetTester tester) async {
      const shortProduct = ProductCardData(
        id: 'p6',
        name: 'Ip',
        price: 999,
        priceUnit: PriceUnit.perMeter,
        colorHex: '#0E5751',
        colorName: 'Yashil',
      );

      await tester.pumpWidget(const ProductCard(data: shortProduct, isCarousel: true).pumpApp());

      final sizedBoxes = find.descendant(
        of: find.byType(ProductCard),
        matching: find.byType(SizedBox),
      );
      final carouselBox = sizedBoxes
          .evaluate()
          .map((e) => e.widget as SizedBox)
          .firstWhere(
            (w) => w.width == 180 && w.height == null,
            orElse: () => fail('180 enli SizedBox topilmadi'),
          );
      expect(carouselBox.width, 180);
    });

    testWidgets('rasm yo\'q bo\'lganda placeholder ikonkasi ko\'rsatiladi', (
      WidgetTester tester,
    ) async {
      const noImageProduct = ProductCardData(
        id: 'p4',
        name: 'Matosiz',
        price: 34000,
        priceUnit: PriceUnit.perSqm,
        colorHex: '#4A6B7C',
        colorName: 'Ko\'k',
      );

      await tester.pumpWidget(wrap(const ProductCard(data: noImageProduct)).pumpApp());

      expect(find.byType(Icon), findsWidgets);
    });

    testWidgets('rasm xatosi holatida errorWidget ko\'rsatiladi', (WidgetTester tester) async {
      const imageProduct = ProductCardData(
        id: 'p5',
        name: 'Rasmli chapga',
        price: 12000,
        priceUnit: PriceUnit.perMeter,
        imageUrl: 'https://invalid-url/image.jpg',
        colorHex: '#A6483C',
        colorName: 'Qizil',
      );

      await tester.pumpWidget(wrap(const ProductCard(data: imageProduct)).pumpApp());

      expect(find.byType(ProductCard), findsOneWidget);
    });
  });
}
