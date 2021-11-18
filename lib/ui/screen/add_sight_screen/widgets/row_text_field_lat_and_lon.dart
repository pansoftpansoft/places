import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/widgets/text_field_icon/text_field_icon.dart';

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
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFieldIcon(
            controller: _textEditingControllerLat,
            focusNode: _focusNodeLat,
            focusNodeNext: _focusNodeLon,
            keyboardType: TextInputType.number,
            svgIconSuffixForText: SvgIcons.clear,
            svgIconSuffixForTextColor: Colors.black,
            borderRadius: 8,
            actionIconSuffixForText: _textEditingControllerLat.clear,
            inputFormatters: <FilteringTextInputFormatter>[
              FilteringTextInputFormatter.allow(
                RegExp(r'^\d*?\.?\d*?$'),
              ),
            ],
            actionOnSubmitted: (final value) {
              _focusNodeLon.requestFocus();
            },
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: TextFieldIcon(
            controller: _textEditingControllerLon,
            focusNode: _focusNodeLon,
            focusNodeNext: _focusNodeDescription,
            keyboardType: TextInputType.number,
            svgIconSuffixForText: SvgIcons.clear,
            svgIconSuffixForTextColor: Colors.black,
            borderRadius: 8,
            actionIconSuffixForText: _textEditingControllerLon.clear,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(
                RegExp(r'^\d*?\.?\d*?$'),
              ),
            ],
            actionOnSubmitted: (final value) {
              _focusNodeDescription.requestFocus();
            },
          ),
        ),
      ],
    );
  }
}
