import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/select_category/widgets/select_element_list.dart';

///
class SelectElementListRow extends StatelessWidget {
  final SelectElementList widget;

  const SelectElementListRow({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          typePlaceString(widget.typePlace),
          style: Theme.of(context).textTheme.headline4!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
        ),
        if (widget.typePlaceSelected == widget.typePlace)
          SvgPicture.asset(
            SvgIcons.tick,
            color: ColorPalette.greenColor,
          ),
      ],
    );
  }
}
