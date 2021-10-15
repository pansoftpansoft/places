import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
import 'package:places/ui/screen/widgets/sight_card/sight_card.dart';
import 'package:provider/provider.dart';
import 'background_dismissible.dart';

class ListViewCardDrag extends StatelessWidget {
  final int index;

  ListViewCardDrag(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      onAccept: (data) {
        var _visitingModel = context.read<VisitingModel>();
        _visitingModel.sortedPlaceWantVisit(data, index);
      },
      builder: (context, sours, target) {
        return Draggable<int>(
          data: index,
          feedback: SizedBox(
            width: 250,
            child: sightCardDrag(index, context),
          ),
          childWhenDragging: Opacity(
            opacity: .2,
            child: sightCardDrag(index, context),
          ),
          child: Dismissible(
              background: const BackgroundDismissible(),
              onDismissed: (direction) {
                var _visitingModel = context.read<VisitingModel>();
                _visitingModel.deletePlaceWantVisit(
                  mocksWantVisit[index].name,
                );
              },
              key: UniqueKey(),
              child: sightCardDrag(index, context)),
        );
      },
    );
  }
}

///
SightCard sightCardDrag(int index, BuildContext context) => SightCard(
      mocksWantVisit[index],
      goNeed: 'Запланировано на '
          '${DateFormat.yMMMd().format(mocksWantVisit[index].wantVisitDate!)}',
      iconDelete: true,
      //key: ValueKey(mocksWantVisit[index].name),
      actionOnDelete: () {
        context.read<VisitingModel>().deletePlaceWantVisit(
              mocksWantVisit[index].name,
            );
      },
    );
