import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/screen/widgets/text_field_icon/text_field_icon.dart';

class IconPrefix extends StatelessWidget {
  final TextFieldIcon textFieldIcon;

  const IconPrefix(this.textFieldIcon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return textFieldIcon.svgIconPrefix != null
        ? Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 12, 6),
            child: InkWell(
              child: SvgPicture.asset(
                textFieldIcon.svgIconPrefix.toString(),
                height: textFieldIcon.heightIcon,
                color: textFieldIcon.svgIconPrefixColor,
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
