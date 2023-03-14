import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/interactor/search_screen_interactor.dart';
import 'package:places/ui/screen/search_places_screen/bloc/search_places_bloc.dart';
import 'package:places/ui/screen/widgets/history_list_screen/list_history_item_builder.dart';

///
class ListHistory extends StatelessWidget {
  ///
  const ListHistory({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchPlacesBloc, SearchPlacesState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: SearchScreenInteractor.listHistory.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => ListHistoryItemBuilder(
            index,
          ),
          separatorBuilder: (context, index) => const Divider(
            height: 0.8,
          ),
        );
      },
    );
  }
}
