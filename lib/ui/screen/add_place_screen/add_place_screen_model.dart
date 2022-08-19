import 'package:elementary/elementary.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/screen/add_place_screen/add_place_screen.dart';

/// Model for [AddPlaceScreen]

class AddPlaceScreenModel extends ElementaryModel {
  final PlaceInteractor _placeInteractor;


  AddPlaceScreenModel(
    this._placeInteractor,
    ErrorHandler errorHandler,

  ) : super(errorHandler: errorHandler);

  /// Отправить новаое место на сервер
  Future<Place> postPlace(Place place) async {
    try {
      final res = await _placeInteractor.postPlace(place);

      return res!;
    } on Exception catch (e) {
      handleError(e);
      rethrow;
    }
  }
}
