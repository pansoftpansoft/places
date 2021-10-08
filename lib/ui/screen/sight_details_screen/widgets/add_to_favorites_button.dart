import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';

///Кнопка 'В избранное'
class AddToFavoritesButton extends StatelessWidget {
  ///Конструктор кнопки 'В избранное'
  const AddToFavoritesButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => TextButton(
        //Style: Theme.of(context).textButtonTheme.style,
        onPressed: () {
          if (kDebugMode) {
            print('Это кнопка "В избранное"');
          }
        },
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              SvgIcons.heartTransparent,
              height: 30,
              width: 30,
              color: Theme.of(context).textTheme.button!.color ?? Colors.red,
            ),
            const SizedBox(width: 10),
            Text(
              Labels.addToFavorites,
              style: Theme.of(context).textTheme.button,
            ),
          ],
        ),
      );
}
