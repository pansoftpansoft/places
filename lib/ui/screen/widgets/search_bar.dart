import 'package:flutter/material.dart';
import 'package:places/domain/db_provider.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:places/ui/screen/widgets/text_field_icon/text_field_icon.dart';
import 'package:provider/provider.dart';

///Поле поиска
class SearchBar extends StatelessWidget {
  ///
  final TextEditingController? textEditingController;

  ///
  final bool autofocus;

  final FocusNode? focusNode;

  ///
  const SearchBar({
    final Key? key,
    this.textEditingController,
    this.autofocus = false,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) =>
      Consumer<SearchFilterModel>(builder: (
        final context,
        final cart,
        final child,
      ) {
        return SizedBox(
          height: heightTextFieldSearch,
          child: TextFieldIcon(
            labelText: search,
            controller: textEditingController,
            autofocus: autofocus,
            focusNode: focusNode,
            textEditingControllerFunction: (final _textEditingController) {
              _textEditingControllerFunction(_textEditingController, context);
            },
            borderRadius: borderRadiusCard12,
            svgIconSuffix: SvgIcons.filter,
            svgIconSuffixColor: ColorPalette.greenColor,
            actionIconSuffix: () {
              _actionIconSuffix(context);
            },
            svgIconSuffixForText: SvgIcons.clear,
            svgIconSuffixForTextColor: Colors.black,
            actionIconSuffixForText: () {
              textEditingController!.clear();
              context.read<SearchFilterModel>().searchPlaceForDynamicText('');
            },
            svgIconPrefix: SvgIcons.search,
            svgIconPrefixColor: ColorPalette.textInTextField,
            borderColor: Colors.transparent,
            fillColor: ColorPalette.filledTextField,
            actionOnSubmitted: (final value) {
              _actionOnSubmitted(value, context);
            },
            onChanged: (final value) {
              _actionOnChanged(value, context);
            },
          ),
        );
      });

  void _textEditingControllerFunction(
    TextEditingController _textEditingController,
    BuildContext context,
  ) {
    if (_textEditingController.text.isNotEmpty) {
      if (_textEditingController.text
              .substring(_textEditingController.text.length - 1) ==
          ' ') {
        context.read<SearchFilterModel>().searchPlaceForDynamicText(
              _textEditingController.text,
            );
      }
    } else {
      //context.read<SearchFilterModel>().searchPlaceForDynamicText('');
      context.read<SearchFilterModel>()
        ..countFilteredPlaces()
        ..saveFilterSettings();
    }
  }

  void _actionIconSuffix(
    BuildContext context,
  ) {
    Navigator.pushNamed(context, RouteName.filtersScreen);
  }

  void _actionOnSubmitted(
    String value,
    BuildContext context,
  ) {
    //Записали новое слово поиска в базу
    DBProvider.dbProvider.addHistory(value);
    //Обновляем список при загрузке
    SearchFilterModel.getListHistory();
    //Подготовка Отображаем найденые места
    debugPrint(value);
    context.read<SearchFilterModel>()
      ..searchPlaceForDynamicText(value)
      ..countFilteredPlaces()
      ..getFilteredList()
      ..managerSelectionScreen(numberScreen: ScreenEnum.listFoundPlacesScreen)
      ..changeSearch();
  }

  void _actionOnChanged(
    String value,
    BuildContext context,
  ) {
    if (value[value.length - 1] == ' ') {
      debugPrint('Обработка пробела в строке поиска');
      context.read<SearchFilterModel>()
        ..searchPlaceForDynamicText(value)
        ..countFilteredPlaces()
        ..getFilteredList()
        ..managerSelectionScreen(numberScreen: ScreenEnum.listFoundPlacesScreen)
        ..changeSearch();
    }
  }
}
