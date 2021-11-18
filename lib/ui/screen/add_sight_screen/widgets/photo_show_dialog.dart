import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/alert_dialog_cancel_button.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/photo_show_dialog_menu_%20Item.dart';

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
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: paddingPage),
              decoration: const BoxDecoration(
                color: ColorPalette.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(borderRadiusCard)),
              ),
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
}
