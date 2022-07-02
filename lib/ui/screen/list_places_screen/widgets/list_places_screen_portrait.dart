import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/img.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/filters_screen/model/filters_screen_model.dart';
import 'package:places/ui/screen/list_places_screen/models/list_places_screen_model.dart';
import 'package:places/ui/screen/list_places_screen/widgets/sticky_header.dart';
import 'package:places/ui/screen/widgets/card_place/card_place.dart';
import 'package:provider/provider.dart';

class ListPlacesScreenPortrait extends StatelessWidget {
  const ListPlacesScreenPortrait({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FiltersScreenModel>(builder: (
      final context,
      final cart,
      final child,
    ) {
      return StreamBuilder<Place>(
        stream: ListPlacesScreenModel.streamControllerListPlace.stream,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: paddingPage,
            ),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  delegate: StickyHeader(),
                  pinned: true,
                ),
                SliverToBoxAdapter(
                  child: snapshot.connectionState == ConnectionState.waiting
                      ? Padding(
                          padding: const EdgeInsets.only(
                            top: heightSizeBox12,
                            bottom: iconSize29,
                          ),
                          child: Image.asset(
                            ellipse107,
                            height: iconSize29,
                            width: iconSize29,
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (
                      final context,
                      final index,
                    ) {
                      debugPrint(
                        ' mocksFiltered[$index].isFavorites = '
                        '${mocksFiltered[index].isFavorites}',
                      );

                      return CardPlace(mocksFiltered[index]);
                    },
                    childCount: mocksFiltered.length,
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
