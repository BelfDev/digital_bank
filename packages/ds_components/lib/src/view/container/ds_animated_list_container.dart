import 'package:flutter/material.dart';

class DSAnimatedListItemContainer extends StatelessWidget {
  const DSAnimatedListItemContainer({
    super.key,
    required this.child,
    required this.animation,
  });

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: SizeTransition(
        sizeFactor: animation,
        child: child,
      ),
    );
  }
}
