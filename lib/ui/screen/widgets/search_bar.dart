import 'package:flutter/material.dart';
import 'package:places/domain/database.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/sight_search_screen/model/search_filter_model.dart';
import 'package:places/ui/screen/widgets/text_field_icon.dart';
import 'package:provider/provider.dart';

/*
Поле поиска
 */
class SearchBar extends StatelessWidget {
  final TextEditingController? textEditingController;
  final bool autofocus;

  SearchBar({
    Key? key,
    TextEditingController? this.textEditingController,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.heightTextFieldSearch,
      child: TextFieldIcon(
        labelText: Labels.search,
        textAlignVertical: TextAlignVertical.center,
        controller: textEditingController,
        autofocus: autofocus,
        textEditingControllerFunction:
            (TextEditingController _textEditingController) {
          if (_textEditingController.text.isNotEmpty) {
            if (_textEditingController.text
                    .substring(_textEditingController.text.length - 1) ==
                ' ') {
              var _searchFilterModel = context.read<SearchFilterModel>();
              _searchFilterModel.SearchPlaceForDynamicText(
                  _textEditingController.text);
            }
          } else {
            var _searchFilterModel = context.read<SearchFilterModel>();
            _searchFilterModel.SearchPlaceForDynamicText('');
          }
        },
        borderRadius: 12,
        svgIconSuffix: SvgIcons.filter,
        svgIconSuffixColor: ColorPalette.greenColor,
        actionIconSuffix: () {
          Navigator.push(
            context,
            MaterialPageRoute<Route>(
              builder: (BuildContext context) => FiltersScreen(),
            ),
          );
        },
        svgIconSuffixForText: SvgIcons.clear,
        svgIconSuffixForTextColor: Colors.black,
        actionIconSuffixForText: () {
          textEditingController!.clear();
          var _searchFilterModel = context.read<SearchFilterModel>();
          _searchFilterModel.SearchPlaceForDynamicText('');
        },
        svgIconPrefix: SvgIcons.search,
        svgIconPrefixColor: ColorPalette.textInTextField,
        borderColor: Colors.transparent,
        fillColor: ColorPalette.filledTextField,
        actionOnSubmitted: (String value) {
          var _searchFilterModel = context.read<SearchFilterModel>();
          _searchFilterModel.SearchPlaceForDynamicText(value);
          //добавим введенную строку поиска в историю
          DBProvider.db!.addHistory(value);
        },
      ),
    );
  }
}
