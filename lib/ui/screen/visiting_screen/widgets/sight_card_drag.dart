import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/sight_details_screen/models/sight_details_model.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
import 'package:places/ui/screen/widgets/sight_card/sight_card.dart';
import 'package:provider/provider.dart';

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
        goNeed: mocksWantVisit[widget.index].wantVisitDate == null
            ? 'Запланируйте дату для посещения'
            : 'Запланировано на '
                '${DateFormat('dd-MM-yyyy').format(
                mocksWantVisit[widget.index].wantVisitDate!,
              )}',
        iconDelete: true,
        //key: ValueKey(mocksWantVisit[index].name),
        actionOnDelete: () {
          _actionOnDelete(context,widget.index);
        },

        /// Установка даты, когда хочу посетить
        wantToVisit: () async {
          if (Platform.isAndroid) {
            var dateTimeCupertino = DateTime.now();

            await Future(
              () async {
                await _showDialog(
                  CupertinoDatePicker(
                    initialDateTime: dateTimeCupertino,
                    mode: CupertinoDatePickerMode.date,
                    use24hFormat: true,
                    onDateTimeChanged: (newDate) {
                      dateTimeCupertino = newDate;
                    },
                  ),
                ).then(
                  (value) => _actionOnSelectData(context, dateTimeCupertino),
                );
              },
            );
          } else if (Platform.isIOS) {
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
              _actionOnSelectData(context, dateTime);
            }
          }
        },
      );



  Future<void> updateContext(Place place, BuildContext context) async {
    await PlaceInteractor.setFavorites(place);
    debugPrint('Обновление контекстов при нажатии кнопки Добавить в фавориты');
    // ignore: use_build_context_synchronously
    context.read<SightDetailsModel>().updateScreen();
    // ignore: use_build_context_synchronously
    context.read<VisitingModel>().updateScreen();
  }

  void _actionOnDelete(BuildContext context, int index) {

    // ignore: use_build_context_synchronously
    updateContext(mocksWantVisit[index], context);
  }

  void _actionOnSelectData(BuildContext context, DateTime dateTimeCupertino) {
    debugPrint(dateTimeCupertino.toString());
    context.read<VisitingModel>().dateWantVisit(
          widget.index,
          dateTimeCupertino,
        );
  }

  Future<void> _showDialog(Widget child) async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
