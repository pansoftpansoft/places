import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';

///Кнопка 'Заплонировать'
class ScheduleButton extends StatelessWidget {
  ///Конструктор кнопки 'Заплонировать'
  const ScheduleButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) =>
      TextButton(
        //style: Theme.of(context).textButtonTheme.style,
        onPressed: () {
          if (kDebugMode) {
            print('Это кнопка "Заплонировать"');
          }
        },
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              SvgIcons.schedule,
              height: 30,
              width: 30,
              color: Theme
                  .of(context)
                  .textTheme
                  .button!
                  .color ??
                  ColorPalette.greenColorLight,
            ),
            const SizedBox(width: 9),
            Text(
              Labels.schedule,
              style: Theme
                  .of(context)
                  .textTheme
                  .button,
            ),
          ],
        ),
      );
}