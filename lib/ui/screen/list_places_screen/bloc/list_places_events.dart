import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_places_events.freezed.dart';

@freezed
class ListPlacesEvents with _$ListPlacesEvents {
  const ListPlacesEvents._();

  const factory ListPlacesEvents.load() = _LoadListPlacesEvents;

  const factory ListPlacesEvents.isLoad() = _IsLoadListPlacesEvents;

  const factory ListPlacesEvents.select() = _SelectListPlacesEvents;

  const factory ListPlacesEvents.update() = _UpdateListPlacesEvents;
}
