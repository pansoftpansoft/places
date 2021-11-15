import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
import 'package:places/ui/screen/widgets/sight_card/sight_card.dart';
import 'package:provider/src/provider.dart';

///
class SightCardDrag extends StatelessWidget {
  ///
  const SightCardDrag(
    this.index, {
    final Key? key,
  }) : super(key: key);

  ///
  final int index;

  @override
  Widget build(final BuildContext context) => SightCard(
        mocksWantVisit[index],
        goNeed: 'Запланировано на '
            '${DateFormat('dd-MM-yyyy').format(
          mocksWantVisit[index].wantVisitDate!,
        )}',
        iconDelete: true,
        //key: ValueKey(mocksWantVisit[index].name),
        actionOnDelete: () {
          context.read<VisitingModel>().deletePlaceWantVisit(
                mocksWantVisit[index].name,
              );
        },
    /// Установка даты, когда хочу посетить
        wantToVisit: () async {
          final DateTime? dateTime = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(
              const Duration(days: 365),
            ),
          );
          if (dateTime != null) {
            context.read<VisitingModel>().dateWantVisit(
                  index,
                  dateTime,
                );
          }
        },
      );
}
