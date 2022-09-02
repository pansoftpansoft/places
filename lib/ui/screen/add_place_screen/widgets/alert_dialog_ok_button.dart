import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/widgets/elevated_button_green_big.dart';

///Диалог придупреждения при нажатии кнопки отмена
class AlertDialogOkButton extends StatelessWidget {
  static double heightAlertDialog = 48;

  ///Диалог  при нажатии кнопки Ok
  const AlertDialogOkButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: paddingPage_2,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            height: heightAlertDialog,
          ),
          child: ElevatedButtonGreenBig(
            title: okText.toUpperCase(),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
}
