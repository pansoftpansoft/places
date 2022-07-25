import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/data/interactor/search_screen_interactor.dart';
import 'package:places/domain/db_provider.dart';
import 'package:places/redux/action/search_places_screen_actions.dart';
import 'package:places/redux/state/app_state.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
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
    Key? key,
    this.textEditingController,
    this.autofocus = false,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Consumer<SearchScreenInteractor>(builder: (
        context,
        cart,
        child,
      ) {
        return SizedBox(
          height: heightTextFieldSearch,
          child: TextFieldIcon(
            labelText: search,
            controller: textEditingController,
            autofocus: autofocus,
            focusNode: focusNode,
            textEditingControllerFunction: (textEditingController) {
              _textEditingControllerFunction(textEditingController, context);
            },
            borderRadius: borderRadiusCard12,
            svgIconSuffixForText: SvgIcons.clear,
            svgIconSuffixForTextColor: Colors.black,
            actionIconSuffixForText: () {
              _clearSearchBar(context);
            },
            svgIconPrefix: SvgIcons.search,
            svgIconPrefixColor: ColorPalette.textInTextField,
            //borderColor: Colors.transparent,
            fillColor: ColorPalette.filledTextField,
            actionOnSubmitted: (value) {
              _actionOnSubmitted(value, context);
            },
            onChanged: (value) {
              _actionOnChanged(value, context);
            },
          ),
        );
      });

  void _textEditingControllerFunction(
    TextEditingController textEditingController,
    BuildContext context,
  ) {
    if (textEditingController.text.isNotEmpty) {
      if (textEditingController.text
              .substring(textEditingController.text.length - 1) ==
          ' ') {
        context.read<SearchScreenInteractor>().setSearchText(
              textEditingController.text,
            );
      }
    } else {
      context.read<FiltersScreenInteractor>().getDataFromRepository();
    }
  }

  void _actionOnSubmitted(
    String value,
    BuildContext context,
  ) {
    //Записали новое слово поиска в базу
    DBProvider.dbProvider.addHistory(value);
    //Обновляем список при загрузке
    SearchScreenInteractor.getListHistory();
    //Подготовка Отображаем найденые места
    debugPrint('value = $value');
    if (value.isEmpty) {
      StoreProvider.of<AppState>(context).dispatch(ShowEmptyScreeAction());
    } else {
      StoreProvider.of<AppState>(context).dispatch(StartFindAction(value));
    }
  }

  void _actionOnChanged(
    String value,
    BuildContext context,
  ) {
    if (value[value.length - 1] == ' ') {
      debugPrint('Обработка пробела в строке поиска');
      StoreProvider.of<AppState>(context).dispatch(StartFindAction(value));
    }
  }

  void _clearSearchBar(
    BuildContext context,
  ) {
    textEditingController!.clear();
    StoreProvider.of<AppState>(context).dispatch(
      OpenSearchPlacesScreenAction(),
    );
  }
}
