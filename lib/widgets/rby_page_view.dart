import 'package:flutter/material.dart';
import 'package:rby/rby.dart';

typedef RbyPageViewTransitionBuilder = Widget Function(
  Widget child,
  Animation<double> animation,
  int sign,
  Axis scrollDirection,
);

/// Builds a [PageView] and implicitly animates changes to [currentPage].
///
/// Rather than relying on [PageController.animateToPage], we slide in the new
/// child and jump to the new page in the background to prevent building every
/// child in between the old and new page.
class RbyPageView extends StatefulWidget {
  const RbyPageView({
    super.key,
    required this.currentPage,
    this.scrollDirection = Axis.horizontal,
    this.reverse = false,
    this.physics,
    this.pageSnapping = true,
    this.clipBehavior = Clip.hardEdge,
    this.scrollBehavior,
    this.padEnds = true,
    this.onPageChanged,
    this.itemCount,
    this.transitionInBuilder = _defaultTransitionInBuilder,
    this.transitionOutBuilder = _defaultTransitionOutBuilder,
    required this.builder,
  });

  final int currentPage;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollPhysics? physics;
  final bool pageSnapping;
  final Clip clipBehavior;
  final ScrollBehavior? scrollBehavior;
  final bool padEnds;
  final ValueChanged<int>? onPageChanged;
  final int? itemCount;
  final RbyPageViewTransitionBuilder transitionInBuilder;
  final RbyPageViewTransitionBuilder transitionOutBuilder;
  final IndexedWidgetBuilder builder;

  @override
  State<RbyPageView> createState() => _RbyPageViewState();
}

class _RbyPageViewState extends State<RbyPageView>
    with TickerProviderStateMixin {
  late final PageController _pageController;
  late int _currentPage;

  late AnimationController _animationController;
  late int _inSign;
  late int _outSign;

  Widget? _slideInChild;
  Widget? _slideOutChild;

  @override
  void initState() {
    super.initState();

    _currentPage = widget.currentPage;
    _pageController = PageController()..addListener(_pageControllerListener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final theme = Theme.of(context);

    _animationController = AnimationController(
      vsync: this,
      duration: theme.animation.short,
    );
  }

  @override
  void didUpdateWidget(covariant RbyPageView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentPage != widget.currentPage &&
        widget.currentPage != _currentPage) {
      _animatePageChange(oldWidget.currentPage);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();

    super.dispose();
  }

  void _pageControllerListener() {
    if (!mounted) return;

    final page = _pageController.page?.round() ?? 0;

    if (_currentPage != page) {
      _currentPage = page;
    }
  }

  void _animatePageChange(int oldPage) {
    _slideInChild = widget.builder(context, widget.currentPage);
    _slideOutChild = widget.builder(context, oldPage);

    _inSign = widget.currentPage > oldPage ? 1 : -1;
    _outSign = -_inSign;

    _animationController.forward(from: 0);

    _currentPage = widget.currentPage;
    _pageController.jumpToPage(widget.currentPage);
  }

  @override
  Widget build(BuildContext context) {
    AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _slideInChild,
    );
    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) => Stack(
        children: [
          Opacity(
            opacity: _animationController.isAnimating ? 0 : 1,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: widget.scrollDirection,
              reverse: widget.reverse,
              physics: widget.physics,
              pageSnapping: widget.pageSnapping,
              clipBehavior: widget.clipBehavior,
              scrollBehavior: widget.scrollBehavior,
              padEnds: widget.padEnds,
              onPageChanged: widget.onPageChanged,
              itemCount: widget.itemCount,
              itemBuilder: widget.builder,
            ),
          ),
          if (_animationController.isAnimating) ...[
            if (_slideOutChild != null)
              widget.transitionOutBuilder(
                _slideOutChild!,
                _animationController,
                _outSign,
                widget.scrollDirection,
              ),
            if (_slideInChild != null)
              widget.transitionInBuilder(
                _slideInChild!,
                _animationController,
                _inSign,
                widget.scrollDirection,
              ),
          ],
        ],
      ),
    );
  }
}

Widget _defaultTransitionInBuilder(
  Widget child,
  Animation<double> animation,
  int sign,
  Axis scrollDirection,
) {
  final offset = scrollDirection == Axis.horizontal
      ? const Offset(1, 0)
      : const Offset(0, 1);

  final position = Tween(begin: offset * sign.toDouble(), end: Offset.zero)
      .chain(CurveTween(curve: Curves.easeInOut))
      .animate(animation);

  return SlideTransition(
    position: position,
    child: SizedBox.expand(child: child),
  );
}

Widget _defaultTransitionOutBuilder(
  Widget child,
  Animation<double> animation,
  int sign,
  Axis scrollDirection,
) {
  final offset = scrollDirection == Axis.horizontal
      ? const Offset(1, 0)
      : const Offset(0, 1);

  final position = Tween(begin: Offset.zero, end: offset * sign.toDouble())
      .chain(CurveTween(curve: Curves.easeInOut))
      .animate(animation);

  return SlideTransition(
    position: position,
    child: SizedBox.expand(child: child),
  );
}
