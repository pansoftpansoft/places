import 'package:places/data/model/place.dart';

abstract class SearchPlacesScreenActions {}

///Начать поиск
class StartFindAction extends SearchPlacesScreenActions {
  final String findString;

  StartFindAction(this.findString);
}

///Поиск завершен, возвращаем результат
class ResultFindAction extends SearchPlacesScreenActions {
  final List<Place> mocksSearchText;

  ResultFindAction(this.mocksSearchText);
}

class ShowEmptyScreeAction extends SearchPlacesScreenActions {
  ShowEmptyScreeAction();
}

class ListFoundPlacesAction extends SearchPlacesScreenActions {
  ListFoundPlacesAction();
}
class OpenSearchPlacesScreenAction extends SearchPlacesScreenActions {
  OpenSearchPlacesScreenAction();
}

class ShowCleanScreeAction extends SearchPlacesScreenActions {
  ShowCleanScreeAction();
}

class ShowHistoryListScreeAction extends SearchPlacesScreenActions {
  ShowHistoryListScreeAction();
}


class NotResultFindAction extends SearchPlacesScreenActions {
  NotResultFindAction();
}
