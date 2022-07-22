import 'package:places/data/model/place.dart';

/// Базовое состояние профиля
abstract class SearchPlacesScreenStates {}

/// Начальное состояние
class SearchPlacesScreenInitialState extends SearchPlacesScreenStates {}

class EmptySearchPlacesScreenState extends SearchPlacesScreenStates {}

class ShowCleanScreeState extends SearchPlacesScreenStates {}

class ShowNotFindScreeState extends SearchPlacesScreenStates {}

class ShowHistoryListScreeState extends SearchPlacesScreenStates {}

///Начать поиск
class LoadSearchPlacesScreenState extends SearchPlacesScreenStates {
  LoadSearchPlacesScreenState();
}

///Поиск завершен, возвращаем результат
class ListFoundSearchPlacesScreenStates extends SearchPlacesScreenStates {
  ListFoundSearchPlacesScreenStates();
}
