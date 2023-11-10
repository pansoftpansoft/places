import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:places/data/database/table/favorites.dart';
import 'package:places/data/database/table/search_query_historys.dart';
import 'package:places/data/model/place.dart';

part 'app_db.g.dart';

@DriftDatabase(
  tables: [SearchQueryHistorys, Favorites],
)
class AppDb extends _$AppDb {
  @override
  int get schemaVersion => 1;

  Future<List<SearchQueryHistory>> get allSearchQueryHistory =>
      select(searchQueryHistorys).get();

  AppDb() : super(_openConnection());

  Future<int> addSearchQueryHistory(
    String searchString,
  ) {
    return into(searchQueryHistorys).insert(
      SearchQueryHistorysCompanion(searchQuery: Value(searchString)),
    );
  }

  Future<void> deleteSearchQueryHistory(
    int id,
  ) async {
    await (delete(searchQueryHistorys)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> clearSearchQueryHistory() async {
    await delete(searchQueryHistorys).go();
  }

  Future<bool> checkPlacesInLocalDataId(int id) async {
    final query =
        await (select(favorites)..where((tbl) => tbl.idPlace.equals(id))).get();

    return query.isNotEmpty;
  }

  Future<void> insertUpdateFavorite(Place place) async {
    if (kDebugMode) {
      print('insertUpdateFavorite = ${place.isFavorites}');
    }
    await into(favorites).insertOnConflictUpdate(
      FavoritesCompanion(
        idPlace: Value(place.id),
        jsonPlace: Value(place),
      ),
    );
  }

  Future<void> deleteFromFavorites(Place place) async {
    await (delete(favorites)
          ..where(
            (tbl) {
              return tbl.idPlace.equals(place.id);
            },
          ))
        .go();
  }

  ///Получим список мест из таблицы favorites
  Future<List<Place>> getListFavorite() async {
    final listFavorite = await select(favorites).get();

    final listPlace = listFavorite.map((e) => e.jsonPlace).toList();

    return listPlace;
  }
}

///Подключение к базе данных
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'place.sqlite'));

    return NativeDatabase(file);
  });
}
