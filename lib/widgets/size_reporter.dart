import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeReporter extends SingleChildRenderObjectWidget {
  const SizeReporter({
    super.key,
    required this.onSizeChanged,
    required super.child,
  });

  final ValueChanged<Size> onSizeChanged;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderSizeReporter(
      onSizeChanged: onSizeChanged,
    );
  }
}

class _RenderSizeReporter extends RenderProxyBox {
  _RenderSizeReporter({
    required this.onSizeChanged,
  });

  final ValueChanged<Size> onSizeChanged;
  Size? _oldSize;

  @override
  void performLayout() {
    super.performLayout();

    if (size != _oldSize) {
      onSizeChanged(size);
    }

    _oldSize = size;
  }
}
