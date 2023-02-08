import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

class ApplicationFormPage extends StatefulWidget {
  const ApplicationFormPage({super.key});

  @override
  State<ApplicationFormPage> createState() => _ApplicationFormPageState();
}

class _ApplicationFormPageState extends State<ApplicationFormPage> {
  final _formKey = GlobalKey<FormState>();

  final List<Widget> _dependentInputFields = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  static const _defaultFormSpacing = 24.0;

  @override
  Widget build(BuildContext context) {
    return DSFormScaffold(
      formKey: _formKey,
      padding: DSTheme.defaultPageMargin,
      appBar: AppBar(
        leading: DSBackButton(),
        title: Text('New Application'),
      ),
      bodyChildren: [
        DSFormSection(
          title: 'Basic Information',
          childrenSpacing: _defaultFormSpacing,
          children: [
            DSPhotoInput(
              hint: 'Your picture\n(liveliness check)',
              loading: false,
              onPressed: () {},
            ),
            DSTextInput(
              hintText: 'First name',
              validator: (value) {
                return null;
              },
            ),
            DSTextInput(
              hintText: 'Last name',
              validator: (value) {
                return null;
              },
            ),
          ],
        ),
        DSFormSection(
          title: 'Dependents information',
          childrenSpacing: 0.0,
          children: [
            const SizedBox(height: _defaultFormSpacing),
            // ..._dependentInputFields,
            AnimatedList(
              key: _listKey,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              initialItemCount: _dependentInputFields.length,
              itemBuilder: (context, index, animation) {
                return _buildItem(_dependentInputFields[index], animation);
              },
            ),
            DSOutlinedButton(
              text: 'add dependent',
              onPressed: () {
                _insertSingleItem();
                // setState(() {
                //   _dependentInputFields.add(
                //     DSTextInput(
                //       hintText: 'Last name',
                //       validator: (value) {
                //         return null;
                //       },
                //     ),
                //   );
                // });

                // DSDecisionBottomSheet.present(
                //   context,
                //   headerTitle: 'Are you sure you want to remove John Doe?',
                //   message: 'This action is irreversible.',
                //   onConfirm: () {
                //     print('confirmed');
                //   },
                //   confirmationText: 'remove',
                // );
              },
            ),
            const SizedBox(height: 120.0),
          ],
        ),
      ],
      floatingButton: DSElevatedButton(
        width: double.infinity,
        onPressed: () {},
        text: 'submit application',
      ),
    );
  }

  Widget _buildItem(Widget field, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: field,
    );
  }

  void _insertSingleItem() {
    int insertIndex = _dependentInputFields.length;

    final key = ValueKey(insertIndex);
    final newField = DSTextInput(
      key: key,
      margin: const EdgeInsets.only(bottom: _defaultFormSpacing),
      hintText: 'Dependent Fullname',
      onRemove: () {
        final index = _dependentInputFields.indexWhere(
          (element) => element.key == key,
        );
        _removeField(index);
      },
      validator: (value) {
        return null;
      },
    );

    _dependentInputFields.add(newField);
    _listKey.currentState?.insertItem(insertIndex);
  }

  void _removeField(int index) {
    final removedItem = _dependentInputFields.removeAt(index);
    _listKey.currentState?.removeItem(index, (_, animation) {
      return _buildItem(removedItem, animation);
    });
  }
}
