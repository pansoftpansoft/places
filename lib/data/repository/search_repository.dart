import 'package:places/data/database/app_db.dart';

/// Слой получения данных
class SearchRepository {
  final AppDb _appDb;

  SearchRepository(this._appDb);

  ///Получаем список слов по которым производился поиск
  Future<List<SearchQueryHistory>> getListSearchHistory() async {
    final listFilter = await _appDb.allSearchQueryHistory;

    return listFilter;
  }

  /// Добавить, в список историй поиска, новый поисковый запрос
  Future<void> addHistory(String historyText) async {
    if (historyText.isEmpty) {
      return;
    }
    await _appDb.addSearchQueryHistory(historyText);
  }

  /// Удаление всех поисковых запросов
  Future<void> clearSearchHistory() async {
    await _appDb.clearSearchQueryHistory();
  }

  /// Удаление поискового запроса
  Future<void> deleteSearchRequest(int id) async {
    await _appDb.deleteSearchQueryHistory(id);
  }
}
