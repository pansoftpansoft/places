import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/add_place_screen/bloc/add_place_bloc.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_bloc.dart';
import 'package:places/ui/screen/list_places_screen/bloc/list_places_bloc.dart';
import 'package:places/ui/screen/widgets/elevated_button_green_big.dart';

/// Кнопка "Создать"
class ButtonCreate extends StatelessWidget {
  const ButtonCreate({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPlaceBloc, AddPlaceState>(
      builder: (context, state) {
        return ElevatedButtonGreenBig(
          title: create.toUpperCase(),
          onPressed: state.addReadyCheck == 1
              ? () {
                  _onPressed(context);
                }
              : null,
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

  ///Обработка кнопки предупреждения что добавляется новое место или ошибка
  void _onPressed(BuildContext context) {
    context.read<AddPlaceBloc>().add(
          AddPlaceEvents.onCreatePlace(
            place: context.read<AddPlaceBloc>().state.place,
          ),
        );

    context.read<ListPlacesBloc>().add(
          ListPlacesEvents.load(
            filterSet: context.read<FilterBloc>().state.filterSet,
          ),
        );
    // Navigator.pushReplacementNamed(
    //   context,
    //   RouteName.listPlacesScreen,
    // );
  }
}
