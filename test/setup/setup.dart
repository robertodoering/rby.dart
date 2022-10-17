import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rby/rby.dart';

Future<void> pumpWithTheme(WidgetTester tester, Widget widget) async {
  return tester.pumpWidget(
    Theme(
      data: RbyTheme(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        iconData: RbyIconDataTheme(
          drawer: (_) => const Icon(Icons.menu_rounded),
          close: (_) => const Icon(Icons.close_rounded),
          back: (_) => const Icon(Icons.chevron_left_rounded),
          expand: (_) => const RotatedBox(
            quarterTurns: 1,
            child: Icon(Icons.chevron_right_rounded),
          ),
        ),
      ).data,
      child: widget,
    ),
  );
}
