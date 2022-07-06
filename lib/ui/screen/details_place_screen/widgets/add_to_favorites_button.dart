import 'package:flutter/material.dart';
import 'package:places/data/interactor/details_place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/labels.dart';
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
    context.read<DetailsPlaceInteractor>().openStream();

    return StreamBuilder(
      stream:
          context.read<DetailsPlaceInteractor>().streamControllerDetailsPlace.stream,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          context
              .read<DetailsPlaceInteractor>()
              .streamControllerDetailsPlace
              .sink
              .add(
                context
                    .read<DetailsPlaceInteractor>()
                    .iconList[_place.isFavorites ? 1 : 0],
              );
        }

        return TextButtonSmall(
          title: _place.isFavorites
              ? alreadyInFavoritesString
              : addToFavoritesString,
          onPressed: () {
            context.read<DetailsPlaceInteractor>().onPressed(
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
