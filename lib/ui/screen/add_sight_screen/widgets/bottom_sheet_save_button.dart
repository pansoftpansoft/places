import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/bottom_sheet_save_button_body.dart';

///
class BottomSheetSaveButton extends StatelessWidget {
  ///
  const BottomSheetSaveButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingPage,
          vertical: paddingPage / 2,
        ),
        child: BottomSheetSaveButtonBody(),
      );
}
