import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/widgets/text_button_small.dart';

/// Кнопка 'В избранное'
class AddToFavoritesButton extends StatelessWidget {
  final Place _place;

  /// Конструктор кнопки 'В избранное'
  const AddToFavoritesButton(
    this._place, {
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButtonSmall(
      title:
          _place.isFavorites ? alreadyInFavoritesString : addToFavoritesString,
    );
  }
}
