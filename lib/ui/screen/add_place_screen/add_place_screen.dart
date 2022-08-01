import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/data/model/place_dto.dart';
import 'package:places/ui/screen/add_place_screen/add_place_screen_widget_model.dart';
import 'package:places/ui/screen/add_place_screen/widgets/add_place_app_bar.dart';
import 'package:places/ui/screen/add_place_screen/widgets/add_place_error_widget.dart';
import 'package:places/ui/screen/add_place_screen/widgets/add_place_form.dart';
import 'package:places/ui/screen/add_place_screen/widgets/bottom_sheet_create_button.dart';
import 'package:places/ui/screen/add_place_screen/widgets/loading_widget.dart';


///Экран добавления карточек
class AddPlaceScreen extends ElementaryWidget<IAddPlaceScreenWidgetModel> {
  /// Конструктор add_place_screen_widget_model
  const AddPlaceScreen({
    Key? key,
    WidgetModelFactory wmFactory = addPlaceScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IAddPlaceScreenWidgetModel wm) {
    debugPrint('Start AddPlaceScreen');

    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomSheet: const BottomSheetCreateButton(),
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: AddPlaceAppBar(),
      ),
      body: EntityStateNotifierBuilder<PlaceDto>(
        listenableEntityState: wm.placeState,
        loadingBuilder: (_, __) => const LoadingWidget(),
        errorBuilder: (_, __, ___) => const AddPlaceErrorWidget(),
        builder: (_, placeDto) {
          return AddPlaceForm(placeDto: placeDto); //_AddPlaceScreen();
        },
      ),
    );
  }
}

