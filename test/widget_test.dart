// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:haikyuu_game/main.dart';
import 'package:haikyuu_game/providers/game_providers.dart';

void main() {
  testWidgets('App shows Open Pack button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GameStateContainer(child: Haikyuu()));

    // Verify that the Open Pack button is present.
    expect(find.text('Open Pack'), findsOneWidget);
  });
}
