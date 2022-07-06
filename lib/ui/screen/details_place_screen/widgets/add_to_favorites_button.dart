import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/details_place_screen/models/details_place_model.dart';
import 'package:places/ui/screen/widgets/text_button_small.dart';
import 'package:provider/provider.dart';

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
    context.read<DetailsPlaceModel>().openStream();

    return StreamBuilder(
      stream:
          context.read<DetailsPlaceModel>().streamControllerDetailsPlace.stream,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          context
              .read<DetailsPlaceModel>()
              .streamControllerDetailsPlace
              .sink
              .add(
                context
                    .read<DetailsPlaceModel>()
                    .iconList[_place.isFavorites ? 1 : 0],
              );
        }

        return TextButtonSmall(
          title: _place.isFavorites
              ? alreadyInFavoritesString
              : addToFavoritesString,
          onPressed: () {
            context.read<DetailsPlaceModel>().onPressed(
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
