import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:places/ui/screen/widgets/history_list_screen/list_history_item_builder.dart';
import 'package:provider/provider.dart';

///
class ListHistory extends StatelessWidget {
  ///
  const ListHistory({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Consumer<SearchFilterModel>(
        builder: (
          final context,
          final cart,
          final child,
        ) =>
            ListView.separated(
          itemCount: SearchFilterModel.listHistory.length,
          shrinkWrap: true,
          itemBuilder: (final context, final index) => ListHistoryItemBuilder(
            index,
          ),
          separatorBuilder: (final context, final index) => const Divider(
            height: 0.8,
          ),
        ),
      );
}
