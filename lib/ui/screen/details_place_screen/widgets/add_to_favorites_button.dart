import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/details_place_screen/models/details_place_model.dart';
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
  Widget build(final BuildContext context) {
    debugPrint(
      'DetailsPlaceModel.streamController.isClosed = ${DetailsPlaceModel.streamController.isClosed}',
    );

    DetailsPlaceModel.openStream();

    return StreamBuilder(
      stream: DetailsPlaceModel.streamController.stream,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          DetailsPlaceModel.streamController.sink.add(
            DetailsPlaceModel.iconList[_place.isFavorites ? 1 : 0],
          );
        }

        return TextButtonSmall(
          title: _place.isFavorites
              ? alreadyInFavoritesString
              : addToFavoritesString,
          onPressed: () {
            DetailsPlaceModel.onPressed(
              _place,
              context,
            );
          },
          svgIconNamePrefix: snapshot.data.toString(),
        );
      },
    );
  }
}
