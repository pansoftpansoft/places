import 'package:flutter/material.dart';
import 'package:places/domain/database.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/filters_screen/filters_screen.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:places/ui/screen/widgets/text_field_icon.dart';
import 'package:provider/provider.dart';

///Поле поиска
class SearchBar extends StatelessWidget {
  ///
  const SearchBar({
    final Key? key,
    this.textEditingController,
    this.autofocus = false,
  }) : super(key: key);

  ///
  final TextEditingController? textEditingController;

  ///
  final bool autofocus;

  @override
  Widget build(final BuildContext context) => SizedBox(
        height: heightTextFieldSearch,
        child: TextFieldIcon(
          labelText: search,
          controller: textEditingController,
          autofocus: autofocus,
          textEditingControllerFunction:
              (final TextEditingController _textEditingController) {
            if (_textEditingController.text.isNotEmpty) {
              if (_textEditingController.text
                      .substring(_textEditingController.text.length - 1) ==
                  ' ') {
                context.read<SearchFilterModel>().searchPlaceForDynamicText(
                      _textEditingController.text,
                    );
              }
            } else {
              context.read<SearchFilterModel>().searchPlaceForDynamicText('');
            }
          },
          borderRadius: 12,
          svgIconSuffix: SvgIcons.filter,
          svgIconSuffixColor: ColorPalette.greenColor,
          actionIconSuffix: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (final BuildContext context) => const FiltersScreen(),
              ),
            );
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
          actionOnSubmitted: (final String value) {
            context.read<SearchFilterModel>().searchPlaceForDynamicText(value);
            //добавим введенную строку поиска в историю
            DBProvider.db.addHistory(value);
          },
        ),
      );
}
