import 'package:drift/drift.dart';

class SearchQueryHistory extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get searchQuery => text().withLength(max: 50)();
}
