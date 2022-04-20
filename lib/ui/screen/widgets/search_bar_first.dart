import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:provider/provider.dart';

import '../../res/route_name.dart';

///Поле поиска
class SearchBarFirst extends StatelessWidget {
  ///
  final TextEditingController? textEditingController;

  ///
  final bool autofocus;

  ///
  const SearchBarFirst({
    final Key? key,
    this.textEditingController,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: heightTextFieldSearch,
      child: Container(
        decoration: const BoxDecoration(
          color: ColorPalette.filledTextField,
          borderRadius: BorderRadius.all(
            Radius.circular(
              borderRadiusCard12,
            ),
          ),
        ),
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              SvgIcons.search,
              height: 30,
              color: ColorPalette.textInTextField,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  _go(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.transparent,
                  child: const Text(search),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _actionIconSuffix(context);
              },
              icon: SvgPicture.asset(
                SvgIcons.filter,
                height: 30,
                color: ColorPalette.greenColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _actionIconSuffix(
    BuildContext context,
  ) {
    ///Чистим строку поиска
    SearchFilterModel.textEditingControllerFind.clear();
    Navigator.pushNamed(context, RouteName.filtersScreen);
  }

  void _go(BuildContext context) {
    debugPrint('Хочу перейти на поиск ${RouteName.sightSearchScreen}');

    if (SearchFilterModel.listHistory.isEmpty) {
      ///Чистим строку поиска
      context.read<SearchFilterModel>()
        ..searchPlaceForDynamicText('')
        ..countFilteredPlaces()
        ..getFilteredList()
        ..managerSelectionScreen(
            numberScreen: ScreenEnum.listFoundPlacesScreen);
    } else {
      ///Чистим строку поиска
      context.read<SearchFilterModel>()
        ..searchPlaceForDynamicText('')
        ..countFilteredPlaces()
        ..getFilteredList()
        ..managerSelectionScreen(numberScreen: ScreenEnum.listSearchWords);
    }
    Navigator.pushNamed(context, RouteName.sightSearchScreen);
  }
}
