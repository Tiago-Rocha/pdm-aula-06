// Tests for the IslandCard widget (step 4, optional). Run with: flutter test
// This file only compiles after you create lib/island_card.dart.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tempo_acores/data.dart';
import 'package:tempo_acores/island_card.dart';
import 'package:tempo_acores/main.dart';

void main() {
  testWidgets('Passo 4 (opcional): o IslandCard mostra a foto e o nome',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 160,
              height: 160,
              child: IslandCard(island: islands[5]),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Pico'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('Passo 4 (opcional): a grelha usa IslandCard', (tester) async {
    tester.view.physicalSize = const Size(412, 915);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const WeatherApp());

    expect(find.byType(IslandCard), findsWidgets);
  });
}
