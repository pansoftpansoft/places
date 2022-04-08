import 'package:flutter/material.dart';
import 'package:places/ui/screen/widgets/history_list_screen/history_list_screen_builder.dart';

/// Список историй поиска мест
/// сораняет текст поиска при нажатии кнопки ентер.

class HistoryListScreen extends StatelessWidget {
  ///
  const HistoryListScreen({final Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HistoryListScreenBuilder();
  }
}
