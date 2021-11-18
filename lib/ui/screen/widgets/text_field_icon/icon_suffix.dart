import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/screen/widgets/text_field_icon/text_field_icon.dart';

class IconSuffix extends StatelessWidget {
  ///
  final TextFieldIcon textFieldIcon;

  const IconSuffix(this.textFieldIcon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return textFieldIcon.svgIconSuffix != null
        ? Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 12, 6),
            child: InkWell(
              onTap: textFieldIcon.actionIconSuffix,
              child: SvgPicture.asset(
                textFieldIcon.svgIconSuffix.toString(),
                height: textFieldIcon.heightIcon,
                color: textFieldIcon.svgIconSuffixColor,
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
