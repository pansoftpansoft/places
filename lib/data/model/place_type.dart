import 'package:places/ui/res/svg_icons.dart';
import 'app_model.dart';

class PlaceType {
  final String namePlaceDB;

  int index = -1;
  String svgIcons = '';
  String namePlaceTranslate = '';

  Map<String, List<String>> dictionaryPlaceType = {
    'hotel': ['Hotel', 'Отель'],
    'restaurant': ['Restaurant', 'Ресторан'],
    'particularPlace': ['Particular place', 'Особые места'],
    'park': ['Park', 'Парк'],
    'museum': ['Museum', 'Музей'],
    'cafe': ['Cafe', 'Кафе'],
  };

  Map<String, List<String>> iconDictionaryPlaceType = {
    'hotel': ['hotel.svg', 'hotel.svg'],
    'restaurant': ['restaurant.svg', 'restaurant.svg'],
    'particularPlace': ['particular_place.svg', 'particular_place.svg'],
    'park': ['park.svg', 'park.svg'],
    'museum': ['museum.svg', 'museum.svg'],
    'cafe': ['cafe.svg', 'cafe.svg'],
  };

  PlaceType(this.namePlaceDB) {
    namePlaceTranslate =
        (dictionaryPlaceType[namePlaceDB] ?? ['', '', ''])[AppModel.language];

    index = dictionaryPlaceType.keys.toList().indexOf(namePlaceDB);

    svgIcons = '${SvgIcons.catalog}'
        '${(iconDictionaryPlaceType[namePlaceDB] ?? [
              'particular_place.svg',
              'particular_place.svg',
            ] as List<String>)[AppModel.isThemeColor ? 0 : 1]}';
  }
}
