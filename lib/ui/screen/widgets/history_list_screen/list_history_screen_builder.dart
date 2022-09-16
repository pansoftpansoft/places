import 'package:flutter/material.dart';
import 'package:places/data/interactor/search_screen_interactor.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/widgets/history_list_screen/list_history.dart';
import 'package:provider/provider.dart';

class ListHistoryScreenBuilder extends StatelessWidget {
  const ListHistoryScreenBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          youLooking,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                color: ColorPalette.lmFontSubtitle2.withOpacity(opacityText),
              ),
        ),
        const Flexible(child: ListHistory()),
        TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          onPressed: () {
            _onPressed(context);
          },
          child: Text(
            clearHistory,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: ColorPalette.greenColor),
          ),
        ),
      ],
    );
  }

  ///Чистим всю историю и показываем пустой экран
  void _onPressed(BuildContext context) {
    context.read<SearchScreenInteractor>()
      ..setSearchText('')
      ..clearHistory();

    // StoreProvider.of<AppState>(context)
    //     .dispatch(OpenSearchPlacesScreenAction());
  }
}
