///Класс История поиска

class History {
  ///
  History({required this.historyText});

  ///
  factory History.fromMap(final Map<String, dynamic> _map) => History(
        historyText: _map['history_text'].toString(),
      );

  ///История поиска
  final String historyText;

  ///
  Map<String, String> toMap() => {
        'history_text': historyText,
      };
}
