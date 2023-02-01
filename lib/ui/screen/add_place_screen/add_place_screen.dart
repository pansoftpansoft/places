import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/screen/add_place_screen/bloc/add_place_bloc.dart';
import 'package:places/ui/screen/add_place_screen/widgets/add_place_app_bar.dart';
import 'package:places/ui/screen/add_place_screen/widgets/add_place_form.dart';
import 'package:places/ui/screen/add_place_screen/widgets/bottom_sheet_create_button.dart';
import 'package:provider/provider.dart';

///Экран добавления карточек
class AddPlaceScreen extends StatelessWidget {
  /// Конструктор add_place_screen_widget_model
  const AddPlaceScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Start AddPlaceScreen');

    context.read<AddPlaceBloc>().add(
      const AddPlaceEvents.load(
        place: Place(),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomSheet: const BottomSheetCreateButton(),
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: AddPlaceAppBar(),
      ),
      body: AddPlaceForm(), //_AddPlaceScreen();
    );
  }
}
