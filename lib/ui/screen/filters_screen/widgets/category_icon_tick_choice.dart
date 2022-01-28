import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';

class CategoryIconTickChoice extends StatelessWidget {
  final TypePlace nameKey;

  const CategoryIconTickChoice(this.nameKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -4,
      right: -4,
      child: SearchFilterModel.filterMap[nameKey]!
          ? SvgPicture.asset(
              SvgIcons.tickChoice,
              height: 25,
            )
          : const SizedBox(
              height: 0,
              width: 0,
            ),
    );
  }
}
