import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

import 'ds_bottom_sheet_header.dart';
import 'ds_bottom_sheet_scaffold.dart';

class DSDecisionBottomSheet extends StatelessWidget {
  const DSDecisionBottomSheet({
    required this.headerTitle,
    required this.message,
    required this.onConfirm,
    required this.confirmationText,
    required this.cancellationText,
    this.onCancel,
    Key? key,
  }) : super(key: key);

  final String headerTitle;
  final String? message;
  final VoidCallback? onConfirm;
  final String confirmationText;
  final String cancellationText;
  final VoidCallback? onCancel;

  /// Push [DecisionBottomSheet] as a modal bottom sheet.
  static Future<bool> present(
    BuildContext context, {
    required String headerTitle,
    required String? message,
    required VoidCallback? onConfirm,
    required String confirmationText,
    required String cancellationText,
    String? cancelText,
    VoidCallback? onCancel,
  }) async {
    final result = await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: DSTheme.bottomSheetBorderRadius,
      ),
      builder: (context) {
        return DSDecisionBottomSheet(
          headerTitle: headerTitle,
          message: message,
          onConfirm: onConfirm,
          confirmationText: confirmationText,
          onCancel: onCancel,
          cancellationText: cancellationText,
        );
      },
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return DSBottomSheetScaffold(
      header: DSBottomSheetHeader(
        title: headerTitle,
        subtitle: message,
      ),
      body: null,
      footer: _DecisionBottomSheetFooter(
        onConfirm: onConfirm,
        confirmationText: confirmationText,
        cancellationText: cancellationText,
        onCancel: () {
          Navigator.of(context).maybePop(false);
        },
      ),
    );
  }
}

class _DecisionBottomSheetFooter extends StatelessWidget {
  const _DecisionBottomSheetFooter({
    required this.onConfirm,
    required this.onCancel,
    required this.confirmationText,
    required this.cancellationText,
  });

  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final String confirmationText;
  final String cancellationText;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onCancel,
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: styles.colorScheme.secondary,
                ),
                backgroundColor: DSColors.transparent,
                foregroundColor: styles.colorScheme.secondary,
              ),
              child: Text(cancellationText),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).maybePop(true);
                onConfirm?.call();
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: DSColors.pink,
              ),
              child: Text(confirmationText),
            ),
          ),
        ],
      ),
    );
  }
}
