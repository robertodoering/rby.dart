import 'package:flutter/widgets.dart';

enum PointerState {
  pressed,
  hovering,
}

typedef PointerStateBuilder = Widget Function(
  BuildContext context,
  Widget? child,
  Set<PointerState> states,
);

class PointerBuilder extends StatefulWidget {
  const PointerBuilder({
    super.key,
    this.onTap,
    this.cursor = MouseCursor.defer,
    this.opaque = true,
    this.behavior = HitTestBehavior.opaque,
    this.enabled = true,
    required this.builder,
    this.child,
  });

  final VoidCallback? onTap;
  final MouseCursor cursor;

  /// Whether this widget should prevent other [MouseRegion]s visually behind it
  /// from detecting the pointer.
  final bool opaque;

  final HitTestBehavior behavior;
  final bool enabled;
  final PointerStateBuilder builder;
  final Widget? child;

  @override
  State<PointerBuilder> createState() => _PointerBuilderState();
}

class _PointerBuilderState extends State<PointerBuilder> {
  final _states = <PointerState>{};

  void _add(PointerState state) {
    setState(() => _states.add(state));
  }

  void _remove(PointerState state) {
    setState(() => _states.remove(state));
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return widget.builder(context, widget.child, const {});
    }

    return MouseRegion(
      onEnter: (_) => _add(PointerState.hovering),
      onExit: (_) => _remove(PointerState.hovering),
      cursor: widget.cursor,
      opaque: widget.opaque,
      hitTestBehavior: widget.behavior,
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) => _add(PointerState.pressed),
        onTapUp: (_) => _remove(PointerState.pressed),
        onTapCancel: () => _remove(PointerState.pressed),
        behavior: widget.behavior,
        child: widget.builder(context, widget.child, _states),
      ),
    );
  }
}
