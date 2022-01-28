import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/widgets/text_field_icon/text_field_icon.dart';

class RowTextFieldTextFieldIconLat extends StatelessWidget {
  final TextEditingController _textEditingControllerLat;
  final FocusNode _focusNodeLat;
  final FocusNode _focusNodeLon;

  const RowTextFieldTextFieldIconLat(
    this._textEditingControllerLat,
    this._focusNodeLat,
    this._focusNodeLon, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFieldIcon(
        controller: _textEditingControllerLat,
        focusNode: _focusNodeLat,
        focusNodeNext: _focusNodeLon,
        keyboardType: TextInputType.number,
        svgIconSuffixForText: SvgIcons.clear,
        svgIconSuffixForTextColor: Colors.black,
        borderRadius: borderRadiusCard8,
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
    );
  }
}
