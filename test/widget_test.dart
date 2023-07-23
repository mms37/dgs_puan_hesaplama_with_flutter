// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dgs/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
 // <-- Proje adınıza göre düzenleyin

void main() {
  testWidgets('DGS puanlarını doğru hesaplıyor mu', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final onlisansPuanFinder = find.byKey(ValueKey('onlisans_puan_field'));
    final sayisalDogruFinder = find.byKey(ValueKey('sayisal_dogru_field'));
    final sayisalYanlisFinder = find.byKey(ValueKey('sayisal_yanlis_field'));
    final sozelDogruFinder = find.byKey(ValueKey('sozel_dogru_field'));
    final sozelYanlisFinder = find.byKey(ValueKey('sozel_yanlis_field'));
    final calculateButtonFinder = find.text('Puanları Hesapla');

    expect(onlisansPuanFinder, findsOneWidget);
    expect(sayisalDogruFinder, findsOneWidget);
    expect(sayisalYanlisFinder, findsOneWidget);
    expect(sozelDogruFinder, findsOneWidget);
    expect(sozelYanlisFinder, findsOneWidget);
    expect(calculateButtonFinder, findsOneWidget);

    await tester.enterText(onlisansPuanFinder, '70.5'); // Test için önlisans başarı puanı girin
    await tester.enterText(sayisalDogruFinder, '30'); // Test için sayısal doğru sayısı girin
    await tester.enterText(sayisalYanlisFinder, '5'); // Test için sayısal yanlış sayısı girin
    await tester.enterText(sozelDogruFinder, '35'); // Test için sözel doğru sayısı girin
    await tester.enterText(sozelYanlisFinder, '10'); // Test için sözel yanlış sayısı girin

    await tester.tap(calculateButtonFinder);
    await tester.pump();

    final sayisalPuanFinder = find.text('DGS Sayısal:');
    final sozelPuanFinder = find.text('DGS Sözel:');
    final eaPuanFinder = find.text('DGS Eşit Ağırlık:');

    expect(sayisalPuanFinder, findsOneWidget);
    expect(sozelPuanFinder, findsOneWidget);
    expect(eaPuanFinder, findsOneWidget);
  });
}
