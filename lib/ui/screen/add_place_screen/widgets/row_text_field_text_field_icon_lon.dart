import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/add_place_screen/bloc/add_place_bloc.dart';
import 'package:places/ui/screen/widgets/text_field_icon/text_field_icon.dart';
import 'package:provider/provider.dart';

class RowTextFieldTextFieldIconLon extends StatelessWidget {
  final TextEditingController _textEditingControllerLon;
  final FocusNode _focusNodeLon;
  final FocusNode _focusNodeDescription;

  const RowTextFieldTextFieldIconLon(
    this._textEditingControllerLon,
    this._focusNodeLon,
    this._focusNodeDescription, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFieldIcon(
        controller: _textEditingControllerLon,
        focusNode: _focusNodeLon,
        focusNodeNext: _focusNodeDescription,
        keyboardType: TextInputType.number,
        svgIconSuffixForText: SvgIcons.clear,
        svgIconSuffixForTextColor: Colors.black,
        borderRadius: borderRadiusCard8,
        actionIconSuffixForText: _textEditingControllerLon.clear,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp(r'^\d*?\.?\d*?$'),
          ),
        ],
        actionOnSubmitted: (value) {
          _focusNodeDescription.requestFocus();
          context.read<AddPlaceBloc>().add(
            AddPlaceEvents.onChangedFields(
              place: context.read<AddPlaceBloc>().state.place.copyWith(
                lng: double.parse(value),
              ),
            ),
          );
        },
      ),
    );
  }
}
