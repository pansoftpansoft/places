import 'package:places/mocks.dart';

///Текстовые константы
const String addToFavorites = 'В избранное';
const String addPlacesYouFoundYourself = 'Добавляй места,\nкоторые нашёл сам';
const String buildRoute = 'ПОСТРОИТЬ МАРШРУТ';
const String buildRouteAndRoad = 'Построй маршрут\nи отправляйся в путь';
const String cafe = 'Кафе';
const String camera = 'Камера';
const String cancel = 'Отмена';
const String categories = 'КАТЕГОРИИ';
const String category = 'Категория';
const String checkFavorites = 'Избранное';
const String checkPlace = 'Отмечайте понравившиеся\n'
    'места и они появиятся здесь.';
const String clear = 'Очистить';
const String clearHistory = 'Очистить историю';
const String completeRoute = 'Завершите маршрут,\n'
    'чтобы место попало сюда.';
const String create = 'СОЗДАТЬ';
const String darkTheme = 'Темная тема';
const String dataLoadingError = 'Ошибка загрузки данных';
const String description = 'ОПИСАНИЕ';
const String distance = 'Расстояние';
const String emptyList = 'Пусто';
const String fail = 'Файл';
const String from = 'от';
const String iWantToVisit = 'Хочу посетить';
const String hotel = 'Отель';
const String onStart = 'На старт';
const String particularPlace = 'Особое место';
const String park = 'Парк';
const String photo = 'Фотография';
const String reachGoalQuicklyComfortablyPossible =
    'Достигай цели максимально\nбыстро и комфортно.';
const String lat = 'ШИРОТА';
const String lightTheme = 'Светлая тема';
const String listInterestingPlaces = 'Список интересных мест';
const String listInterestingPlacesTwoLine = 'Список\nинтересных мест';
const String lookNewLocations = 'Ищи новые локации\nи сохраняй самые любимые.';
const String lon = 'ДОЛГОТА';
const String museum = 'Музей';
const String meters = 'метров';
const String newPlace = 'Новое место';
const String namePlace = 'НАЗВАНИЕ';
const String notSelected = 'Не выбрано';
const String nothingWasFound = 'Ничего не найдено!';
const String restaurant = 'Ресторан';
const String specifyOnMap = 'Указать на карте';
const String save = 'СОХРАНИТЬ';
const String schedule = 'Запланировать';
const String search = 'Поиск';
const String settings = 'Настройки';
const String shareMostInterestingOnes =
    'Делись самыми интересными\nи помоги нам стать лучше!';
const String shortDescription = 'краткое описание';
const String show = 'ПОКАЗАТЬ';
const String skip = 'Пропустить';
const String to = 'до';
const String tryAgain = 'Попробуйте еще раз!';
const String tryChangingTheSearchParameter =
    'Попробуйте изменить\n параметры поиска!';
const String visited = 'Посетил';
const String unknownError = 'Неизвестная ошибка';
const String youLooking = 'ВЫ ИСКАЛИ';
const String watchTutorial = 'Смотреть туториал';
const String welcomeToTheTravelGuide = 'Добро пожаловать\nв Путеводитель';

String typePlaceString(final TypePlace enumString) {
  switch (enumString) {
    case TypePlace.hotel:
      {
        return hotel;
      }
    case TypePlace.restaurant:
      {
        return restaurant;
      }
    case TypePlace.particularPlace:
      {
        return particularPlace;
      }
    case TypePlace.park:
      {
        return park;
      }
    case TypePlace.museum:
      {
        return museum;
      }
    case TypePlace.cafe:
      {
        return cafe;
      }
  }
}
