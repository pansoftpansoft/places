import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
import 'package:places/ui/screen/widgets/sight_card/sight_card.dart';
import 'package:provider/provider.dart';

///
class ListViewTab2 extends StatelessWidget {
  ///
  const ListViewTab2({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => ListView.builder(
        itemCount: mocksVisited.length,
        itemBuilder: (final context, final index) => SightCard(
          mocksVisited[index],
          iconDelete: true,
          goal: 'Цель достигнута'
              ' ${DateFormat.yMMMd().format(mocksVisited[index].visitedDate!)}',
          //key: ValueKey(mocksVisited[index].name),
          actionOnDelete: () {
            context.read<VisitingModel>().deletePlaceVisited(
                  mocksVisited[index].name,
                );
          },
        ),
      );
}
