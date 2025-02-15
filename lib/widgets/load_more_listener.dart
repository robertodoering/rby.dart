import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class LoadMoreListener extends StatefulWidget {
  const LoadMoreListener({
    super.key,
    required this.controller,
    required this.onLoadMore,
    this.listen = true,
    this.extentTrigger,
    required this.child,
  });

  final ScrollController controller;
  final AsyncCallback onLoadMore;
  final bool listen;

  /// How little quantity of content conceptually 'below' the viewport needs to
  /// be scrollable to trigger the [onLoadMore].
  ///
  /// Defaults to half of the scrollable's viewport size.
  final double? extentTrigger;

  final Widget child;

  @override
  State<LoadMoreListener> createState() => _LoadMoreListenerState();
}

class _LoadMoreListenerState extends State<LoadMoreListener> {
  var _loading = false;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(_maybeLoadMore);

    if (widget.listen) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _maybeLoadMore());
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_maybeLoadMore);

    super.dispose();
  }

  @override
  void didUpdateWidget(covariant LoadMoreListener oldWidget) {
    super.didUpdateWidget(oldWidget);

    // When re-enabling the listener, we want to query the current scroll extent
    // to potentially call the callback.
    if (!oldWidget.listen && widget.listen) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _maybeLoadMore());
    }
  }

  void _maybeLoadMore() {
    if (_loading || !mounted) return;
    if (!widget.listen) return;
    if (!mounted) return;
    if (widget.controller.positions.length != 1) return;

    final position = widget.controller.positions.single;

    if (position.extentAfter <=
        (widget.extentTrigger ?? position.viewportDimension / 2)) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (_loading) return;
    if (!mounted) return;

    setState(() => _loading = true);
    await widget.onLoadMore();
    if (!mounted) return;

    setState(() => _loading = false);

    // After loading more, re-trigger the listener in case the scroll extent is
    // still below the extent trigger.
    _maybeLoadMore();
  }

  bool _onNotification(ScrollNotification notification) {
    if (notification.metrics.extentAfter <=
        (widget.extentTrigger ?? notification.metrics.viewportDimension / 2)) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _loadMore());
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: widget.listen && !_loading ? _onNotification : null,
      child: widget.child,
    );
  }
}
