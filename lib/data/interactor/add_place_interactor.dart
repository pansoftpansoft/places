import 'package:flutter/foundation.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';

///Модель для добавления фотографий в карточку места
class AddPlaceInteractor extends ChangeNotifier {
  /// Первое значение бронируем,
  /// так как это будет кнопка "Добавить", которую удалять нельзя


  PlaceRepository placeRepository = PlaceRepository();
  ///Добавляем фотографию
  void addPhoto(
    String pathPhoto,
  ) {
    debugPrint('tempPhotoPlace.add $pathPhoto');
  }

  ///Удаляем фотографию
  void deletePhoto(int index) {
    if (index == 0) {
      return;
    } //Не удаляем кнопку добавить

  }
     Future<Place?> addPlace(Place place) async {
     final newPlace = await placeRepository.postPlace(place);

     return newPlace;
  }

}
