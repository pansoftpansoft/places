import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/visiting_screen/bloc/list_want_visit_bloc/list_want_visit_bloc.dart';
import 'package:places/ui/screen/widgets/card_place/card_place.dart';

///
class CardPlaceDrag extends StatefulWidget {
  ///
  final int index;

  ///
  const CardPlaceDrag(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  State<CardPlaceDrag> createState() => _CardPlaceDragState();
}

class _CardPlaceDragState extends State<CardPlaceDrag> {
  @override
  Widget build(BuildContext context) => CardPlace(
        mocksWantVisit[widget.index],
        goNeed: mocksWantVisit[widget.index].wantVisitDate == null ||
                mocksWantVisit[widget.index]
                        .wantVisitDate
                        .toString()
                        .substring(0, 10) ==
                    '1970-01-01'
            ? scheduleDateForVisit
            : '$scheduled2 ${DateFormat('dd-MM-yyyy').format(
                mocksWantVisit[widget.index].wantVisitDate!,
              )}',
        iconDelete: true,
        //key: ValueKey(mocksWantVisit[index].name),
        actionOnDelete: () {
          _actionOnDelete(context, widget.index);
        },

        /// Установка даты, когда хочу посетить
        wantToVisit: () async {
          if (Platform.isIOS) {
            final dateTimeCupertino = DateTime.now();

            await wantToVisitAction(
              dateTimeCupertino,
              context,
            );
          } else if (Platform.isAndroid) {
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
              _actionOnSelectData(context, dateTime, widget.index);
            }
          }
        },
      );

  Future<void> wantToVisitAction(
    DateTime dateTimeCupertino,
    BuildContext context,
  ) async {
    return Future(
      () async {
        await _showDialog(
          CupertinoDatePicker(
            initialDateTime: dateTimeCupertino,
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            onDateTimeChanged: (newDate) {
              // ignore: parameter_assignments
              dateTimeCupertino = newDate;
            },
          ),
        ).then(
          (value) =>
              _actionOnSelectData(context, dateTimeCupertino, widget.index),
        );
      },
    );
  }

  void _actionOnDelete(BuildContext context, int index) {
    context
        .read<ListWantVisitBloc>()
        .add(ListWantVisitRemovePlaceEvent(mocksWantVisit[index]));
  }

  void _actionOnSelectData(
    BuildContext context,
    DateTime dateTimeCupertino,
    int index,
  ) {
    debugPrint('Нажата кнопка Set date = ${index.toString()}');

    context.read<ListWantVisitBloc>().add(
          ListWantVisitUpdateDateEvent(
            mocksWantVisit[index].copyWith(wantVisitDate: dateTimeCupertino),
          ),
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
