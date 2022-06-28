import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/search_places_screen/widgets/empty_screen.dart';

class SearchPlacesScreenBodySwitchNotFound extends StatelessWidget {
  const SearchPlacesScreenBodySwitchNotFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EmptyScreen(
      textHeader: nothingWasFound,
      textComment: tryChangingTheSearchParameter,
      svgIcon: SvgIcons.search,
      colorTextAll: ColorPalette.dmFontSubtitle2,
    );
  }
}
