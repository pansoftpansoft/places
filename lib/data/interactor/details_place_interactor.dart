import 'dart:async';

import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository_moor.dart';
import 'package:places/ui/res/svg_icons.dart';

///Модель для DetailsPlaceModel
class DetailsPlaceInteractor {
  PlaceRepositoryMoor placeRepository;

  ///Индекс отображаемой фотографии
  int index = 0;

  List<String> iconList = <String>[
    SvgIcons.heartTransparent,
    SvgIcons.heartFull,
    SvgIcons.loaderSmall,
  ];

  Place? detailsPlace;

  DetailsPlaceInteractor(this.placeRepository);

  Future<Place?> getPlace(
    int placeId,
  ) async {
    detailsPlace = await placeRepository.getPlaceId(
      placeId,
    );

    return detailsPlace;
  }

  ///Изменнение положения индикатора
  void changeScrollIndicator(
    final int indexIndicator,
  ) {
    index = indexIndicator;
  }
}
