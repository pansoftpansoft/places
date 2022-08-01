import 'package:elementary/elementary.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/place_dto.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/ui/screen/add_place_screen/add_place_screen.dart';

/// Model for [AddPlaceScreen]

class AddPlaceScreenModel extends ElementaryModel {
  final PlaceRepository _placeRepository;
  final Place _place;

  AddPlaceScreenModel(
    this._placeRepository,
    ErrorHandler errorHandler,
    this._place,
  ) : super(errorHandler: errorHandler);

  /// Отправить новаое место на сервер
  Future<PlaceDto> postPlace() async {
    try {
      final res = await _placeRepository.postPlace(_place);

      return res ?? PlaceDto(name: '', placeType: '');
    } on Exception catch (e) {
      handleError(e);
      rethrow;
    }
  }
}
