import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/add_place_screen/widgets/bottom_sheet_create_button.dart';
import 'package:places/ui/screen/widgets/elevated_button_green_big.dart';

/// Кнопка "Создать"
class ButtonCreate extends StatelessWidget {

  const ButtonCreate({
      final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wm = context.findAncestorWidgetOfExactType<BottomSheetCreateButton>()!.wm;
    debugPrint('wm 3  = ${wm.toString()}');


    return StateNotifierBuilder<bool>(
      listenableState: wm.buttonCreateState,
      builder: (context, data) {
        return ElevatedButtonGreenBig(
          title: create.toUpperCase(),
          onPressed: data==true ? wm.createPlace : null,
        );
       },
    );
  }

  // ///Обрабатываем кнопку "Создать"
  // void _addPlace(BuildContext context) {
  //   final place = Place(
  //     id: 1111111,
  //     lat: 55.751426,
  //     lon: 37.618879,
  //     name: 'Ивановская площадь',
  //     urls: [
  //       'https://static.mk.ru/upload/entities/2017/12/21/articles/facebookPicture/ce/31/98/e7/d15fd0053ec3372a03dc97795b74a33f.jpg',
  //     ],
  //     description: details,
  //     placeType: TypePlace.park.toString(),
  //   );
  //   mocks.add(
  //     place,
  //   );
  //   Future(() async {
  //     await showDialog<void>(
  //       context: context,
  //       builder: (context) => const ShowAlertAdd(),
  //     ).then((value) {
  //       _onPress(context);
  //     });
  //   });
  // }

  // ///Обработка кнопки предупреждения что добавляется новое место или ошибка
  // void _onPress(BuildContext context) {
  //   context
  //       .read<AddPlaceInteractor>()
  //       .disableButton = null;
  //   Navigator.pushReplacementNamed(
  //     context,
  //     RouteName.listPlacesScreen,
  //   );
  // }
}
