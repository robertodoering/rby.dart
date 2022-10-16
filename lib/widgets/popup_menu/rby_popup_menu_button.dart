import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rby/rby.dart';

/// A custom popup menu button that calls [showRbyMenu] to show a menu.
class RbyPopupMenuButton<T> extends StatefulWidget {
  const RbyPopupMenuButton({
    required this.itemBuilder,
    this.onSelected,
    this.onCancelled,
    this.enabled = true,
  });

  final PopupMenuItemBuilder<T> itemBuilder;
  final PopupMenuItemSelected<T>? onSelected;
  final VoidCallback? onCancelled;
  final bool enabled;

  @override
  State<RbyPopupMenuButton<T>> createState() => _RbyPopupMenuButtonState<T>();
}

class _RbyPopupMenuButtonState<T> extends State<RbyPopupMenuButton<T>> {
  void _showButtonMenu() {
    final button = context.findRenderObject()! as RenderBox;
    final overlay =
        Navigator.of(context).overlay!.context.findRenderObject()! as RenderBox;

    final position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(
          button.size.bottomRight(Offset.zero),
          ancestor: overlay,
        ),
      ),
      Offset.zero & overlay.size,
    );

    final items = widget.itemBuilder(context);

    if (items.isNotEmpty) {
      showRbyMenu(
        context: context,
        items: items,
        position: position,
      ).then((newValue) {
        if (!mounted) return;

        if (newValue == null) {
          widget.onCancelled?.call();
        } else {
          HapticFeedback.lightImpact();
          widget.onSelected?.call(newValue);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RbyButton.transparent(
      icon: const Icon(CupertinoIcons.ellipsis_vertical),
      onTap: widget.enabled ? _showButtonMenu : null,
    );
  }
}

class RbyPopupMenuListTile<T> extends PopupMenuEntry<T> {
  const RbyPopupMenuListTile({
    required this.value,
    this.leading,
    this.title,
    this.trailing,
    this.enabled = true,
  });

  final Widget? leading;
  final Widget? title;
  final Widget? trailing;

  /// The value that will be returned by [showMenu] if this entry is selected.
  ///
  /// When `null`, [RbyPopupMenuButton.onCancelled] will be called if this
  /// item is selected.
  final T? value;

  /// Whether the user is permitted to select this item.
  final bool enabled;

  @override
  double get height => kMinInteractiveDimension;

  @override
  bool represents(T? value) => value == this.value;

  @override
  State<RbyPopupMenuListTile<T>> createState() =>
      _RbyPopupMenuListTileState<T, RbyPopupMenuListTile<T>>();
}

class _RbyPopupMenuListTileState<T, W extends RbyPopupMenuListTile<T>>
    extends State<W> {
  @override
  Widget build(BuildContext context) {
    return RbyListTile(
      leading: widget.leading,
      title: widget.title,
      trailing: widget.trailing,
      borderRadius: BorderRadius.zero,
      onTap:
          widget.enabled ? () => Navigator.of(context).pop(widget.value) : null,
    );
  }
}

class RbyPopupMenuRow<T> extends PopupMenuEntry<T> {
  const RbyPopupMenuRow({
    required this.children,
  }) : assert(children.length <= 4);

  final List<RbyPopupMenuIcon<T>> children;

  @override
  double get height => kMinInteractiveDimension;

  @override
  bool represents(T? value) => false;

  @override
  State<RbyPopupMenuRow<T>> createState() =>
      _RbyPopupMenuRow<T, RbyPopupMenuRow<T>>();
}

class _RbyPopupMenuRow<T, W extends RbyPopupMenuRow<T>> extends State<W> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.children,
    );
  }
}

class RbyPopupMenuIcon<T> extends PopupMenuEntry<T> {
  const RbyPopupMenuIcon({
    required this.value,
    required this.icon,
    this.enabled = true,
  });

  final Widget icon;

  /// The value that will be returned by [showMenu] if this entry is selected.
  ///
  /// When `null`, [RbyPopupMenuButton.onCancelled] will be called if this
  /// item is selected.
  final T? value;

  final bool enabled;

  @override
  double get height => kMinInteractiveDimension;

  @override
  bool represents(T? value) => value == this.value;

  @override
  State<RbyPopupMenuIcon<T>> createState() =>
      _RbyPopupMenuIcon<T, RbyPopupMenuIcon<T>>();
}

class _RbyPopupMenuIcon<T, W extends RbyPopupMenuIcon<T>> extends State<W> {
  @override
  Widget build(BuildContext context) {
    return RbyButton.transparent(
      icon: widget.icon,
      onTap:
          widget.enabled ? () => Navigator.of(context).pop(widget.value) : null,
    );
  }
}
