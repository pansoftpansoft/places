import 'package:flutter/material.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/ui/res/labels.dart';
import 'package:provider/provider.dart';

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
    context.read<FiltersScreenInteractor>().restoreFilterSettings().then(
          (value) => context
              .read<FiltersScreenInteractor>()
              .getDataFromRepository()
              .then(
            (value) {
              context.read<FiltersScreenInteractor>().notifyListenersFiltersScreen();
              Navigator.pop(context);
            },
          ),
        );
  }
}
