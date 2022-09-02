import 'package:places/data/model/place.dart';
import 'package:places/data/model/place_dto.dart';
import 'package:places/domain/onboarding_page.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';

///Mock
// enum TypePlace {
//   ///
//   hotel,
//
//   ///
//   restaurant,
//
//   ///
//   particularPlace,
//
//   ///
//   park,
//
//   ///
//   museum,
//
//   ///
//   cafe,
// }

///
enum ScreenEnum {
  ///Экран загрузки
  loadScreen,

  ///Список слов по которым производился поиск
  listSearchWords,

  ///Пустой экран
  emptyScreen,

  ///Список с найдеными местами
  listFoundPlacesScreen,

  ///Экран ошибки
  errorScreen,

  ///Чистый экран
  cleanScreen,
}

List<String> typePlace = <String>[
  'Hotel',
  'Ресторан',
  'Интересные места',
  'Парк',
  'Музей',
  'Кафе',
];

Map<String, bool> typePlaceSelectMap = <String, bool>{};

///Тестовые данные самая главная очередь
List<Place> mocks = <Place>[];
// Place(
//   id:1,
//   lat: 55.751426,
//   lon: 37.618879,
//   urls:['http://s1.fotokto.ru/photo/full/419/4190926.jpg'],
//   description: 'Ивановская площадь — площадь в Московском Кремле, одна из древнейших '
//       'площадей Москвы. Возникла после постройки в 1329 году каменной церкви '
//       'Иоанна Лествичника, «что под колоколы», которая разделила ранее '
//       'единую городскую площадь на две части. Её восточная часть '
//       'по Иоанновской церкви стала позднее именоваться Ивановской, '
//       'западная — Соборной площадью. В XIV—XV веках южную и восточную'
//       ' стороны площади занимали дворы удельных князей Московского дома.',
//   placeType: typePlaceString(TypePlace.park),
//   wantVisitDate: DateTime.now(),
//   visitedDate: DateTime.now().add(const Duration(hours: 80)),
//   name: 'Ивановская площадь',
// ),
// Place(
//   2,
//   55.752507,
//   37.62315,
//   'Собор Покрова Пресвятой Богородицы на Рву',
//   [
//     'https://i.pinimg.com/originals/e5/72/4d/e5724d58879e3057d02f384ddf6707c3.jpg',
//   ],
//   typePlaceString(TypePlace.park),
//   'Православный храм на Красной площади в Москве, памятник русской'
//       ' архитектуры. Строительство собора велось с 1555 по 1561 год. '
//       'Собор объединяет одиннадцать церквей, часть из которых освящена'
//       ' в честь святых, дни памяти которых пришлись'
//       ' на решающие бои за Казань.',
//   wantVisitDate: DateTime.now(),
//   //visitedDate: DateTime.now().add(const Duration(hours: 70)),
// ),
// Place(
//   3,
//   55.741392,
//   37.620522,
//   'Государственная Третьяковская галерея',
//   [
//     'https://avatars.mds.yandex.net/get-altay/223006/2a0000015b171765cf7ab0eaae8e1489f6f1/XXXL',
//   ],
//   typePlaceString(TypePlace.park),
//   'Историческое здание Третьяковской галереи по адресу Лаврушинский'
//       ' переулок, 10 расположено в комплексе строений, основой'
//       ' которого является особняк второй половины XVIII века.'
//       ' Семья Третьяковых приобрела этот дом в 1851 году.'
//       ' Начав в 1856 собирать картины русских художников,'
//       ' Павел Третьяков размещал их в жилых комнатах.',
//   wantVisitDate: DateTime.now(),
//   //visitedDate: DateTime.now().add(const Duration(hours: 60)),
// ),
// Place(
//   4,
//   55.729919,
//   37.601348,
//   'Центральный парк культуры и отдыха им. М. Горького',
//   [
//     'https://avatars.mds.yandex.net/get-altay/474904/2a0000015eb1b5f626ffa89658dde2b12a23/XXXL',
//   ],
//   typePlaceString(TypePlace.park),
//   'Парк культуры и отдыха.',
//   wantVisitDate: DateTime.now(),
// ),
// Place(
//   5,
//   55.763855,
//   37.592132,
//   'Патриаршие пруды',
//   [
//     'https://avatars.mds.yandex.net/get-altay/1001354/2a00000162874cd6ce152a8542931ecfe3ae/XXXL',
//   ],
//   typePlaceString(TypePlace.park),
//   'Общее название местности, расположенной в Пресненском районе'
//       ' Центрального административного округа города'
//       ' Москвы, куда входят пруд, сквер и микрорайон.',
//   wantVisitDate: DateTime.now(),
// ),
//];

/// Очередь для главного экрана
List<Place> mocksFiltered = [];

/// Списик для экрана Поиска по тексту
List<Place> mocksSearchText = [];

/// Список для экрана Хочу посетить
List<Place> mocksWantVisit = [];

/// Список для экрана Посетил
List<Place> mocksVisited = [];

/// Список данных полученных с сервера с применением фильтра
List<PlaceDto> placesDtoFilter = [];

/// Список всех данных полученных с сервера
List<PlaceDto> placesDtoAll = [];

///
List<String> tempPhotoPlace = <String>[
  'https://avatars.mds.yandex.net/get-altay/474904/2a0000015eb1b5f626ffa89658dde2b12a23/XXXL',
  'http://s1.fotokto.ru/photo/full/419/4190926.jpg',
  'https://i.pinimg.com/originals/e5/72/4d/e5724d58879e3057d02f384ddf6707c3.jpg',
  'https://avatars.mds.yandex.net/get-altay/1001354/2a00000162874cd6ce152a8542931ecfe3ae/XXXL',
  'https://avatars.mds.yandex.net/get-altay/223006/2a0000015b171765cf7ab0eaae8e1489f6f1/XXXL',
];

List<OnboardingPage> mocksOnboardingScreen = <OnboardingPage>[
  OnboardingPage(
    welcomeToTheTravelGuide,
    lookNewLocations,
    SvgIcons.tutorialFrame1,
  ),
  OnboardingPage(
    buildRouteAndRoad,
    reachGoalQuicklyComfortablyPossible,
    SvgIcons.tutorialFrame2,
  ),
  OnboardingPage(
    addPlacesYouFoundYourself,
    shareMostInterestingOnes,
    SvgIcons.tutorialFrame3,
  ),
];

//List<Place> mocks = <Place>[];
