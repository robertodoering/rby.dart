import 'package:flutter/material.dart';
import 'package:gap/gap.dart' as gap;
import 'package:rby/rby.dart';

enum _GapSize {
  custom,
  xxs,
  xs,
  s,
  m,
  l,
  xl,
  xxl,
}

class Gap extends StatelessWidget {
  const Gap(
    this.mainAxisExtent, {
    super.key,
    this.crossAxisExtent,
    this.color,
  }) : _size = _GapSize.custom;

  const Gap.xxs({
    super.key,
    this.crossAxisExtent,
    this.color,
  })  : _size = _GapSize.xxs,
        mainAxisExtent = null;

  const Gap.xs({
    super.key,
    this.crossAxisExtent,
    this.color,
  })  : _size = _GapSize.xs,
        mainAxisExtent = null;

  const Gap.s({
    super.key,
    this.crossAxisExtent,
    this.color,
  })  : _size = _GapSize.s,
        mainAxisExtent = null;

  const Gap.m({
    super.key,
    this.crossAxisExtent,
    this.color,
  })  : _size = _GapSize.m,
        mainAxisExtent = null;

  const Gap.l({
    super.key,
    this.crossAxisExtent,
    this.color,
  })  : _size = _GapSize.l,
        mainAxisExtent = null;

  const Gap.xl({
    super.key,
    this.crossAxisExtent,
    this.color,
  })  : _size = _GapSize.xl,
        mainAxisExtent = null;

  const Gap.xxl({
    super.key,
    this.crossAxisExtent,
    this.color,
  })  : _size = _GapSize.xxl,
        mainAxisExtent = null;

  final _GapSize _size;
  final double? mainAxisExtent;
  final double? crossAxisExtent;
  final Color? color;

  double _resolveMainAxisExtent(ThemeData theme) {
    return switch (_size) {
      _GapSize.custom => mainAxisExtent!,
      _GapSize.xxs => theme.spacingScheme.xxs,
      _GapSize.xs => theme.spacingScheme.xs,
      _GapSize.s => theme.spacingScheme.s,
      _GapSize.m => theme.spacingScheme.m,
      _GapSize.l => theme.spacingScheme.l,
      _GapSize.xl => theme.spacingScheme.xl,
      _GapSize.xxl => theme.spacingScheme.xxl,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return gap.Gap(
      _resolveMainAxisExtent(theme),
      crossAxisExtent: crossAxisExtent,
      color: color,
    );
  }
}

class SliverGap extends StatelessWidget {
  const SliverGap(
    this.mainAxisExtent, {
    super.key,
    this.color,
  }) : _size = _GapSize.custom;

  const SliverGap.xxs({
    super.key,
    this.color,
  })  : _size = _GapSize.xxs,
        mainAxisExtent = null;

  const SliverGap.xs({
    super.key,
    this.color,
  })  : _size = _GapSize.xs,
        mainAxisExtent = null;

  const SliverGap.s({
    super.key,
    this.color,
  })  : _size = _GapSize.s,
        mainAxisExtent = null;

  const SliverGap.m({
    super.key,
    this.color,
  })  : _size = _GapSize.m,
        mainAxisExtent = null;

  const SliverGap.l({
    super.key,
    this.color,
  })  : _size = _GapSize.l,
        mainAxisExtent = null;

  const SliverGap.xl({
    super.key,
    this.color,
  })  : _size = _GapSize.xl,
        mainAxisExtent = null;

  const SliverGap.xxl({
    super.key,
    this.color,
  })  : _size = _GapSize.xxl,
        mainAxisExtent = null;

  final _GapSize _size;
  final double? mainAxisExtent;
  final Color? color;

  double _resolveMainAxisExtent(ThemeData theme) {
    return switch (_size) {
      _GapSize.custom => mainAxisExtent!,
      _GapSize.xxs => theme.spacingScheme.xxs,
      _GapSize.xs => theme.spacingScheme.xs,
      _GapSize.s => theme.spacingScheme.s,
      _GapSize.m => theme.spacingScheme.m,
      _GapSize.l => theme.spacingScheme.l,
      _GapSize.xl => theme.spacingScheme.xl,
      _GapSize.xxl => theme.spacingScheme.xxl,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return gap.SliverGap(
      _resolveMainAxisExtent(theme),
      color: color,
    );
  }
}
