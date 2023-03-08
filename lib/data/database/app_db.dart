import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:places/data/database/table/search_query_history.dart';

part 'app_db.g.dart';

@DriftDatabase(tables: [SearchQueryHistory])
class AppDb extends _$AppDb {
  @override
  int get schemaVersion => 1;

  AppDb() : super(_openConnection());
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'place.sqlite'));

    return NativeDatabase(file);
  });
}
