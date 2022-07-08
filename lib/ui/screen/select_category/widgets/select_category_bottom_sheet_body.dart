import 'package:flutter/material.dart';
import 'package:places/data/interactor/add_place_interactor.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/widgets/elevated_button_green_big.dart';
import 'package:provider/provider.dart';

class SelectCategoryBottomSheetBody extends StatelessWidget {
  const SelectCategoryBottomSheetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(height: 48),
      child: Consumer<AddPlaceInteractor>(
        builder: (
          final context,
          final place,
          final child,
        ) =>
            ElevatedButtonGreenBig(
          title: save,
          onPressed: context.read<AddPlaceInteractor>().selectTypePlace != null
              ? () {
                  _onPressed(context);
                }
              : null,
        ),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    if (context.read<AddPlaceInteractor>().selectTypePlace != null) {
      _navigator(context);
    }
  }

  void _navigator(BuildContext context) {
    Navigator.pop(
      context,
      context.read<AddPlaceInteractor>().selectTypePlace,
    );
  }
}
