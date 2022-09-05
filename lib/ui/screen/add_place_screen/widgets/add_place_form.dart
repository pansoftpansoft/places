import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_place_screen/bloc/add_place_bloc.dart';
import 'package:places/ui/screen/add_place_screen/widgets/add_place_screen_body.dart';
import 'package:places/ui/screen/list_places_screen/bloc/list_places_bloc.dart';
import 'package:places/ui/screen/select_category/select_category.dart';

class AddPlaceForm extends StatelessWidget {
  final _focusNodeNamePlace = FocusNode();
  final _focusNodeLat = FocusNode();
  final _focusNodeLon = FocusNode();
  final _focusNodeDescription = FocusNode();

  final _textEditingControllerNamePlace = TextEditingController();
  final _textEditingControllerLat = TextEditingController();
  final _textEditingControllerLon = TextEditingController();
  final _textEditingControllerDescription = TextEditingController();

  AddPlaceForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(paddingPage),
        child: MultiBlocListener(
          listeners: [
            BlocListener<AddPlaceBloc, AddPlaceState>(
              listenWhen: (previousState, state) => state.selectPlaceType,
              listener: (context, state) {
                _onPressed(context);
              },
            ),
            BlocListener<AddPlaceBloc, AddPlaceState>(
              listenWhen: (previousState, state) => state.addedPlace,
              listener: (context, state) {
                debugPrint('!!! Show snack add = ${state.toString()}');
                final snackBar = SnackBar(
                  content: const Text('Место добавлено!'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger
                    .of(context)
                    .showSnackBar(snackBar)
                    .closed
                    .then((value) {
                  context.read<ListPlacesBloc>().add(
                    const ListPlacesEvents.load(),);
                  Navigator.pop(
                    context,
                  );
                },
                );
              },
            ),
            BlocListener<AddPlaceBloc, AddPlaceState>(
              listenWhen: (previousState, state) => state.error,
              listener: (context, state) {
                debugPrint('!!! Show snack error = ${state.toString()}');
                final snackBar = SnackBar(
                  content: const Text('Ошибка!'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
          child: BlocBuilder<AddPlaceBloc, AddPlaceState>(
            builder: (context, state) {
              return AddPlaceScreenBody(
                textEditingControllerNamePlace: _textEditingControllerNamePlace,
                focusNodeNamePlace: _focusNodeNamePlace,
                focusNodeLat: _focusNodeLat,
                textEditingControllerLat: _textEditingControllerLat,
                focusNodeLon: _focusNodeLon,
                textEditingControllerLon: _textEditingControllerLon,
                focusNodeDescription: _focusNodeDescription,
                textEditingControllerDescription:
                _textEditingControllerDescription,
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _onPressed(BuildContext context,) async {
    await Navigator.push(
      context,
      MaterialPageRoute<String>(
        builder: (context) => const SelectCategory(),
      ),
    );
  }
}
