import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/filters_screen/model/filters_screen_model.dart';
import 'package:places/ui/screen/sight_details_screen/models/details_place_model.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
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
  Widget build(final BuildContext context) => Consumer<DetailsPlaceModel>(
        builder: (
          final context,
          final detailsPlaceModel,
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

  void updateContext(Place place, BuildContext context) {
     PlaceInteractor.setFavorites(place).then((value) {
       debugPrint('Обновление контекстов при нажатии кнопки Добавить в фавориты');
       context.read<DetailsPlaceModel>().updateScreen();
       context.read<VisitingModel>().updateScreen();
       context.read<FiltersScreenModel>().notifyListenersFiltersScreen();
     });
  }

  void _onPressed(Place place, BuildContext context) {
    debugPrint(
      'place.isFavorites ${place.isFavorites.toString()} '
      '${place.id}  ${place.visitedDate},',
    );

    updateContext( place,  context);

    // for (final item in mocks){
    //   debugPrint('place id = ${item.id}  '
    //       'isFavorites  = ${item.isFavorites}  '
    //       'wantVisitDate  = ${item.wantVisitDate}  '
    //       'visitedDate  = ${item.visitedDate}');
    // }
  }
}
