import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_garden/main.dart';

void main() {
  testWidgets('App başlatılabiliyor mu?', (WidgetTester tester) async {
    // Uygulamayı başlat
    await tester.pumpWidget(const NumberGardenApp());

    // Ana ekranın yüklendiğini doğrula
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
