import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_place_screen/widgets/alert_dialog_cancel_button.dart';
import 'package:places/ui/screen/add_place_screen/widgets/photo_show_dialog_menu.dart';

///Диалог выбора от куда загружать фотки
class PhotoShowDialog extends StatelessWidget {
  ///Диалог выбора от куда загружать фотки
  const PhotoShowDialog({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => AlertDialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment: Alignment.bottomCenter,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: paddingPage,
          vertical: paddingPage_2,
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            PhotoShowDialogMenu(),
            AlertDialogCancelButton(),
          ],
        ),
      );
}
