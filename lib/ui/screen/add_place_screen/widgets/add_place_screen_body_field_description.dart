import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/widgets/text_field_icon/text_field_icon.dart';

class AddPlaceScreenBodyFieldDescription extends StatelessWidget {
  final TextEditingController? textEditingControllerDescription;
  final FocusNode? focusNodeDescription;

  const AddPlaceScreenBodyFieldDescription({
    Key? key,
    this.textEditingControllerDescription,
    this.focusNodeDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFieldIcon(
              controller: textEditingControllerDescription,
              focusNode: focusNodeDescription,
              svgIconSuffixForText: SvgIcons.clear,
              svgIconSuffixForTextColor: Colors.black,
              borderRadius: borderRadiusCard8,
              maxLines: maxLines5,
              actionIconSuffixForText: textEditingControllerDescription!.clear,
              actionOnSubmitted: (value) {
                focusNodeDescription!.unfocus();
              },
            ),
          ),
        ],
      ),
    );
  }
}
