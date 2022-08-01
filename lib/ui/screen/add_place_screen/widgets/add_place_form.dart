import 'package:flutter/material.dart';
import 'package:places/data/model/place_dto.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_place_screen/widgets/add_place_screen_body.dart';

class AddPlaceForm extends StatelessWidget {
  final PlaceDto? placeDto;

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
    this.placeDto,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) => SingleChildScrollView(
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
            textEditingControllerDescription: _textEditingControllerDescription,
          ),
        ),
      );
}
