import 'package:flutter/material.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/ui/screen/visiting_screen/widgets/card_place_drag.dart';
import 'package:places/ui/screen/visiting_screen/widgets/list_view_card_drag_card.dart';
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
          context.read<VisitingInteractor>().sortedPlaceWantVisit(data, index);
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
            child: CardPlaceDrag(index),
          ),
          childWhenDragging: Opacity(
            opacity: 0.2,
            child: CardPlaceDrag(index),
          ),
          child: ListViewCardDragCard(index),
        ),
      );
}
