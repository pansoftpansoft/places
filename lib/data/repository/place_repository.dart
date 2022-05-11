import 'package:dio/dio.dart';
import 'package:places/data/connection_backend_server.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/url_path.dart';

class PlaceRepository {
  final ConnectionBackendServer _server = ConnectionBackendServer();

  /// Создать новое место на сервере
  Future<Response> postPlace(Place place) async {
    return _server.post(
      pathUrlCreatePlace,
      place.toJson().toString(),
    );
  }

  ///Получаем список мест
  Future<List<Place>> getPlace() async {
    return ((await _server.get(pathUrlListPlaces)).data as List)
        // ignore: avoid_annotating_with_dynamic
        .map<Place>((dynamic e) => Place.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Получить место по идентификатору
  Future<Place> getPlaceId(Place place) async {
    return Place.fromJson(
      await _server.get('$pathUrlListPlaces/${place.id.toString()}')
          as Map<String, dynamic>,
    );
  }

  /// Удалить место на сервере
  Future<Response> deletePlace(Place place) async {
    return _server.delete(
      '$pathUrlDeletePlace/${place.id.toString()}',
    );
  }

  /// Обновить данные о месте и олучить место по идентификатору
  Future<Place> putPlace(Place place) async {
    return Place.fromJson(
      await _server.get('$pathUrlPutPlace/${place.id.toString()}')
          as Map<String, dynamic>,
    );
  }
}
