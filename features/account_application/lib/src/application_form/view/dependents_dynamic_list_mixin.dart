import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

mixin DynamicDependentListMixin<T extends StatefulWidget> on State<T> {
  final List<Widget> dependentInputFields = [];
  final GlobalKey<AnimatedListState> listKey = GlobalKey();

  Widget buildDependentTextInputItem(
    Widget field,
    Animation<double> animation,
  ) {
    return DSAnimatedListItemContainer(
      animation: animation,
      child: field,
    );
  }

  void spawnDependentTextInput() {
    int insertIndex = dependentInputFields.length;
    final newField = _buildDependentTextInput(insertIndex);
    dependentInputFields.add(newField);
    listKey.currentState?.insertItem(insertIndex);
  }

  void _removeItem(int index) {
    final removedItem = dependentInputFields.removeAt(index);
    listKey.currentState?.removeItem(index, (_, animation) {
      return buildDependentTextInputItem(removedItem, animation);
    });
  }

  Widget _buildDependentTextInput(int insertIndex) {
    final key = ValueKey(insertIndex);
    return DSTextInput(
      key: key,
      margin: const EdgeInsets.only(bottom: DSTheme.defaultFormSpacing),
      hintText: 'Dependent Fullname',
      onRemove: () {
        final removeIndex = dependentInputFields.indexWhere(
          (element) => element.key == key,
        );
        _removeItem(removeIndex);
      },
      validator: (value) {
        return null;
      },
    );
  }
}
