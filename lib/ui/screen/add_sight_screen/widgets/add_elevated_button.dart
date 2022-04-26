import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/bottom_sheet_create_button_row.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/show_alert_add.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:provider/provider.dart';

class AddElevatedButton extends StatelessWidget {
  const AddElevatedButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddSightModel>(
      builder: (
        final context,
        final sight,
        final child,
      ) =>
          ElevatedButton(
        child: BottomSheetCreateButtonRow(context: context),
        onPressed: context.read<AddSightModel>().disableButton == null
            ? null
            : () {
                _addSight(context);
              },
      ),
    );
  }

  ///Обрабатываем кнопку добавить
  void _addSight(BuildContext context) {
    final sight = Sight(
      'Ивановская площадь',
      '55.751426',
      '37.618879',
      'https://static.mk.ru/upload/entities/2017/12/21/articles/facebookPicture/ce/31/98/e7/d15fd0053ec3372a03dc97795b74a33f.jpg',
      details,
      TypePlace.park,
    );
    mocks.add(
      sight,
    );
    Future(() async {
      await showDialog<void>(
        context: context,
        builder: (final context) => const ShowAlertAdd(),
      ).then((value) {
        _onPress(context);
      });
    });
  }

  ///Обработка кнопки предупреждения что добавляется новое место или ошибка
  void _onPress(BuildContext context) {
    context.read<AddSightModel>().disableButton = null;
    context.read<SearchFilterModel>()
      ..setFilteredPlaces()
      ..getFilteredList();
    Navigator.pushReplacementNamed(
      context,
      '/SightListScreen',
    );
  }
}
