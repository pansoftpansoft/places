import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
import 'package:places/ui/screen/visiting_screen/widgets/background_dismissible.dart';
import 'package:places/ui/screen/visiting_screen/widgets/sight_card_drag.dart';
import 'package:provider/provider.dart';

///
class ListViewCardDrag extends StatelessWidget {
  ///
  final int index;

  ///
  const ListViewCardDrag(
    this.index, {
    final Key? key,
  }) : super(key: key);


  @override
  Widget build(final BuildContext context) => DragTarget<int>(
        onAccept: (final data) {
          context.read<VisitingModel>().sortedPlaceWantVisit(data, index);
        },
        builder: (
          final context,
          final sours,
          final target,
        ) =>
            Draggable<int>(
          data: index,
          feedback: SizedBox(
            width: 250,
            child: SightCardDrag(index),
          ),
          childWhenDragging: Opacity(
            opacity: 0.2,
            child: SightCardDrag(index),
          ),
          child: Dismissible(
            background: const BackgroundDismissible(),
            onDismissed: (final direction) {
              context.read<VisitingModel>().deletePlaceWantVisit(
                    mocksWantVisit[index].name,
                  );
            },
            key: UniqueKey(),
            child: SightCardDrag(index),
          ),
        ),
      );
}
