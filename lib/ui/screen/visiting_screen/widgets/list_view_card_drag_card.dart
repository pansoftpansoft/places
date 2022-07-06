import 'package:flutter/material.dart';
import 'package:places/data/interactor/list_places_screen_model.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/visiting_screen/widgets/background_dismissible.dart';
import 'package:places/ui/screen/visiting_screen/widgets/card_place_drag.dart';
import 'package:provider/provider.dart';

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
          child: CardPlaceDrag(index),
        ),
      ],
    );
  }

  void _onDismissed(BuildContext context) {
    context.read<VisitingInteractor>().deletePlaceWantVisit(
          mocksWantVisit[index],
          context.read<ListPlacesScreenModel>().streamControllerListPlace,
        );
  }
}
