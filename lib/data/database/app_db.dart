import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:places/data/database/table/search_query_historys.dart';

part 'app_db.g.dart';

@DriftDatabase(tables: [SearchQueryHistorys])
class AppDb extends _$AppDb {
  @override
  int get schemaVersion => 1;

  Future<List<SearchQueryHistory>> get allSearchQueryHistory =>
      select(searchQueryHistorys).get();

  AppDb() : super(_openConnection());

  Future<int> addSearchQueryHistory(
    SearchQueryHistorysCompanion searchQueryHistory,
  ) {
    return into(searchQueryHistorys).insert(
      searchQueryHistory,
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'place.sqlite'));

    return NativeDatabase(file);
  });
}
