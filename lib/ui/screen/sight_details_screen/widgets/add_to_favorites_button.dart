import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/sight_details_screen/models/sight_details_model.dart';
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
  Widget build(final BuildContext context) => Consumer<SightDetailsModel>(
        builder: (
          final context,
          final sightDetailsModel,
          final child,
        ) =>
            TextButtonSmall(
          title: addToFavoritesString,
          onPressed: () {
            _onPressed(
              _place,
              context,
            );
          },
          svgIconNamePrefix: _place.isFavorites
              ? SvgIcons.heartFull
              : SvgIcons.heartTransparent,
        ),
      );

  void _onPressed(Place place, BuildContext context) {
    debugPrint('place.isFavorites ${place.isFavorites.toString()}');

    if (place.isFavorites) {
      place.isFavorites = false;
      PlaceInteractor.setFavorites(place);
      debugPrint('Это кнопка "В избранное" remove');

    } else {
      place.isFavorites = true;
      PlaceInteractor.setFavorites(place);
      debugPrint('Это кнопка "В избранное" add');

    }
    context.read<SightDetailsModel>().updateScreen();
  }
}
