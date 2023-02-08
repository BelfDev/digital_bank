import 'package:flutter/material.dart';

class DSImplicitFadeIn extends StatefulWidget {
  const DSImplicitFadeIn({
    required this.child,
    this.duration = const Duration(milliseconds: 240),
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Duration duration;

  @override
  State<DSImplicitFadeIn> createState() => _DSImplicitFadeInState();
}

class _DSImplicitFadeInState extends State<DSImplicitFadeIn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInToLinear,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
