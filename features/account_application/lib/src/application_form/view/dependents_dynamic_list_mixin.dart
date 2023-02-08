import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

mixin DynamicDependentListMixin<T extends StatefulWidget> on State<T> {
  final List<String> dependents = [];
  final GlobalKey<AnimatedListState> listKey = GlobalKey();

  Widget buildDependentTextInputItem(
    String dependent,
    int index,
    Animation<double> animation,
  ) {
    return DSAnimatedListItemContainer(
      key: ValueKey(dependent),
      animation: animation,
      child: DSTextInput(
        margin: const EdgeInsets.only(bottom: DSTheme.defaultFormSpacing),
        initialValue: dependent,
        hintText: 'Dependent Fullname',
        onChanged: (dependentName) {
          dependents[index] = dependentName;
        },
        onRemove: () {
          _removeItem(index);
        },
        validator: (value) {
          return null;
        },
      ),
    );
  }

  void spawnDependentTextInput() {
    int insertIndex = dependents.length;
    dependents.add('');
    listKey.currentState?.insertItem(insertIndex);
  }

  void _removeItem(int index) {
    final dependent = dependents.removeAt(index);
    listKey.currentState?.removeItem(index, (_, animation) {
      return buildDependentTextInputItem(dependent, index, animation);
    });
  }
}
