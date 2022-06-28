import 'package:places/data/model/filter_category.dart';
import 'package:places/data/model/filter_distance.dart';
import 'package:places/domain/db_provider.dart';

///--------------------------------------------------------------
/// Слой получения данных
class FilterRepository {
  ///--------------------------------------------------------------
  ///Получаем список настроек фильтра категорий
  static Future<List<FilterCategory>> getListFilterCategory() async {
    final listFilter =
        await DBProvider.dbProvider.getListFilterCategoryFromDb();

    return listFilter;
  }

  ///--------------------------------------------------------------
  ///Получаем список настроек фильтра дистанции
  static Future<List<FilterDistance>> getListFilterDistance() async {
    final listFilter =
        await DBProvider.dbProvider.getListFilterDistanceFromDb();
    // for (final item in listFilter) {
    //   debugPrint(
    //     'item = ${item.distanceCode} ${item.distanceStart} ${item.distanceEnd}',
    //   );
    // }

    return listFilter;
  }

  ///--------------------------------------------------------------
  ///Обновляем список настроек фильтра категорий в базе данных
  static Future<void> updateFilterCategory(FilterCategory filter) async {
    await DBProvider.dbProvider.updateSettingsFilterCategoryInDb(filter);
  }

  ///--------------------------------------------------------------
  ///Обновляем список настроек фильтра в базе данных
  static Future<void> updateFilterDistance(FilterDistance filter) async {
    await DBProvider.dbProvider.updateSettingsFilterDistanceInDb(filter);
  }
}
