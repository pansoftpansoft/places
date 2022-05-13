import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/widgets/text_button_small.dart';

///Кнопка 'В избранное'
class AddToFavoritesButton extends StatelessWidget {
  final Place _place;

  ///Конструктор кнопки 'В избранное'
  const AddToFavoritesButton(
    this._place, {
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => TextButtonSmall(
        title: addToFavoritesString,
        onPressed: () {
          _place.isFavorites = _place.isFavorites ?? false ? true : false;
          debugPrint('Это кнопка "В избранное"');
        },
        svgIconNamePrefix: SvgIcons.heartTransparent,
      );
}
