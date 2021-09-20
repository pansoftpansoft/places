/*
Класс История поиска
*/
class History {
  final String historyText; //История поиска

  History({required this.historyText});

  factory History.fromMap(Map<String, dynamic> _map) => new History(
        historyText: _map['history_text'].toString(),
      );

  Map<String, String> toMap() => {
        'history_text': historyText,
      };
}
