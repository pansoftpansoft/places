/// Класс места
class PlacesLocalData {
  /// Id достопримечательности
  int id;

  /// Признак того что место добавлено в избранное
  int? isFavorites;

  /// Дата когда хочу посетить место
  int? wantVisitDate;

  /// Дата когда посетил
  int? visitedDate;

  /// Конструктор класса PalacesLocalData
  PlacesLocalData(
    this.id, {
    this.isFavorites = 0,
    this.wantVisitDate,
    this.visitedDate,
  });





  factory PlacesLocalData.fromSqlite(
    final Map<String, dynamic> localData,
  ) =>
      PlacesLocalData(
        localData['id'] as int,
        isFavorites: localData['isFavorites'] as int,
        wantVisitDate: localData['wantVisitDate'] == null
            ? 0
            : localData['wantVisitDate'] as int,
        visitedDate: localData['visitedDate'] == null
            ? 0
            : localData['visitedDate'] as int,
      );

  // ignore: avoid_bool_literals_in_conditional_expressions
  bool isFavoritesToBool(int? favorites) => favorites == 1 ? true : false;

  DateTime? wantVisitDateToDatetime() => wantVisitDate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(
          wantVisitDate!,
        );

  DateTime? visitedDateToDatetime() => visitedDate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(
          visitedDate!,
        );

  Map<String, Object?> toMap() => {
        'id': id,
        'isFavorites': isFavorites,
        'wantVisitDate': wantVisitDate,
        'visitedDate': visitedDate,
      };
}
