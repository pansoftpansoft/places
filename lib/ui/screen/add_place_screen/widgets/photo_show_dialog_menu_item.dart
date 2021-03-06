import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/sizes.dart';

///Пункт мену диалоговом окне при добавлении фотографий
class PhotoShowDialogMenuItem extends StatelessWidget {
  /// Название иконки
  final String svgIcons;

  /// Текст на кнопке пункта меню
  final String buttonText;

  ///Пункт мену диалоговом окне при добавлении фотографий
  const PhotoShowDialogMenuItem(
    this.svgIcons,
    this.buttonText, {
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          SvgPicture.asset(
            svgIcons,
            height: iconSize24,
            color: ColorPalette.lmFontSubtitle2,
          ),
          Expanded(
            child: TextButton(
              style: const ButtonStyle(
                alignment: Alignment.centerLeft,
              ),
              onPressed: () {
                debugPrint('Нажата кнопка из меню');
              },
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: 16,
                    ),
              ),
            ),
          ),
        ],
      );
}
