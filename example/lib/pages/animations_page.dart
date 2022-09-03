import 'dart:async';
import 'dart:ui';

import 'package:example/storybook.dart';
import 'package:example/util.dart';
import 'package:flutter/material.dart';
import 'package:rby_widgets/animations/implicit/animated_number.dart';
import 'package:rby_widgets/rby_widgets.dart';

class AnimationsPage extends StatelessWidget {
  const AnimationsPage();

  @override
  Widget build(BuildContext context) {
    return Storybook(
      title: const Text('animations'),
      entries: [
        StorybookEntry(
          label: 'ImmediateOpacityAnimation',
         builder: (_) => const _Opacity(),
        ),
        StorybookEntry(
          label: 'ImmediateScaleAnimation',
          builder: (_) => const _Scale(),
        ),
        StorybookEntry(
          label: 'ImmediateSlideAnimation',
          builder: (_) => const _Slide(),
        ),
        StorybookEntry(
          label: 'AnimatedNumber',
          builder: (_) => const _Number(),
        ),
      ],
    );
  }
}

class _Opacity extends StatelessWidget {
  const _Opacity();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RebuildOnTap(
      child: ImmediateOpacityAnimation(
        duration: theme.longAnimationDuration,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: theme.borderRadius,
            color: theme.colorScheme.primary,
          ),
          alignment: Alignment.center,
          padding: theme.edgeInsets,
          child: FittedBox(
            child: Text(
              'ImmediateOpacityAnimation',
              style: theme.textTheme.subtitle1?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class _Scale extends StatelessWidget {
  const _Scale();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RebuildOnTap(
      child: ImmediateScaleAnimation(
        duration: theme.longAnimationDuration,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: theme.borderRadius,
            color: theme.colorScheme.primary,
          ),
          alignment: Alignment.center,
          padding: theme.edgeInsets,
          child: FittedBox(
            child: Text(
              'ImmediateScaleAnimation',
              style: theme.textTheme.subtitle1?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RebuildOnTap(
      child: ImmediateSlideAnimation(
        duration: theme.longAnimationDuration,
        begin: const Offset(1, 0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: theme.borderRadius,
            color: theme.colorScheme.primary,
          ),
          alignment: Alignment.center,
          padding: theme.edgeInsets,
          child: FittedBox(
            child: Text(
              'ImmediateSlideAnimation',
              style: theme.textTheme.subtitle1?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class _Number extends StatefulWidget {
  const _Number();

  @override
  _NumberState createState() => _NumberState();
}

class _NumberState extends State<_Number> {
  int _number = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), _callback);
  }

  void _callback(Timer timer) {
    if (mounted) {
      setState(() => ++_number);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'AnimatedNumber',
          style: theme.textTheme.headlineSmall,
        ),
        const SizedBox(height: 4),
        AnimatedNumber(
          number: _number,
          style: theme.textTheme.headlineMedium?.copyWith(
            // monospace to prevent width changes
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}
