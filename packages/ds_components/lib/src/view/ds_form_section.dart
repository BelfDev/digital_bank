import 'package:flutter/material.dart';

class DSFormSection extends StatelessWidget {
  const DSFormSection({
    super.key,
    required this.title,
    required this.children,
    this.childrenSpacing = 24.0,
  });

  final String title;
  final List<Widget> children;
  final double childrenSpacing;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24.0),
        Text(
          title,
          style: styles.bodyLarge,
        ),
        ...children.expand(
          (child) => [
            SizedBox(height: childrenSpacing),
            child,
          ],
        ),
      ],
    );
  }
}