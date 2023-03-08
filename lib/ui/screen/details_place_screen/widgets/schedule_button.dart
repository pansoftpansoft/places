import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/details_place_screen/bloc/details_place_bloc.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_bloc.dart';
import 'package:places/ui/screen/list_places_screen/bloc/list_places_bloc.dart';
import 'package:places/ui/screen/widgets/text_button_small.dart';

///Кнопка 'Заплонировать'
class ScheduleButton extends StatelessWidget {
  ///Конструктор кнопки 'Заплонировать'
  const ScheduleButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsPlaceBloc, DetailsPlaceState>(
      builder: (context, state) {
        return TextButtonSmall(
          title: state.wantVisitDate != null
              ? scheduled + state.wantVisitDate.toString().substring(0, 10)
              : schedule,
          onPressed: () {
            //wantToVisitAction(dateTimeCupertino, context);
            _selectDate(context);
          },
          svgIconNamePrefix: state.wantVisitDate == null
              ? SvgIcons.calendar
              : SvgIcons.calendarFull,
        );
      },
    );
  }

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
          context,
        ).then(
          (value) {
            context.read<DetailsPlaceBloc>().add(
                  DetailsPlaceEvents.onChangedWantVisitDate(
                    wantVisitDate: dateTimeCupertino,
                  ),
                );
            context.read<ListPlacesBloc>().add(
                  ListPlacesEvents.load(
                    filterSet: context.read<FilterBloc>().state.filterSet,
                  ),
                );
          },
        );
      },
    );
  }

  Future<void> _showDialog(Widget child, BuildContext context) async {
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

  void _selectDate(
    BuildContext context,
  ) {
    final dateTimeCupertino = DateTime.now();

    if (Platform.isAndroid) {
      wantToVisitAction(dateTimeCupertino, context);
    } else if (Platform.isIOS) {
      final dateTime = showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          const Duration(days: 365),
        ),
      );
    }
  }
}
