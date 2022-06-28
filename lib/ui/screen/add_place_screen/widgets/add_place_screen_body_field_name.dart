import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/add_place_screen/models/add_place_model.dart';
import 'package:places/ui/screen/widgets/text_field_icon/text_field_icon.dart';
import 'package:provider/provider.dart';

class AddPlaceScreenBodyFieldName extends StatelessWidget {
  final TextEditingController _textEditingControllerNamePlace;
  final FocusNode _focusNodeNamePlace;
  final FocusNode _focusNodeLat;

  const AddPlaceScreenBodyFieldName({
    Key? key,
    required TextEditingController textEditingControllerNamePlace,
    required FocusNode focusNodeNamePlace,
    required FocusNode focusNodeLat,
  })  : _textEditingControllerNamePlace = textEditingControllerNamePlace,
        _focusNodeNamePlace = focusNodeNamePlace,
        _focusNodeLat = focusNodeLat,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFieldIcon(
              controller: _textEditingControllerNamePlace,
              focusNode: _focusNodeNamePlace,
              focusNodeNext: _focusNodeLat,
              svgIconSuffixForText: SvgIcons.clear,
              svgIconSuffixForTextColor: Colors.black,
              borderRadius: borderRadiusCard8,
              actionIconSuffixForText: _textEditingControllerNamePlace.clear,
              actionOnSubmitted: (final value) {
                context.read<AddPlaceModel>().disableButtonCreate(value);
                _focusNodeLat.requestFocus();
              },
            ),
          ),
        ],
      ),
    );
  }
}
