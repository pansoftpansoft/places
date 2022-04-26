import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:provider/provider.dart';

class SelectCategoryBottomSheetBody extends StatelessWidget {
  const SelectCategoryBottomSheetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(height: 48),
      child: Consumer<AddSightModel>(
        builder: (
          final context,
          final sight,
          final child,
        ) =>
            ElevatedButton(
          onPressed: context.read<AddSightModel>().selectTypePlace != null
              ? () {
                  _onPressed(context);
                }
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                save,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed(final BuildContext context) {
    if (context.read<AddSightModel>().selectTypePlace != null) {
      _navigator(context);
    }
  }

  void _navigator(final BuildContext context) {
    Navigator.pop(
      context,
      context.read<AddSightModel>().selectTypePlace,
    );
  }
}
