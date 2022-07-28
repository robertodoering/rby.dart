import 'package:example/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'rby_widgets example',
      theme: RbyTheme(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ).data,
      home: const HomePage(),
    );
  }
}
