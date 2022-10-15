import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

/// Horizontal spacer based on the [RbySpacingTheme].
abstract class HorizontalSpacer {
  static const small = _SmallSpacer(axis: Axis.horizontal);

  static const normal = _Spacer(axis: Axis.horizontal);

  static const large = _LargeSpacer(axis: Axis.horizontal);

  static const smallSliver = SliverToBoxAdapter(
    child: _SmallSpacer(axis: Axis.horizontal),
  );

  static const normalSliver = SliverToBoxAdapter(
    child: _Spacer(axis: Axis.horizontal),
  );

  static const largeSliver = SliverToBoxAdapter(
    child: _LargeSpacer(axis: Axis.horizontal),
  );
}

/// Vertical spacer based on the [RbySpacingTheme].
abstract class VerticalSpacer {
  static const small = _SmallSpacer(axis: Axis.vertical);

  static const normal = _Spacer(axis: Axis.vertical);

  static const large = _LargeSpacer(axis: Axis.vertical);

  static const smallSliver = SliverToBoxAdapter(
    child: _SmallSpacer(axis: Axis.vertical),
  );

  static const normalSliver = SliverToBoxAdapter(
    child: _Spacer(axis: Axis.vertical),
  );

  static const largeSliver = SliverToBoxAdapter(
    child: _LargeSpacer(axis: Axis.vertical),
  );
}

class _Spacer extends StatelessWidget {
  const _Spacer({
    required this.axis,
  });

  final Axis axis;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: axis == Axis.horizontal ? theme.spacing.base : null,
      height: axis == Axis.vertical ? theme.spacing.base : null,
    );
  }
}

class _SmallSpacer extends StatelessWidget {
  const _SmallSpacer({
    required this.axis,
  });

  final Axis axis;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: axis == Axis.horizontal ? theme.spacing.small : null,
      height: axis == Axis.vertical ? theme.spacing.small : null,
    );
  }
}

class _LargeSpacer extends StatelessWidget {
  const _LargeSpacer({
    required this.axis,
  });

  final Axis axis;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: axis == Axis.horizontal ? theme.spacing.large : null,
      height: axis == Axis.vertical ? theme.spacing.large : null,
    );
  }
}
