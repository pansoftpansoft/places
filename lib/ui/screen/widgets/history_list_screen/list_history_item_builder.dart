import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:provider/provider.dart';

class ListHistoryItemBuilder extends StatelessWidget {
  final int index;

  const ListHistoryItemBuilder(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _onDeleteWord(index, context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              _onSelectWord(index, context);
            },
            child: Text(
              SearchFilterModel.listHistory[index].historyText,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: ColorPalette.lmFontSubtitle2),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () {
              _onDeleteWord(index, context);
            },
            child: SvgPicture.asset(
              SvgIcons.delete,
              height: 24,
              color: ColorPalette.lmFontSubtitle2,
            ),
          ),
        ],
      ),
    );
  }

  // удаляем слово из истории поиска
  Future<void> _onDeleteWord(
    int index,
    BuildContext context,
  ) async {
    debugPrint('Удалаем строку истории!');

    context
        .read<SearchFilterModel>()
        .deleteHistory(SearchFilterModel.listHistory[index].historyText);

    //Обновляем список при удалении строки из поиска
    await SearchFilterModel.getListHistory().then((value) {
      if (SearchFilterModel.listHistory.isEmpty) {
        context.read<SearchFilterModel>()
          ..setSearchText('')
          ..managerSelectionScreen(numberScreen: ScreenEnum.cleanScreen)
          ..notifyListenersSearchScreen();
        debugPrint('Удалаем строку истории! 1');
      } else {
        context.read<SearchFilterModel>()
          ..setSearchText('')
          ..managerSelectionScreen(numberScreen: ScreenEnum.listSearchWords)
          ..notifyListenersSearchScreen();
        debugPrint('Удалаем строку истории! 2');
      }
    });
  }

  void _onSelectWord(
    int index,
    BuildContext context,
  ) {
    context.read<SearchFilterModel>()
      ..setSearchText(
          SearchFilterModel.listHistory[index].historyText)
      ..getSearchTextList()
      ..managerSelectionScreen(numberScreen: ScreenEnum.listFoundPlacesScreen)
      ..changeSearch();
  }
}
