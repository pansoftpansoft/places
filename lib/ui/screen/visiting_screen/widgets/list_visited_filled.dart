import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:places/type_place.dart';
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
          return ListView.builder(
            itemCount: mocksVisited.length,
            itemBuilder: (context, index) => CardPlace(
              mocksVisited[index],
              iconDelete: true,
              goal: mocksVisited[index].visitedDate == null
                  ? ''
                  : '$goalBeen ${DateFormat('dd-MM-yyyy').format(
                      mocksVisited[index].visitedDate!,
                    )}',
              actionOnDelete: () {
                _actionOnDelete(context, index);
              },
            ),
          );
        },
      );

  void _actionOnDelete(BuildContext context, int index) {
    context
        .read<ListWantVisitBloc>()
        .add(ListWantVisitRemovePlaceEvent(mocksVisited[index]));
  }
}
