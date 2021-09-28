import '../mocks.dart';

/*
Класс места
*/
class Sight {
  final String name; //название достопримечательности
  final String lat; //координаты места
  final String lon; //координаты места
  final String url; //путь до фотографии в интернете
  final String details; //описание достопримечательности
  final TypePlace type; //тип достопримечательности.
  DateTime? wantVisitDate; // Дата когда хочу посетить место
  DateTime? visitedDate; // Дата когда посетил
  bool visibleFilter = false; //отображать в списке после поиска и фильтрации.

  Sight(this.name, this.lat, this.lon, this.url, this.details, this.type,{this.wantVisitDate, this.visitedDate});
}
