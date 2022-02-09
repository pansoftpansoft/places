import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
import 'package:places/ui/screen/visiting_screen/widgets/background_dismissible.dart';
import 'package:places/ui/screen/visiting_screen/widgets/sight_card_drag.dart';
import 'package:provider/src/provider.dart';


//Карточка отображения места в "Избранное"
class ListViewCardDragCard extends StatelessWidget {
  final int index;

  const ListViewCardDragCard(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundDismissible(),
        Dismissible(
          onDismissed: (final direction) {
            _onDismissed(context);
          },
          key: UniqueKey(),
          child: SightCardDrag(index),
        ),
      ],
    );
  }

  void _onDismissed(BuildContext context) {
    context.read<VisitingModel>().deletePlaceWantVisit(
      mocksWantVisit[index].name,
    );
  }
}
