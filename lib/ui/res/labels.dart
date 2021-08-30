import '../../mocks.dart';

class Labels {
  static const String buildRoute = 'ПОСТРОИТЬ МАРШРУТ';
  static const String schedule = 'Запланировать';
  static const String addToFavorites = 'В избранное';
  static const String checkFavorites = 'Избранное';
  static const String shortDescription = 'краткое описание';
  static const String iWantToVisit = 'Хочу посетить';
  static const String visited = 'Посетил';
  static const String emptyList = 'Пусто';
  static const String checkPlace = 'Отмечайте понравившиеся\n'
      'места и они появиятся здесь.';
  static const String completeRoute = 'Завершите маршрут,\n'
      'чтобы место попало сюда.';
  static const String categories = 'КАТЕГОРИИ';
  static const String category = 'Категория';
  static const String notSelected = 'Не выбрано';
  static const String distance = 'Расстояние';
  static const String from = 'от';
  static const String to = 'до';
  static const String meters = 'метров';
  static const String show = 'ПОКАЗАТЬ';
  static const String clear = 'Очистить';
  static const String hotel = 'Отель';
  static const String restaurant = 'Ресторан';
  static const String particular_place = 'Особое место';
  static const String park = 'Парк';
  static const String museum = 'Музей';
  static const String cafe = 'Кафе';
  static const String dark_theme = 'Темная тема';
  static const String light_theme = 'Светлая тема';
  static const String settings = 'Настройки';
  static const String watchTutorial = 'Смотреть туториал';
  static const String cancel = 'Отмена';
  static const String newPlace = 'Новое место';
  static const String namePlace = 'НАЗВАНИЕ';
  static const String lat = 'ШИРОТА';
  static const String lon = 'ДОЛГОТА';
  static const String description = 'ОПИСАНИЕ';
  static const String specifyOnMap = 'Указать на карте';
  static const String create = 'СОЗДАТЬ';
  static const String save = 'СОХРАНИТЬ';

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
      case TypePlace.particular_place:
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
    return '';
  }
}
