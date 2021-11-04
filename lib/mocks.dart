import 'package:places/domain/sight.dart';
///
enum TypePlace {
  ///
  hotel,

  ///
  restaurant,

  ///
  particularPlace,

  ///
  park,

  ///
  museum,

  ///
  cafe,
}

///
enum ScreenEnum {
  ///
  loadScreen,

  ///
  historyListScreen,

  ///
  emptyScreen,

  ///
  listOfFoundPlacesScreen,

  ///
  errorScreen,
}

///
List<Sight> mocksSearch = <Sight>[];

///Тестовые данные
final List<Sight> mocks = <Sight>[
  Sight(
    'Ивановская площадь',
    '55.751426',
    '37.618879',
    'http://s1.fotokto.ru/photo/full/419/4190926.jpg',
    'Ивановская площадь — площадь в Московском Кремле, одна из древнейших '
        'площадей Москвы. Возникла после постройки в 1329 году каменной церкви '
        'Иоанна Лествичника, «что под колоколы», которая разделила ранее '
        'единую городскую площадь на две части. Её восточная часть '
        'по Иоанновской церкви стала позднее именоваться Ивановской, '
        'западная — Соборной площадью. В XIV—XV веках южную и восточную'
        ' стороны площади занимали дворы удельных князей Московского дома.',
    TypePlace.park,
    wantVisitDate: DateTime.now(),
    visitedDate: DateTime.now().add(const Duration(hours: 80)),
  ),
  Sight(
    'Собор Покрова Пресвятой Богородицы на Рву',
    '55.752507',
    '37.623150',
    'https://i.pinimg.com/originals/e5/72/4d/e5724d58879e3057d02f384ddf6707c3.jpg',
    'Православный храм на Красной площади в Москве, памятник русской'
        ' архитектуры. Строительство собора велось с 1555 по 1561 год. '
        'Собор объединяет одиннадцать церквей, часть из которых освящена'
        ' в честь святых, дни памяти которых пришлись'
        ' на решающие бои за Казань.',
    TypePlace.park,
    wantVisitDate: DateTime.now(),
    //visitedDate: DateTime.now().add(const Duration(hours: 70)),
  ),
  Sight(
    'Государственная Третьяковская галерея',
    '55.741392',
    '37.620522',
    'https://avatars.mds.yandex.net/get-altay/223006/2a0000015b171765cf7ab0eaae8e1489f6f1/XXXL',
    'Историческое здание Третьяковской галереи по адресу Лаврушинский'
        ' переулок, 10 расположено в комплексе строений, основой'
        ' которого является особняк второй половины XVIII века.'
        ' Семья Третьяковых приобрела этот дом в 1851 году.'
        ' Начав в 1856 собирать картины русских художников,'
        ' Павел Третьяков размещал их в жилых комнатах.',
    TypePlace.park,
    wantVisitDate: DateTime.now(),
    //visitedDate: DateTime.now().add(const Duration(hours: 60)),
  ),
  Sight(
    'Центральный парк культуры и отдыха им. М. Горького',
    '55.729919',
    '37.601348',
    'https://avatars.mds.yandex.net/get-altay/474904/2a0000015eb1b5f626ffa89658dde2b12a23/XXXL',
    'Парк культуры и отдыха.',
    TypePlace.park,
    wantVisitDate: DateTime.now(),
  ),
  Sight(
    'Патриаршие пруды',
    '55.763855',
    '37.592132',
    'https://avatars.mds.yandex.net/get-altay/1001354/2a00000162874cd6ce152a8542931ecfe3ae/XXXL',
    'Общее название местности, расположенной в Пресненском районе'
        ' Центрального административного округа города'
        ' Москвы, куда входят пруд, сквер и микрорайон.',
    TypePlace.park,
    wantVisitDate: DateTime.now(),
  ),
];

///
List<Sight> mocksWantVisit = mocks
    .where(
      (final Sight element) =>
          element.wantVisitDate != null && element.visitedDate == null,
    )
    .toList();

///
List<Sight> mocksVisited =
    mocks.where((final Sight element) => element.visitedDate != null).toList();

///
List<String> tempPhotoPlace = <String>[
  'https://avatars.mds.yandex.net/get-altay/474904/2a0000015eb1b5f626ffa89658dde2b12a23/XXXL',
  'http://s1.fotokto.ru/photo/full/419/4190926.jpg',
  'https://i.pinimg.com/originals/e5/72/4d/e5724d58879e3057d02f384ddf6707c3.jpg',
  'https://avatars.mds.yandex.net/get-altay/1001354/2a00000162874cd6ce152a8542931ecfe3ae/XXXL',
  'https://avatars.mds.yandex.net/get-altay/223006/2a0000015b171765cf7ab0eaae8e1489f6f1/XXXL',
];
