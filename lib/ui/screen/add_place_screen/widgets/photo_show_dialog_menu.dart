import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/add_place_screen/widgets/photo_show_dialog_menu_item.dart';

///Меню в диалоговом окне при добавлении фотографий
class PhotoShowDialogMenu extends StatelessWidget {
  ///Меню в диалоговом окне при добавлении фотографий
  const PhotoShowDialogMenu({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Container(
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
      );

  BoxDecoration _buildBoxDecoration(final BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).backgroundColor,
      borderRadius: const BorderRadius.all(Radius.circular(borderRadiusCard16)),
    );
  }
}
