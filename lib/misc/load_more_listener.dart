import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Listens to scroll notifications that bubble up the tree to call the
/// [onLoadMore] callback when reaching the end of the scrollable.
class LoadMoreListener extends StatefulWidget {
  const LoadMoreListener({
    super.key,
    this.listen = true,
    this.extentTrigger,
    required this.onLoadMore,
    required this.child,
  });

  final bool listen;

  /// How little quantity of content conceptually "below" the viewport needs to
  /// be scrollable to trigger the [onLoadMore].
  ///
  /// Defaults to half of the scrollable's viewport size.
  final double? extentTrigger;

  final AsyncCallback onLoadMore;
  final Widget child;

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
