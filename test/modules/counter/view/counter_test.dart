import 'package:flutter/material.dart';
import 'package:flutter_learn/modules/counter/view/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Testing Counter App', (widgetTester) async {
    Widget widget = MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Counter(),
    );
    await widgetTester.pumpWidget(widget);
    await widgetTester.pumpAndSettle();
    await widgetTester.tap(find.byType(FloatingActionButton));
  });
}
