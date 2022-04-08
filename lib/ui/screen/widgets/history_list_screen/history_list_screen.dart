import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:places/ui/screen/widgets/history_list_screen/history_list_screen_builder.dart';

/// Список историй поиска мест
/// сораняет текст поиска при нажатии кнопки ентер.

class HistoryListScreen extends StatelessWidget {
  ///
  const HistoryListScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => FutureBuilder<int>(
        future: SearchFilterModel.getListHistory(),
        builder: (final context, final snapshot) =>
            const HistoryListScreenBuilder(),
      );
}
