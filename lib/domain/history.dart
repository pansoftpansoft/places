///Класс История поиска

class History {
  ///История поиска
  final String historyText;

  ///
  History({required this.historyText});

  ///
  factory History.fromMap(final Map<String, dynamic> _map) => History(
        historyText: _map['history_text'].toString(),
      );

  ///
  Map<String, String> toMap() => {
        'history_text': historyText,
      };
}
