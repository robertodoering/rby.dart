import 'package:flutter/material.dart';
import 'package:rby/rby.dart';

class RbyImage extends StatelessWidget {
  const RbyImage({
    required this.image,
    this.borderRadius,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    this.filterQuality = FilterQuality.low,
    this.errorBuilder = _defaultErrorBuilder,
    this.loadingBuilder = _defaultLoadingBuilder,
  });

  final ImageProvider image;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final FilterQuality filterQuality;
  final ImageErrorWidgetBuilder errorBuilder;
  final ImageLoadingBuilder loadingBuilder;

  static Widget _defaultErrorBuilder(_, __, ___) => const SizedBox();
  static Widget _defaultLoadingBuilder(_, __, ___) => const SizedBox();

  Widget _frameBuilder(
    BuildContext context,
    Widget child,
    int? frame,
    bool wasSynchronouslyLoaded,
  ) {
    return wasSynchronouslyLoaded
        ? child
        : AnimatedOpacity(
            duration: Theme.of(context).animation.long,
            curve: Curves.easeOutCubic,
            opacity: frame == null ? 0 : 1,
            child: child,
          );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: borderRadius ?? theme.shape.borderRadius,
      child: Image(
        image: image,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        filterQuality: filterQuality,
        frameBuilder: _frameBuilder,
        errorBuilder: errorBuilder,
      ),
    );
  }
}
