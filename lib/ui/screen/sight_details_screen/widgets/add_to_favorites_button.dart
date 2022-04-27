import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/widgets/text_button_small.dart';

///Кнопка 'В избранное'
class AddToFavoritesButton extends StatelessWidget {
  ///Конструктор кнопки 'В избранное'
  const AddToFavoritesButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => TextButtonSmall(
        title: addToFavorites,
        onPressed: () {
          debugPrint('Это кнопка "В избранное"');
        },
        svgIconNamePrefix: SvgIcons.heartTransparent,
      );
}
