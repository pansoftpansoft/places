import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/model/place.dart';

part 'list_places_state.freezed.dart';

@freezed
class ListPlacesState with _$ListPlacesState {


  bool get inLoad => maybeMap<bool>(
        orElse: () => false,
        inLoad: (_) => true,
      );

  const ListPlacesState._();

  // Идет загрузка
  const factory ListPlacesState.inLoad() = _InLoadListPlacesState;

  // Показ списка
  const factory ListPlacesState.show({required final List<Place> listPlaces}) =
      _ShowListPlacesState;

  // Ошибка
  const factory ListPlacesState.error() = _ErrorListPlacesState;
}
