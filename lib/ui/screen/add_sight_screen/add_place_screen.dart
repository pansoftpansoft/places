import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/add_place_screen_body.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/add_place_app_bar.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/bottom_sheet_create_button.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/photo_show_dialog.dart';

///Экран добавления карточек
class AddPlaceScreen extends StatefulWidget {
  /// Конструктор
  const AddPlaceScreen({final Key? key}) : super(key: key);

  @override
  FiltersScreenState createState() => FiltersScreenState();
}

/// Стейт
class FiltersScreenState extends State<AddPlaceScreen> {
  final FocusNode _focusNodeNamePlace = FocusNode();
  final FocusNode _focusNodeLat = FocusNode();
  final FocusNode _focusNodeLon = FocusNode();
  final FocusNode _focusNodeDescription = FocusNode();

  final TextEditingController _textEditingControllerNamePlace =
      TextEditingController();

  final TextEditingController _textEditingControllerLat =
      TextEditingController();

  final TextEditingController _textEditingControllerLon =
      TextEditingController();

  final TextEditingController _textEditingControllerDescription =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    Future(() {
      showDialog<void>(
        context: context,
        builder: (final context) => const PhotoShowDialog(),
      );
    });
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        bottomSheet: const BottomSheetCreateButton(),
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: AddPlaceAppBar(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(paddingPage),
            child: AddPlaceScreenBody(
              textEditingControllerNamePlace: _textEditingControllerNamePlace,
              focusNodeNamePlace: _focusNodeNamePlace,
              focusNodeLat: _focusNodeLat,
              textEditingControllerLat: _textEditingControllerLat,
              focusNodeLon: _focusNodeLon,
              textEditingControllerLon: _textEditingControllerLon,
              focusNodeDescription: _focusNodeDescription,
              textEditingControllerDescription:
                  _textEditingControllerDescription,
            ),
          ),
        ),
      );
}
