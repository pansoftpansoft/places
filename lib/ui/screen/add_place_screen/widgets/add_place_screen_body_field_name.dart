import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/add_place_screen/bloc/add_place_bloc.dart';
import 'package:places/ui/screen/widgets/text_field_icon/text_field_icon.dart';

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
              actionOnSubmitted: (value) {
                context.read<AddPlaceBloc>().add(
                      AddPlaceEvents.onChangedFields(
                        place:
                            context.read<AddPlaceBloc>().state.place.copyWith(
                                  name: value,
                                ),
                      ),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
