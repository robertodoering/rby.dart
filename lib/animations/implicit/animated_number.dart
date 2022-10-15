import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rby_widgets/rby_widgets.dart';

/// Implicitly animations a change to [number].
///
/// The [number] is formatted using the [numberFormat]. An animation only
/// displays when the formatted number changes.
class AnimatedNumber extends StatefulWidget {
  AnimatedNumber({
    required this.number,
    NumberFormat? numberFormat,
    this.duration,
    this.style,
  }) : numberFormat = numberFormat ?? NumberFormat.compact();

  final int number;
  final NumberFormat numberFormat;

  /// Defaults to [RbyAnimationTheme.short].
  final Duration? duration;

  final TextStyle? style;

  @override
  State<AnimatedNumber> createState() => _AnimatedNumberState();
}

class _AnimatedNumberState extends State<AnimatedNumber>
    with SingleTickerProviderStateMixin<AnimatedNumber> {
  AnimationController? _controller;
  late Animation<Offset> _oldSlideAnimation;
  late Animation<Offset> _newSlideAnimation;
  late Animation<double> _opacityAnimation;

  late int _oldNumber;
  late String _oldNumberStr;
  late String _newNumberStr;

  @override
  void initState() {
    super.initState();

    _newNumberStr = widget.numberFormat.format(widget.number);
    _oldNumberStr = _newNumberStr;
    _oldNumber = widget.number;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _controller?.dispose();
    _controller = AnimationController(
      duration: widget.duration ?? Theme.of(context).animation.short,
      vsync: this,
    );

    _oldSlideAnimation = Tween(begin: Offset.zero, end: const Offset(0, 1))
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_controller!);

    _newSlideAnimation = Tween(begin: const Offset(0, -1), end: Offset.zero)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_controller!);

    _opacityAnimation = Tween<double>(begin: 1, end: 0)
        .chain(CurveTween(curve: Curves.easeOut))
        .animate(_controller!);
  }

  @override
  void didUpdateWidget(AnimatedNumber oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.number != widget.number) {
      _newNumberStr = widget.numberFormat.format(widget.number);

      if (!_controller!.isAnimating) {
        _controller!.forward(from: 0).then((_) {
          _oldNumberStr = _newNumberStr;
          _oldNumber = widget.number;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final style = widget.style ??
        DefaultTextStyle.of(context).style.copyWith(
          // monospace to prevent width changes
          fontFeatures: const [FontFeature.tabularFigures()],
        );

    var changedIndex = 0;

    if (_oldNumberStr.length == _newNumberStr.length) {
      for (var i = 0; i < _oldNumberStr.length; i++) {
        if (_oldNumberStr[i] != _newNumberStr[i]) {
          changedIndex = i;
          break;
        }
      }
    }

    // the unchanged part of the text
    final unchanged = _newNumberStr.substring(0, changedIndex);

    // the old text that should animate out
    final oldText = _oldNumberStr.substring(
      changedIndex,
      _oldNumberStr.length,
    );

    // the new text that should animate in
    final newText = _newNumberStr.substring(
      changedIndex,
      _newNumberStr.length,
    );

    return ClipRect(
      child: AnimatedSize(
        duration: widget.duration ?? theme.animation.short,
        curve: Curves.easeOutCubic,
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _oldSlideAnimation,
            _newSlideAnimation,
            _opacityAnimation,
          ]),
          builder: (_, __) => Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                unchanged,
                style: style,
              ),
              Stack(
                fit: StackFit.passthrough,
                children: [
                  FractionalTranslation(
                    translation: _oldNumber > widget.number
                        ? _newSlideAnimation.value
                        : -_newSlideAnimation.value,
                    child: Text(newText, style: style),
                  ),
                  Opacity(
                    opacity: _opacityAnimation.value,
                    child: FractionalTranslation(
                      translation: _oldNumber > widget.number
                          ? _oldSlideAnimation.value
                          : -_oldSlideAnimation.value,
                      child: Text(oldText, style: style),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
