import 'package:flutter/material.dart';
import 'package:places/ui/screen/widgets/history_list_screen/list_history_screen_builder.dart';

/// Список историй поиска мест
/// сораняет текст поиска при нажатии кнопки ентер.

class ListHistoryScreen extends StatelessWidget {
  ///
  const ListHistoryScreen({final Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListHistoryScreenBuilder();
  }
}
