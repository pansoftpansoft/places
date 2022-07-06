import 'package:flutter/material.dart';
import 'package:places/data/interactor/search_screen_model.dart';
import 'package:places/ui/screen/widgets/history_list_screen/list_history_item_builder.dart';
import 'package:provider/provider.dart';

///
class ListHistory extends StatelessWidget {
  ///
  const ListHistory({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Consumer<SearchScreenModel>(
        builder: (
          final context,
          final cart,
          final child,
        ) =>
            ListView.separated(
          itemCount: SearchScreenModel.listHistory.length,
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
