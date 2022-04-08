import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/screen/widgets/text_field_icon/text_field_icon.dart';

///
class IconSuffixForText extends StatelessWidget {
  ///
  final TextFieldIcon textFieldIcon;

  ///
  const IconSuffixForText(this.textFieldIcon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return textFieldIcon.svgIconSuffixForText != null
        ? Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 12, 6),
            child: InkWell(
              onTap: textFieldIcon.actionIconSuffixForText,
              child: SvgPicture.asset(
                textFieldIcon.svgIconSuffixForText.toString(),
                height: textFieldIcon.heightIcon,
                color: textFieldIcon.svgIconSuffixForTextColor,
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
