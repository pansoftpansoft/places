import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';

class AddPlaceScreenBodyButtonMap extends StatelessWidget {
  const AddPlaceScreenBodyButtonMap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        TextButton(
          style: ButtonStyle(
            alignment: Alignment.centerLeft,
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.zero,
            ),
          ),
          onPressed: () {
            debugPrint('Нажата кнопка "Указать на карте"');
          },
          child: Text(
            specifyOnMap,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontSize: 16,
                  color: ColorPalette.greenColor,
                ),
          ),
        ),
      ],
    );
  }
}
