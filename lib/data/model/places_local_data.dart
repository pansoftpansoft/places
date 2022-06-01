/// Класс места
class PlacesLocalData {
  /// Id достопримечательности
  final int id;

  /// Признак того что место добавлено в избранное
  bool? isFavorites;

  /// Дата когда хочу посетить место
  DateTime? wantVisitDate;

  /// Дата когда посетил
  DateTime? visitedDate;

  /// Конструктор класса PalacesLocalData
  PlacesLocalData(
    this.id, {
    this.isFavorites = false,
    this.wantVisitDate,
    this.visitedDate,
  });

  factory PlacesLocalData.fromSqlite(
    final Map<String, dynamic> localData,
  ) =>
      PlacesLocalData(
        localData['id'] as int,
        isFavorites: localData['isFavorites'] as bool,
        wantVisitDate: localData['wantVisitDate'] as DateTime,
        visitedDate: localData['visitedDate'] as DateTime,
      );

  Map<String, Object?> toMap() => {
        'id': id,
        'isFavorites': isFavorites,
        'wantVisitDate': wantVisitDate,
        'visitedDate': visitedDate,
      };
}
