import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it_done/main.dart';

void main() {
  MaterialApp _coreWidget(WidgetTester tester) {
    return MaterialApp(
      home: Material(
        child: Builder(builder: (BuildContext context) {
          return GetItDone();
        }),
      ),
    );
  }

  testWidgets('Core widget should contain a floating action button',
      (WidgetTester tester) async {
    await tester.pumpWidget(_coreWidget(tester));
    await tester.pumpAndSettle(Duration(seconds: 3));

    final Finder fabFinder = find.byType(FloatingActionButton);

    expect(fabFinder, findsOneWidget);
  });
}
