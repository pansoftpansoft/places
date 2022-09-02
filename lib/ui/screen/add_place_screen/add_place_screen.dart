import 'package:flutter/material.dart';
import 'package:places/ui/screen/add_place_screen/widgets/add_place_app_bar.dart';
import 'package:places/ui/screen/add_place_screen/widgets/add_place_form.dart';
import 'package:places/ui/screen/add_place_screen/widgets/bottom_sheet_create_button.dart';

///Экран добавления карточек
class AddPlaceScreen extends StatelessWidget {
  /// Конструктор add_place_screen_widget_model
  const AddPlaceScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Start AddPlaceScreen');

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
