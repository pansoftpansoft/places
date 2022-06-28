import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_place_screen/widgets/row_text_field_text_field_icon_lat.dart';
import 'package:places/ui/screen/add_place_screen/widgets/row_text_field_text_field_icon_lon.dart';

///
class RowTextFieldLatAndLon extends StatelessWidget {
  final TextEditingController _textEditingControllerLat;
  final FocusNode _focusNodeLat;
  final FocusNode _focusNodeLon;
  final TextEditingController _textEditingControllerLon;
  final FocusNode _focusNodeDescription;

  const RowTextFieldLatAndLon({
    Key? key,
    required TextEditingController textEditingControllerLat,
    required FocusNode focusNodeLat,
    required FocusNode focusNodeLon,
    required TextEditingController textEditingControllerLon,
    required FocusNode focusNodeDescription,
  })  : _textEditingControllerLat = textEditingControllerLat,
        _focusNodeLat = focusNodeLat,
        _focusNodeLon = focusNodeLon,
        _textEditingControllerLon = textEditingControllerLon,
        _focusNodeDescription = focusNodeDescription,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSizeBox40,
      child: Row(
        children: <Widget>[
          RowTextFieldTextFieldIconLat(
            _textEditingControllerLat,
            _focusNodeLat,
            _focusNodeLon,
          ),
          const SizedBox(
            width: paddingPage,
          ),
          RowTextFieldTextFieldIconLon(
            _textEditingControllerLon,
            _focusNodeLon,
            _focusNodeDescription,
          ),
        ],
      ),
    );
  }
}
