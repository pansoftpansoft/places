import '../../mocks.dart';

/*
Текстовые константы
*/
class Labels {
  static const String addToFavorites = 'В избранное';
  static const String addPlacesYouFoundYourself =
      'Добавляй места,\nкоторые нашёл сам';
  static const String buildRoute = 'ПОСТРОИТЬ МАРШРУТ';
  static const String buildRouteAndRoad =
      'Построй маршрут\nи отправляйся в путь';
  static const String cafe = 'Кафе';
  static const String cancel = 'Отмена';
  static const String categories = 'КАТЕГОРИИ';
  static const String category = 'Категория';
  static const String checkFavorites = 'Избранное';
  static const String checkPlace = 'Отмечайте понравившиеся\n'
      'места и они появиятся здесь.';
  static const String clear = 'Очистить';
  static const String clearHistory = 'Очистить историю';
  static const String completeRoute = 'Завершите маршрут,\n'
      'чтобы место попало сюда.';
  static const String create = 'СОЗДАТЬ';
  static const String dark_theme = 'Темная тема';
  static const String dataLoadingError = 'Ошибка загрузки данных';
  static const String description = 'ОПИСАНИЕ';
  static const String distance = 'Расстояние';
  static const String emptyList = 'Пусто';
  static const String from = 'от';
  static const String iWantToVisit = 'Хочу посетить';
  static const String hotel = 'Отель';
  static const String onStart = 'На старт';
  static const String particular_place = 'Особое место';
  static const String park = 'Парк';
  static const String reachGoalQuicklyComfortablyPossible =
      'Достигай цели максимально\nбыстро и комфортно.';
  static const String lat = 'ШИРОТА';
  static const String light_theme = 'Светлая тема';
  static const String lookNewLocations =
      'Ищи новые локации\nи сохраняй самые любимые.';
  static const String lon = 'ДОЛГОТА';
  static const String museum = 'Музей';
  static const String meters = 'метров';
  static const String newPlace = 'Новое место';
  static const String namePlace = 'НАЗВАНИЕ';
  static const String notSelected = 'Не выбрано';
  static const String nothingWasFound = 'Ничего не найдено!';
  static const String restaurant = 'Ресторан';
  static const String specifyOnMap = 'Указать на карте';
  static const String save = 'СОХРАНИТЬ';
  static const String schedule = 'Запланировать';
  static const String search = 'Поиск';
  static const String settings = 'Настройки';
  static const String shareMostInterestingOnes =
      'Делись самыми интересными\nи помоги нам стать лучше!';
  static const String shortDescription = 'краткое описание';
  static const String show = 'ПОКАЗАТЬ';
  static const String skip = 'Пропустить';
  static const String to = 'до';
  static const String tryAgain = 'Попробуйте еще раз!';
  static const String tryChangingTheSearchParameter =
      'Попробуйте изменить\n параметры поиска!';
  static const String visited = 'Посетил';
  static const String unknownError = 'Неизвестная ошибка';
  static const String youLooking = 'ВЫ ИСКАЛИ';
  static const String watchTutorial = 'Смотреть туториал';
  static const String welcomeToTheTravelGuide =
      'Добро пожаловать\nв Путеводитель';

  static String TypePlaceString(TypePlace enumString) {
    switch (enumString) {
      case TypePlace.hotel:
        {
          return (hotel);
        }
      case TypePlace.restaurant:
        {
          return (restaurant);
        }
      case TypePlace.particularPlace:
        {
          return (particular_place);
        }
      case TypePlace.park:
        {
          return (park);
        }
      case TypePlace.museum:
        {
          return (museum);
        }
      case TypePlace.cafe:
        {
          return (cafe);
        }
    }
  }
}
