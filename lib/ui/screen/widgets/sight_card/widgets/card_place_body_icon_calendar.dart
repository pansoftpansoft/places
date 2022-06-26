import 'package:flutter/material.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/widgets/icon_button_special.dart';

class CardPlaceBodyIconCalendar extends StatelessWidget {
  final String goNeed;
  final VoidCallback? wantToVisit;

  const CardPlaceBodyIconCalendar(
    this.goNeed,
    this.wantToVisit, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 59,
      top: 2,
      child: goNeed != ''
          ? IconButtonSpecial(
              SvgIcons.calendar,
              onPressed: wantToVisit,
            )
          : const SizedBox(width: 0),
    );
  }
}
