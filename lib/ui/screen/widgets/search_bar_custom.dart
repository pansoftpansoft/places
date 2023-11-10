import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/search_places_screen/bloc/search_places_bloc.dart';
import 'package:places/ui/screen/widgets/text_field_icon/text_field_icon.dart';


///Поле поиска
class SearchBarCustom extends StatelessWidget {
  ///
  final TextEditingController? textEditingController;

  ///
  final bool autofocus;

  final FocusNode? focusNode;

  ///
  const SearchBarCustom({
    Key? key,
    this.textEditingController,
    this.autofocus = false,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SearchPlacesBloc, SearchPlacesState>(
        builder: (context, state) {
          debugPrint('state.stringSearch = ${state.stringSearch}');
          if (state.stringSearch.isNotEmpty) {
            textEditingController?.text = state.stringSearch;
          }

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
        },
      );

  void _textEditingControllerFunction(
    TextEditingController textEditingController,
    BuildContext context,
  ) {
    if (textEditingController.text.isNotEmpty) {
      if (textEditingController.text
              .substring(textEditingController.text.length - 1) ==
          ' ') {
        context.read<SearchInteractor>().setSearchText(
              textEditingController.text,
            );
      }
    } else {
      //Todo
      //context.read<FiltersScreenInteractor>().getDataFromRepository();
    }
  }

  void _actionOnSubmitted(
    String value,
    BuildContext context,
  ) {
    if (value.isNotEmpty) {
      context.read<SearchPlacesBloc>().add(
            SearchPlacesEvents.newSearch(
              stringSearch: value,
            ),
          );
    } else {
      context.read<SearchPlacesBloc>().add(const SearchPlacesEvents.load());
    }
  }

  void _actionOnChanged(
    String value,
    BuildContext context,
  ) {
    if (value[value.length - 1] == ' ') {
      debugPrint('Обработка пробела в строке поиска');
      context
          .read<SearchPlacesBloc>()
          .add(SearchPlacesEvents.newSearch(stringSearch: value));
    }
  }

  void _clearSearchBar(
    BuildContext context,
  ) {
    textEditingController!.clear();
    context.read<SearchPlacesBloc>().add(const SearchPlacesEvents.load());
  }
}
