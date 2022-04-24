import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';

///Диалог придупреждения при нажатии кнопки отмена
class AlertDialogOkButton extends StatelessWidget {
  static double heightAlertDialog = 48;

  ///Диалог придупреждения при нажатии кнопки отмена
  const AlertDialogOkButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: paddingPage / 2,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            height: heightAlertDialog,
          ),
          child: ElevatedButton(
            style: _buildButtonStyle(),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  okTexe.toUpperCase(),
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: ColorPalette.greenColor,
                      ),
                ),
              ],
            ),
          ),
        ),
      );

  ButtonStyle _buildButtonStyle() {
    return ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      elevation: MaterialStateProperty.all(0),
      backgroundColor:
          MaterialStateProperty.all<Color>(ColorPalette.dmBasicColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              borderRadiusCard16,
            ),
          ),
        ),
      ),
    );
  }
}
