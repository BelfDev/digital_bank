import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

class DSBottomSheetScaffold extends StatelessWidget {
  const DSBottomSheetScaffold({
    super.key,
    required this.body,
    this.header,
    this.footer,
    this.padding = const EdgeInsets.symmetric(
      vertical: 12.0,
      horizontal: 24.0,
    ),
    this.margin,
    this.borderRadius = DSTheme.bottomSheetBorderRadius,
    this.constraints = const BoxConstraints(minHeight: 200),
  });

  final Widget? body;
  final Widget? header;
  final Widget? footer;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;

  /// The additional constraints to impose on the body.
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: SafeArea(
        child: Padding(
          padding: margin ?? EdgeInsets.zero,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (header != null) header!,
              if (body != null)
                Flexible(
                  child: SingleChildScrollView(
                    padding: padding,
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    child: body,
                  ),
                ),
              if (footer != null) footer!,
            ],
          ),
        ),
      ),
    );
  }
}
