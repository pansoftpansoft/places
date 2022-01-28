import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/sight_card_search.dart';

///Список найденых мест
class ListOfFoundPlacesScreen extends StatelessWidget {
  ///
  const ListOfFoundPlacesScreen({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => ListView.separated(
        itemCount: mocksSearch.length,
        shrinkWrap: true,
        itemBuilder: (final BuildContext context, final int index) =>
            SightCardSearch(mocksSearch[index]),
        separatorBuilder: (
          final BuildContext context,
          final int index,
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
}