import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/blocs/visiting_screen/want_visit_tab/want_visit_tab_bloc.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/widgets/card_place/card_place.dart';
import 'package:provider/provider.dart';

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
        goNeed: mocksWantVisit[widget.index].wantVisitDate == null
            ? 'Запланируйте дату для посещения'
            : 'Запланировано на '
                '${DateFormat('dd-MM-yyyy').format(
                mocksWantVisit[widget.index].wantVisitDate!,
              )}',
        iconDelete: true,
        //key: ValueKey(mocksWantVisit[index].name),
        actionOnDelete: () {
          _actionOnDelete(context, widget.index);
        },

        /// Установка даты, когда хочу посетить
        wantToVisit: () async {
          if (Platform.isAndroid) {
            final dateTimeCupertino = DateTime.now();

            await wantToVisitAction(dateTimeCupertino, context);
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
          (value) => _actionOnSelectData(context, dateTimeCupertino),
        );
      },
    );
  }

  void _actionOnDelete(BuildContext context, int index) {
    debugPrint('Нажата кнопка actionOnDelete = ${index.toString()}');
    context
        .read<WantVisitTabBloc>()
        .add(WantVisitTabRemovePlace(mocksWantVisit[index]));
  }

  void _actionOnSelectData(BuildContext context, DateTime dateTimeCupertino) {
    debugPrint(dateTimeCupertino.toString());
    context.read<VisitingInteractor>().dateWantVisit(
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
