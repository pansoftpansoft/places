import 'package:mobx/mobx.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';

part 'list_places_store.g.dart';

//flutter packages pub run build_runner build

class ListPlacesStore = ListPlacesStoreBase with _$ListPlacesStore;

abstract class  ListPlacesStoreBase with Store{
   final PlaceRepository _placeRepository;

   @observable
   ObservableFuture<List<Place>>? getListPlaceFuture;


   ListPlacesStoreBase(this._placeRepository);

   @action
   void getListPlace () {
      final future = _placeRepository.getPlacesRepository();
      getListPlaceFuture = ObservableFuture(future);
   } 

}
