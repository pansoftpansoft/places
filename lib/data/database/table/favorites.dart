import 'package:drift/drift.dart';

class Favorites extends Table {
  IntColumn get id => integer().autoIncrement()();

  BoolColumn get isFavorites => boolean().withDefault(const Constant(false))();

  IntColumn get wantVisitDate => integer()();

  IntColumn get visitedDate => integer()();
}
