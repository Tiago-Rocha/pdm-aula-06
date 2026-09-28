// Tests for the forecast screen. Run with: flutter test
// They start red. Each step of the class turns one of them green.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tempo_acores/forecast_screen.dart';
import 'package:tempo_acores/main.dart';

/// Runs the app in a window of the given logical size.
Future<void> pumpAt(WidgetTester tester, Size size) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(const WeatherApp());
}

void main() {
  testWidgets('Passo 1: o cabeçalho cabe na largura de um telemóvel',
      (tester) async {
    await pumpAt(tester, const Size(412, 915));

    expect(tester.takeException(), isNull,
        reason: 'Há um overflow: uma Row está a pedir mais largura do que a '
            'que o telemóvel tem. Usa Expanded.');
    final current = find.byType(CurrentConditions);
    for (final label in ['Mín', 'Máx', 'Chuva']) {
      expect(find.descendant(of: current, matching: find.text(label)),
          findsOneWidget);
    }
  });

  testWidgets('Passo 2: nome da ilha sobre a imagem e chip do estado do tempo',
      (tester) async {
    await pumpAt(tester, const Size(412, 915));

    final header = find.byType(IslandHeader);
    expect(find.descendant(of: header, matching: find.text('São Miguel')),
        findsOneWidget,
        reason: 'Falta o nome da ilha dentro do IslandHeader.');
    expect(find.descendant(of: header, matching: find.byType(Chip)),
        findsOneWidget,
        reason: 'Falta um Chip com a descrição do tempo dentro do IslandHeader.');
  });
}
