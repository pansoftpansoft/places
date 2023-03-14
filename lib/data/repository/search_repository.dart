import 'package:places/domain/db_provider.dart';
import 'package:places/domain/history.dart';

/// Слой получения данных
class SearchRepository {
  final SqlProvider _dbProvider;

  SearchRepository(this._dbProvider);

  ///Получаем список слов по которым производился поиск
  Future<List<History>> getListSearchHistory() async {
    final listFilter = await _dbProvider.getListHistoryFromDb() ?? <History>[];

    //Todo Сделать переключатеь выбора базы данных для сохранения
    // final listFilter =
    //   await SqlProvider.dbProvider.getListFilterCategoryFromDb();

    return listFilter;
  }
}
