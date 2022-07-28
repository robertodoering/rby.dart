import 'package:flutter/material.dart';
import 'package:rby_widgets/rby_widgets.dart';

/// Horizontal spacer based on the [RbyPaddingData].
abstract class HorizontalSpacer {
  static const small = _Spacer(
    axis: Axis.horizontal,
    type: RbyPaddingType.small,
  );

  static const normal = _Spacer(
    axis: Axis.horizontal,
    type: RbyPaddingType.base,
  );

  static const large = _Spacer(
    axis: Axis.horizontal,
    type: RbyPaddingType.large,
  );

  static const smallSliver = SliverToBoxAdapter(
    child: _Spacer(
      axis: Axis.horizontal,
      type: RbyPaddingType.small,
    ),
  );

  static const normalSliver = SliverToBoxAdapter(
    child: _Spacer(
      axis: Axis.horizontal,
      type: RbyPaddingType.base,
    ),
  );

  static const largeSliver = SliverToBoxAdapter(
    child: _Spacer(
      axis: Axis.horizontal,
      type: RbyPaddingType.large,
    ),
  );
}

/// Vertical spacer based on the [RbyPaddingData].
abstract class VerticalSpacer {
  static const small = _Spacer(
    axis: Axis.vertical,
    type: RbyPaddingType.small,
  );

  static const normal = _Spacer(
    axis: Axis.vertical,
    type: RbyPaddingType.base,
  );

  static const large = _Spacer(
    axis: Axis.vertical,
    type: RbyPaddingType.large,
  );

  static const smallSliver = SliverToBoxAdapter(
    child: _Spacer(
      axis: Axis.vertical,
      type: RbyPaddingType.small,
    ),
  );

  static const normalSliver = SliverToBoxAdapter(
    child: _Spacer(
      axis: Axis.vertical,
      type: RbyPaddingType.base,
    ),
  );

  static const largeSliver = SliverToBoxAdapter(
    child: _Spacer(
      axis: Axis.vertical,
      type: RbyPaddingType.large,
    ),
  );
}

class _Spacer extends StatelessWidget {
  const _Spacer({
    required this.axis,
    required this.type,
  });

  final Axis axis;
  final RbyPaddingType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = theme.extension<RbyPaddingData>()!;

    return SizedBox(
      width: axis == Axis.horizontal ? padding.valueFromType(type) : null,
      height: axis == Axis.vertical ? padding.valueFromType(type) : null,
    );
  }
}
