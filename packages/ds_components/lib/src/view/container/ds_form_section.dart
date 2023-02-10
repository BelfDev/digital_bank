import 'package:flutter/material.dart';

class DSFormSection extends StatelessWidget {
  const DSFormSection({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: styles.bodyLarge,
        ),
        const SizedBox(height: 24.0),
        ...children,
      ],
    );
  }
}
