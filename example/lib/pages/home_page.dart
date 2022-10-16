import 'package:example/main.dart';
import 'package:example/pages/animations_page.dart';
import 'package:example/pages/material_widgets_page.dart';
import 'package:example/pages/typography_page.dart';
import 'package:example/pages/widgets_page.dart';
import 'package:example/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rby/rby.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const RbySliverAppBar(
            title: Text('rby_widgets'),
            actions: [_ColorButton(), _BrightnessButton()],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              RbyListTile(
                title: const Text('typography'),
                onTap: () => Navigator.of(context).push(
                  platformPageRoute<void>(
                    context,
                    builder: (_) => const TypographyPage(),
                  ),
                ),
              ),
              RbyListTile(
                title: const Text('widgets'),
                onTap: () => Navigator.of(context).push(
                  platformPageRoute<void>(
                    context,
                    builder: (_) => const WidgetsPage(),
                  ),
                ),
              ),
              RbyListTile(
                title: const Text('animations'),
                onTap: () => Navigator.of(context).push(
                  platformPageRoute<void>(
                    context,
                    builder: (_) => const AnimationsPage(),
                  ),
                ),
              ),
              RbyListTile(
                title: const Text('material'),
                onTap: () => Navigator.of(context).push(
                  platformPageRoute<void>(
                    context,
                    builder: (_) => const MaterialWidgetsPage(),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class _BrightnessButton extends ConsumerWidget {
  const _BrightnessButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brightness = ref.watch(brightnessProvider);

    return RbyButton.transparent(
      icon: Icon(
        brightness == Brightness.dark
            ? CupertinoIcons.brightness
            : CupertinoIcons.brightness_solid,
      ),
      onTap: () => ref.read(brightnessProvider.notifier).state =
          brightness == Brightness.dark ? Brightness.light : Brightness.dark,
    );
  }
}

class _ColorButton extends ConsumerWidget {
  const _ColorButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(seedColorProvider);

    return RbyButton.transparent(
      icon: Icon(CupertinoIcons.circle_fill, color: color),
      onTap: () async {
        void onColorChanged(Color color) =>
            ref.read(seedColorProvider.notifier).state = color;

        final newColor = await showDialog<Color>(
          context: context,
          builder: (_) => ColorPickerDialog(
            color: color,
            onColorChanged: onColorChanged,
          ),
        );

        if (newColor != null) onColorChanged(newColor);
      },
    );
  }
}
