import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/add_place_screen/models/add_place_model.dart';
import 'package:places/ui/screen/widgets/elevated_button_green_big.dart';
import 'package:provider/provider.dart';

class SelectCategoryBottomSheetBody extends StatelessWidget {
  const SelectCategoryBottomSheetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(height: 48),
      child: Consumer<AddPlaceModel>(
        builder: (
          final context,
          final place,
          final child,
        ) =>
            ElevatedButtonGreenBig(
          title: save,
          onPressed: context.read<AddPlaceModel>().selectTypePlace != null
              ? () {
                  _onPressed(context);
                }
              : null,
        ),
      ),
    );
  }

  void _onPressed(final BuildContext context) {
    if (context.read<AddPlaceModel>().selectTypePlace != null) {
      _navigator(context);
    }
  }

  void _navigator(final BuildContext context) {
    Navigator.pop(
      context,
      context.read<AddPlaceModel>().selectTypePlace,
    );
  }
}
