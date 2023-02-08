import 'package:flutter/material.dart';

class DSFormScaffold extends StatelessWidget {
  const DSFormScaffold({
    super.key,
    this.appBar,
    required this.bodyChildren,
    required this.formKey,
    this.imageProvider,
    this.floatingButton,
    this.padding,
  });

  // A global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final GlobalKey<FormState> formKey;

  /// An app bar to display at the top of the scaffold.
  final PreferredSizeWidget? appBar;

  /// The primary content of the scaffold.
  final List<Widget> bodyChildren;

  /// The image to display.
  final ImageProvider? imageProvider;

  /// A button displayed floating above [body], aligned to the bottom center.
  final Widget? floatingButton;

  /// The amount of space by which to inset the body.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final effectiveButton = floatingButton != null
        ? Padding(padding: padding ?? EdgeInsets.zero, child: floatingButton!)
        : null;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: padding,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...bodyChildren,
              if (effectiveButton != null) const SizedBox(height: 48.0),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: effectiveButton,
    );
  }
}
