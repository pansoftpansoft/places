import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/visiting_screen/bloc/list_want_visit_bloc/list_want_visit_bloc.dart';
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
          onDismissed: (direction) {
            _onDismissed(context);
          },
          key: UniqueKey(),
          child: CardPlaceDrag(index),
        ),
      ],
    );
  }

  void _onDismissed(BuildContext context) {
    debugPrint('Пробую удалить');
    context.read<ListWantVisitBloc>().add(
          ListWantVisitRemovePlaceEvent(
            mocksWantVisit[index],
          ),
        );
  }
}
