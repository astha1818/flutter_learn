import 'package:flutter/material.dart';
import 'package:flutter_learn/modules/tutorial/view/tutorial.dart';
import 'package:flutter_learn/res/colors.dart';
import 'package:flutter_learn/res/strings.dart';
import 'package:flutter_learn/utlis/helpers/route.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("testing tutorial", (widgetTester) async {
    Widget widget = MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: AppColors.blue,
      ),
      home: const TutorialPage(),
      routes: AppRoutes.getRoutes(),
      debugShowCheckedModeBanner: false,
    );
    await widgetTester.pumpWidget(widget);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(seconds: 5));
    // await Future.delayed(const Duration(seconds: 5));
    await widgetTester.pumpAndSettle();
    await widgetTester.longPress(find.byType(GestureDetector).first);
    await widgetTester.tap(find.byType(TextButton));
  });
}
