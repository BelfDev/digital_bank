import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

mixin DynamicDependentListMixin<T extends StatefulWidget> on State<T> {
  final List<String> dependents = [];
  final GlobalKey<AnimatedListState> listKey = GlobalKey();

  Widget buildDependentTextInputItem(
    String dependent,
    int index,
    Animation<double> animation,
    DSFormFieldValidator<String>? validator,
  ) {
    return DSAnimatedListItemContainer(
      key: ValueKey(dependent),
      animation: animation,
      child: DSTextInput(
        initialValue: dependent,
        hintText: context.l10n.dependentFullNameInputHint,
        textInputAction: TextInputAction.done,
        onChanged: (dependentName) {
          dependents[index] = dependentName.trim();
        },
        onRemove: () => _onRemoveItem(index),
        validator: validator,
      ),
    );
  }

  void spawnDependentTextInput() {
    int insertIndex = dependents.length;
    dependents.add('');
    listKey.currentState?.insertItem(insertIndex);
  }

  void _onRemoveItem(int index) {
    if (dependents[index].isEmpty) {
      _removeItem(index);
      return;
    }

    final l10n = L10n.of(context);

    DSDecisionBottomSheet.present(
      context,
      headerTitle: l10n.applicationFormDecisionBottomSheetTitle,
      message: l10n.applicationFormDecisionBottomSheetMessage,
      onConfirm: () {
        _removeItem(index);
      },
      confirmationText: l10n.decisionBottomSheetRemoveButton,
      cancellationText: l10n.decisionBottomSheetCancelButton,
    );
  }

  void _removeItem(int index) {
    final dependent = dependents.removeAt(index);
    listKey.currentState?.removeItem(index, (_, animation) {
      return buildDependentTextInputItem(dependent, index, animation, null);
    });
  }
}
