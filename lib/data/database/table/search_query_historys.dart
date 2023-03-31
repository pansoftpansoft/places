import 'package:drift/drift.dart';

class SearchQueryHistorys extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get searchQuery => text().withLength(max: 50)();
}

