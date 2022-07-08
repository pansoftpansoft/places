import 'package:flutter/material.dart';
import 'package:places/data/interactor/search_screen_interactor.dart';
import 'package:places/ui/screen/widgets/history_list_screen/list_history_item_builder.dart';
import 'package:provider/provider.dart';

///
class ListHistory extends StatelessWidget {
  ///
  const ListHistory({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<SearchScreenInteractor>(
        builder: (
          context,
          cart,
          child,
        ) =>
            ListView.separated(
          itemCount: SearchScreenInteractor.listHistory.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => ListHistoryItemBuilder(
            index,
          ),
          separatorBuilder: (context, index) => const Divider(
            height: 0.8,
          ),
        ),
      );
}
