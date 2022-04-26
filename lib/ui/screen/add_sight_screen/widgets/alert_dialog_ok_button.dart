import 'package:flutter/material.dart';
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
          top: paddingPage_2,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            height: heightAlertDialog,
          ),
          child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  okTexe.toUpperCase(),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
}
