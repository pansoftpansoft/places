import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_place_screen/widgets/alert_dialog_ok_button.dart';

class ShowAlertAdd extends StatelessWidget {
  ///Диалог выбора от куда загружать фотки
  const ShowAlertAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AlertDialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment: Alignment.center,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: paddingPage,
          vertical: paddingPage_2,
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingPage / 2,
                vertical: paddingPage,
              ),
              decoration: _buildBoxDecoration(context),
              width: MediaQuery.of(context).size.width,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingPage),
                child: Text(
                  newPlaceAdd,
                ),
              ),
            ),
            const AlertDialogOkButton(),
          ],
        ),
      );

  BoxDecoration _buildBoxDecoration(BuildContext context) {

    return BoxDecoration(
      color: Theme.of(context).backgroundColor,
      borderRadius: const BorderRadius.all(Radius.circular(borderRadiusCard16)),
    );
  }
}
