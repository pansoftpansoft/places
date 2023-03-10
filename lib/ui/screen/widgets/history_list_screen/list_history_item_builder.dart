import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/data/interactor/search_screen_interactor.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/search_places_screen/bloc/search_places_bloc.dart';


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

    context
        .read<SearchPlacesBloc>()
        .add(SearchPlacesEvents.deleteHistoryWord(indexHistoryText: index));

    // await context
    //     .read<SearchScreenInteractor>()
    //     .deleteHistory(SearchScreenInteractor.listHistory[index].historyText);
  }

  void _onSelectWord(
    int index,
    BuildContext context,
  ) {
    final stringSearch =
        context.read<SearchPlacesBloc>().state.listHistory[index].historyText;


    debugPrint('stringSearch = $stringSearch');
    context
        .read<SearchPlacesBloc>()
        .add(SearchPlacesEvents.newSearch(stringSearch: stringSearch));

    //StoreProvider.of<AppState>(context).dispatch(StartFindAction(SearchScreenInteractor.listHistory[index].historyText));
  }
}
