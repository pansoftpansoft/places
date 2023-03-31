import 'package:flutter/foundation.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository_moor.dart';

///Модель для добавления фотографий в карточку места
class AddPlaceInteractor {
  /// Первое значение бронируем,
  /// так как это будет кнопка "Добавить", которую удалять нельзя

  PlaceRepositoryMoor placeRepository;

  AddPlaceInteractor(this.placeRepository);

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
