import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/search_places_screen/bloc/search_places_bloc.dart';

class ListHistoryItemBuilder extends StatelessWidget {
  final int _index;
  final String _world;

  const ListHistoryItemBuilder(
    this._index,
    this._world, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Удалаем строку истории! _index = $_index _world = _world');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: () {
              _onSelectWord(_world, context);
            },
            child: Text(
              _world,
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
              _onDeleteWord(_index, context);
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
    debugPrint('Удалаем строку истории! id = $index');

    context
        .read<SearchPlacesBloc>()
        .add(SearchPlacesEvents.deleteHistoryWord(historyWordId: index));
  }

  void _onSelectWord(
    final String word,
    BuildContext context,
  ) {
    debugPrint('stringSearch = $word');
    context
        .read<SearchPlacesBloc>()
        .add(SearchPlacesEvents.newSearch(stringSearch: word));
  }
}
