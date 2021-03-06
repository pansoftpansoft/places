import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/data/interactor/search_screen_interactor.dart';
import 'package:places/redux/action/search_places_screen_actions.dart';
import 'package:places/redux/state/app_state.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/svg_icons.dart';
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
              SearchScreenInteractor.listHistory[index].historyText,
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
        .read<SearchScreenInteractor>()
        .deleteHistory(SearchScreenInteractor.listHistory[index].historyText);

    //Обновляем список при удалении строки из поиска
    await SearchScreenInteractor.getListHistory().then((value) {
      if (SearchScreenInteractor.listHistory.isEmpty) {
        context.read<SearchScreenInteractor>()
          ..setSearchText('')
          ..clearHistory();
        StoreProvider.of<AppState>(context).dispatch(OpenSearchPlacesScreenAction());
        debugPrint('Удалаем строку истории! 1');
      } else {
        context.read<SearchScreenInteractor>()
          ..setSearchText('')
          ..managerSelectionScreen(numberScreen: ScreenEnum.listSearchWords);
        debugPrint('Удалаем строку истории! 2');
      }
    });

  }

  void _onSelectWord(
    int index,
    BuildContext context,
  ) {
    StoreProvider.of<AppState>(context).dispatch(StartFindAction(SearchScreenInteractor.listHistory[index].historyText));
  }
}
