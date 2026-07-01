import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alu_venture_link/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ALU VentureLink launches with the discover screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ALUVentureLinkApp());
    await tester.pumpAndSettle();

    expect(find.text('ALU VentureLink'), findsOneWidget);
    expect(find.text('Open opportunities'), findsOneWidget);
  });
}
