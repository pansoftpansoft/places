import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/add_place_screen/bloc/add_place_bloc.dart';

/// Кнопка для выбора типа места
class SelectTypePlace extends StatelessWidget {
  ///
  const SelectTypePlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AddPlaceBloc, AddPlaceState>(
        builder: (
          context,
          state,
        ) {
          return SizedBox(
            height: 32,
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              ),
              onPressed: () async {
                _onPressed(context, state.place);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    state.place.placeType == ''
                        ? notSelected
                        : state.place.placeType,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 16),
                  ),
                  SvgPicture.asset(
                    SvgIcons.view,
                  ),
                ],
              ),
            ),
          );
        },
      );

  void _onPressed(BuildContext context, Place place) {
    context.read<AddPlaceBloc>().add(
          AddPlaceEvents.onSelectPlaceType(place: place),
        );

    return;
  }
}
