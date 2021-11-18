import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';

///Диалог придупреждения при нажатии кнопки отмена
class AlertDialogCancelButton extends StatelessWidget {
  ///Диалог придупреждения при нажатии кнопки отмена
  const AlertDialogCancelButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: paddingPage,
          vertical: paddingPage / 2,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(height: 48),
          child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              elevation: MaterialStateProperty.all(0),
              backgroundColor:
                  MaterialStateProperty.all<Color>(ColorPalette.dmBasicColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      borderRadiusCard,
                    ),
                  ),
                ),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  cancel.toUpperCase(),
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: ColorPalette.greenColor,
                      ),
                ),
              ],
            ),
          ),
        ),
      );
}
