import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:device_info_plugin_example/main.dart';

void main() {
  testWidgets('Verify OS version', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that platform version is retrieved.
    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is Text && widget.data!.startsWith('OS Version:'),
      ),
      findsOneWidget,
    );
  });
}
