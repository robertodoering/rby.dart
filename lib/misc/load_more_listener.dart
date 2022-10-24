import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Listens to scroll notifications that bubble up the tree to call the
/// [onLoadMore] callback when reaching the end of the scrollable.
class LoadMoreListener extends StatefulWidget {
  const LoadMoreListener({
    required this.child,
    required this.onLoadMore,
    this.listen = true,
    this.extentTrigger,
  });

  final Widget child;
  final AsyncCallback onLoadMore;
  final bool listen;

  /// How little quantity of content conceptually "below" the viewport needs to
  /// be scrollable to trigger the [onLoadMore].
  ///
  /// Defaults to half of the scrollable's viewport size.
  final double? extentTrigger;

  @override
  State<LoadMoreListener> createState() => _LoadMoreListenerState();
}

class _LoadMoreListenerState extends State<LoadMoreListener> {
  bool _loading = false;

  Future<void> _loadMore() async {
    if (_loading) return;

    if (mounted) setState(() => _loading = true);
    await widget.onLoadMore();
    if (mounted) setState(() => _loading = false);
  }

  bool _onNotification(ScrollNotification notification) {
    if (notification.metrics.extentAfter <=
        (widget.extentTrigger ?? notification.metrics.viewportDimension / 2)) {
      _loadMore();
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: widget.listen ? _onNotification : null,
      child: widget.child,
    );
  }
}
