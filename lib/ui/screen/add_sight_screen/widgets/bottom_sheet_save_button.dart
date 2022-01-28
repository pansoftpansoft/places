import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/bottom_sheet_save_button_body.dart';
import 'package:provider/provider.dart';

///
class BottomSheetSaveButton extends StatelessWidget {
  ///
  const BottomSheetSaveButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: paddingPage,
          vertical: paddingPage / 2,
        ),
        child: Consumer<AddSightModel>(
          builder: (
            final context,
            final sight,
            final child,
          ) =>
              const BottomSheetSaveButtonBody(),
        ),
      );
}
