import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_bloc.dart';

class AppBarTitleButtonCancel extends StatelessWidget {
  const AppBarTitleButtonCancel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        alignment: Alignment.centerLeft,
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.zero,
        ),
      ),
      onPressed: () {
        _onPressed(context);
      },
      child: Text(
        cancel,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              fontSize: 16,
            ),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    //Востановить состояние фильтра
    context.read<FilterBloc>().add(const FilterEvents.load());
    Navigator.pop(context);
  }
}
