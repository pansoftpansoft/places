import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/data/interactor/list_places_screen_model.dart';
import 'package:places/data/interactor/visiting_model.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/widgets/card_place/card_place.dart';
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
        itemBuilder: (final context, final index) => CardPlace(
          mocksVisited[index],
          iconDelete: true,
          goal: mocksVisited[index].visitedDate == null
              ? ''
              : 'Цель достигнута'
                  ' ${DateFormat.yMMMd().format(mocksVisited[index].visitedDate!)}',
          //key: ValueKey(mocksVisited[index].name),
          actionOnDelete: () {
            context.read<VisitingModel>().deletePlaceVisited(
                  mocksVisited[index],
                  context
                      .read<ListPlacesScreenModel>()
                      .streamControllerListPlace,
                );
          },
        ),
      );
}
