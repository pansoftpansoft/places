import 'package:places/data/model/filter_set.dart';
import 'package:places/data/model/place.dart';

///
abstract class PlaceRepository<T> {
  /// получить место по id
  Future<T> getPlaceId(int id);

  /// добавить новое место
  Future<T?> postPlace(T place);

  /// Получить список всех мест
  Future<List<T>> getAllPlace();

  /// Получение списка отфильтрованных мест
  Future<List<T>> getPlacesRepository({
    FilterSet? filterSet,
    String? searchString,
  });

  /// Устанавливает и снимает признак фаворита
  Future<void> setIsFavorites(
    Place place,
  );

  /// Получть список мест которые хочу посетить
  Future<List<T>> getPlacesWantVisit();

  /// Установить признак месту 'хочу посетить'
  Future<void> setWantVisit(
    int id,
    int date,
  );

  /// Получть список мест которые хочу посетить
  Future<List<T>> getPlacesVisited(
    List<T> listAllPlaces,
  );

  /// Получть список мест которые хочу посетить
  Future<List<T>> setPlacesVisited(
    int id,
    int date,
  );

  /// удалить место
  Future<void> deletePlace(T place);
}
