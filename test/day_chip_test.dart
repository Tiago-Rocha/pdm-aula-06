// Tests for the DayChip widget (step 3). Run with: flutter test
// This file only compiles after you create lib/day_chip.dart.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tempo_acores/data.dart';
import 'package:tempo_acores/day_chip.dart';
import 'package:tempo_acores/main.dart';

void main() {
  testWidgets('Passo 3: o DayChip mostra o dia, o ícone e a máxima',
      (tester) async {
    final f = DayForecast(
      date: DateTime(2026, 9, 29), // uma terça-feira
      type: WeatherType.rain,
      tMin: 16,
      tMax: 21.4,
      rainChance: 80,
      windKmh: 32,
    );
    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: Center(child: DayChip(forecast: f)))),
    );

    expect(find.text('Ter'), findsOneWidget);
    expect(find.byIcon(Icons.umbrella), findsOneWidget);
    expect(find.text('21°'), findsOneWidget,
        reason: 'A máxima aparece arredondada, seguida de °.');
  });

  testWidgets('Passo 3: a fila dos dias tem cinco DayChip', (tester) async {
    tester.view.physicalSize = const Size(412, 915);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const WeatherApp());

    expect(find.byType(DayChip), findsNWidgets(5));
  });
}
