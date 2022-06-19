import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/filters_screen/model/filters_screen_model.dart';

class CategoryIconTickChoice extends StatelessWidget {
  final String nameKey;

  const CategoryIconTickChoice(this.nameKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -4,
      right: -4,
      child: FiltersScreenModel.filterMap[nameKey]!
          ? SvgPicture.asset(
              SvgIcons.tickChoice,
              height: 25,
            )
          : const SizedBox.shrink(),
    );
  }
}
