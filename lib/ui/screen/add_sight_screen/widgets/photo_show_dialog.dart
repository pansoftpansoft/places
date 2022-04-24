import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/alert_dialog_cancel_button.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/photo_show_dialog_menu_Item.dart';

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
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingPage / 2,
                vertical: paddingPage,
              ),
              decoration: _buildBoxDecoration(context),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingPage),
                child: Column(
                  children: const <Widget>[
                    PhotoShowDialogMenuItem(SvgIcons.camera, camera),
                    Divider(height: 0),
                    PhotoShowDialogMenuItem(SvgIcons.photo, photo),
                    Divider(height: 0),
                    PhotoShowDialogMenuItem(SvgIcons.fail, fail),
                  ],
                ),
              ),
            ),
            const AlertDialogCancelButton(),
          ],
        ),
      );

  BoxDecoration _buildBoxDecoration(final BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).backgroundColor,
      borderRadius: const BorderRadius.all(Radius.circular(borderRadiusCard16)),
    );
  }
}
