import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/data/interactor/list_places_screen_interactor.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
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
  Widget build(BuildContext context) => ListView.builder(
        itemCount: mocksVisited.length,
        itemBuilder: (context, index) => CardPlace(
          mocksVisited[index],
          iconDelete: true,
          goal: mocksVisited[index].visitedDate == null
              ? ''
              : 'Цель достигнута'
                  ' ${DateFormat.yMMMd().format(mocksVisited[index].visitedDate!)}',
          //key: ValueKey(mocksVisited[index].name),
          actionOnDelete: () {
            context.read<VisitingInteractor>().deletePlaceVisited(
                  mocksVisited[index],
                  context
                      .read<ListPlacesScreenInteractor>()
                      .streamControllerListPlace,
                );
          },
        ),
      );
}
