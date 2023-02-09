import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

mixin DynamicDependentListMixin<T extends StatefulWidget> on State<T> {
  final List<String> dependents = [];
  final GlobalKey<AnimatedListState> listKey = GlobalKey();

  Widget buildDependentTextInputItem(
    String dependent,
    int index,
    Animation<double> animation,
    FormFieldValidator<String>? validator,
  ) {
    return DSAnimatedListItemContainer(
      key: ValueKey(dependent),
      animation: animation,
      child: DSTextInput(
        initialValue: dependent,
        hintText: 'Dependent Fullname',
        textInputAction: TextInputAction.done,
        onChanged: (dependentName) {
          dependents[index] = dependentName;
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

    DSDecisionBottomSheet.present(
      context,
      headerTitle:
          '${'Are you sure you want to remove ${dependents[index]}'.trim()}?',
      message: 'This action is irreversible.',
      onConfirm: () {
        _removeItem(index);
      },
      confirmationText: 'remove',
    );
  }

  void _removeItem(int index) {
    final dependent = dependents.removeAt(index);
    listKey.currentState?.removeItem(index, (_, animation) {
      return buildDependentTextInputItem(dependent, index, animation, null);
    });
  }
}
