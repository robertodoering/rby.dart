import 'package:example/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rby_widgets/rby_widgets.dart';

final seedColorProvider = StateProvider<Color>((ref) => Colors.deepPurple);
final brightnessProvider = StateProvider((ref) => Brightness.dark);

void main() {
  runApp(const ProviderScope(child: ExampleApp()));
}

class ExampleApp extends ConsumerWidget {
  const ExampleApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'rby_widgets example',
      theme: RbyTheme(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ref.watch(seedColorProvider),
          brightness: ref.watch(brightnessProvider),
        ),
      ).data,
      home: const HomePage(),
    );
  }
}
