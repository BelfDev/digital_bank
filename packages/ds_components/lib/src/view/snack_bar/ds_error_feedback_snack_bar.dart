import 'package:flutter/material.dart';

import '../../../ds_components.dart';

class DSErrorFeedbackSnackBar {
  const DSErrorFeedbackSnackBar._();

  /// Shows  a [DSErrorFeedbackSnackBar] across all registered [Scaffold]s.
  ///
  /// A scaffold can show at most one snack bar at a time. If this function is
  /// called while another snack bar is already visible, the given snack bar
  /// will be added to a queue and displayed after the earlier snack bars have
  /// closed.
  static Future<void> present(
    BuildContext context, {
    required String errorFeedback,
    Duration duration = const Duration(milliseconds: 4000),
  }) async {
    final styles = Theme.of(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: duration,
        content: Text(
          errorFeedback,
          style: styles.textTheme.bodyMedium?.copyWith(
            color: DSColors.white,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        backgroundColor: DSColors.pink,
        padding: const EdgeInsets.all(24.0),
      ),
    );
  }
}
