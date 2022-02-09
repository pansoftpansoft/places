import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
import 'package:places/ui/screen/widgets/sight_card/sight_card.dart';
import 'package:provider/src/provider.dart';

///
class SightCardDrag extends StatefulWidget {
  ///
  final int index;

  ///
  const SightCardDrag(
    this.index, {
    final Key? key,
  }) : super(key: key);

  @override
  State<SightCardDrag> createState() => _SightCardDragState();
}

class _SightCardDragState extends State<SightCardDrag> {
  @override
  Widget build(final BuildContext context) => SightCard(
        mocksWantVisit[widget.index],
        goNeed: 'Запланировано на '
            '${DateFormat('dd-MM-yyyy').format(
          mocksWantVisit[widget.index].wantVisitDate!,
        )}',
        iconDelete: true,
        //key: ValueKey(mocksWantVisit[index].name),
        actionOnDelete: () {
          _actionOnDelete(context);
        },

        /// Установка даты, когда хочу посетить
        wantToVisit: () async {
          final dateTime = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(
              const Duration(days: 365),
            ),
          );
          if (dateTime != null) {
            if (!mounted) {
              return;
            }
            context.read<VisitingModel>().dateWantVisit(
                  widget.index,
                  dateTime,
                );
          }
        },
      );

  void _actionOnDelete(BuildContext context) {
    context.read<VisitingModel>().deletePlaceWantVisit(
          mocksWantVisit[widget.index].name,
        );
  }
}
