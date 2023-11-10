import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/visiting_screen/bloc/list_visited_bloc/list_visited_bloc.dart';
import 'package:places/ui/screen/visiting_screen/bloc/list_want_visit_bloc/list_want_visit_bloc.dart';
import 'package:places/ui/screen/widgets/card_place/card_place.dart';

///
class ListVisitedFilled extends StatelessWidget {
  ///
  const ListVisitedFilled({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ListVisitedBloc, ListVisitedState>(
        builder: (context, state) {
          final listPlace = state.props.first as List<Place>;

          return ListView.builder(
            itemCount: listPlace.length,
            itemBuilder: (context, index) => CardPlace(
              listPlace[index],
              iconDelete: true,
              goal: listPlace[index].visitedDate == null
                  ? ''
                  : '$goalBeen ${DateFormat('dd-MM-yyyy').format(
                      listPlace[index].visitedDate!,
                    )}',
              actionOnDelete: () {
                _actionOnDelete(
                  context,
                  index,
                  listPlace,
                );
              },
            ),
          );
        },
      );

  void _actionOnDelete(
    BuildContext context,
    int index,
    List<Place> listPlace,
  ) {
    context
        .read<ListWantVisitBloc>()
        .add(ListWantVisitRemovePlaceEvent(listPlace[index]));
  }
}
