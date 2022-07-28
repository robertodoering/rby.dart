import 'package:flutter/material.dart';

class RebuildOnTap extends StatefulWidget {
  const RebuildOnTap({
    required this.child,
  });

  final Widget child;

  @override
  State<RebuildOnTap> createState() => _RebuildOnTapState();
}

class _RebuildOnTapState extends State<RebuildOnTap> {
  var _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _key,
      behavior: HitTestBehavior.translucent,
      onTap: () => setState(() => _key = UniqueKey()),
      child: widget.child,
    );
  }
}
