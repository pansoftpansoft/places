import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_screen_model.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/search_card_place.dart';
import 'package:provider/provider.dart';

///Список найденых мест
class ListFoundPlacesScreen extends StatelessWidget {
  ///
  const ListFoundPlacesScreen({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    debugPrint('100 ListOfFoundPlacesScreen ${mocksFiltered.length}');

    return Consumer<SearchScreenModel>(builder: (
      final context,
      final cart,
      final child,
    ) {
      return ListView.separated(
        itemCount: mocksSearchText.length,
        shrinkWrap: true,
        itemBuilder: (final context, final index) =>
            SearchCardPlace(mocksSearchText[index]),
        separatorBuilder: (
          final context,
          final index,
        ) =>
            const Padding(
          padding: EdgeInsets.fromLTRB(
            paddingPage + 56,
            0,
            0,
            0,
          ),
          child: Divider(
            height: 0.8,
          ),
        ),
      );
    });
  }
}
