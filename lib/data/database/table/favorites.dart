import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:places/data/model/place.dart';

class Favorites extends Table {
  IntColumn get idPlace => integer()();

  TextColumn get jsonPlace => text().map(const PlaceConverter())();

  @override
  Set<Column> get primaryKey => {idPlace};
}

class PlaceConverter extends TypeConverter<Place, String> {
  const PlaceConverter();

  @override
  Place fromSql(String fromDb) {
    debugPrint('Получаем из базы isFavorites = ${fromDb}');

    return Place.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Place value) {
    debugPrint('Записываечм в базу isFavorites = ${value.isFavorites}');

    return json.encode(value.toJson());
  }
}
