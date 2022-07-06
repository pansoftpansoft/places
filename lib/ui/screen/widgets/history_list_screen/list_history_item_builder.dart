import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/list_places_screen/models/list_places_screen_model.dart';
import 'package:places/ui/screen/search_places_screen/models/search_screen_model.dart';
import 'package:provider/provider.dart';

class ListHistoryItemBuilder extends StatelessWidget {
  final int index;

  const ListHistoryItemBuilder(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: () {
              _onSelectWord(index, context);
            },
            child: Text(
              SearchScreenModel.listHistory[index].historyText,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: ColorPalette.lmFontSubtitle2),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 24,
          width: 50,
          child: InkWell(
            splashColor: Colors.blue,
            onTap: () {
              _onDeleteWord(index, context);
            },
            child: SvgPicture.asset(
              SvgIcons.delete,
              height: 24,
              width: 24,
              color: ColorPalette.lmFontSubtitle2,
            ),
          ),
        ),
      ],
    );
  }

  // удаляем слово из истории поиска
  Future<void> _onDeleteWord(
    int index,
    BuildContext context,
  ) async {
    debugPrint('Удалаем строку истории!');

    await context
        .read<SearchScreenModel>()
        .deleteHistory(SearchScreenModel.listHistory[index].historyText);

    //Обновляем список при удалении строки из поиска
    await SearchScreenModel.getListHistory().then((value) {
      if (SearchScreenModel.listHistory.isEmpty) {
        context.read<SearchScreenModel>()
          ..setSearchText('')
          ..managerSelectionScreen(numberScreen: ScreenEnum.cleanScreen)
          ..notifyListenersSearchScreen();
        debugPrint('Удалаем строку истории! 1');
      } else {
        context.read<SearchScreenModel>()
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
    context.read<SearchScreenModel>()
      ..setSearchText(
        SearchScreenModel.listHistory[index].historyText,
      )
      ..getListSearchText(
        context.read<ListPlacesScreenModel>().streamControllerListPlace,
      )
      ..managerSelectionScreen(numberScreen: ScreenEnum.listFoundPlacesScreen)
      ..changeSearch();
  }
}
