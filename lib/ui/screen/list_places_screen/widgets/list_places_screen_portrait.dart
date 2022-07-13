import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/store/list_places/list_places_store.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/img.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/list_places_screen/widgets/sticky_header.dart';
import 'package:places/ui/screen/widgets/card_place/card_place.dart';
import 'package:provider/provider.dart';

class ListPlacesScreenPortrait extends StatefulWidget {
  const ListPlacesScreenPortrait({
    Key? key,
  }) : super(key: key);

  @override
  State<ListPlacesScreenPortrait> createState() =>
      _ListPlacesScreenPortraitState();
}

class _ListPlacesScreenPortraitState extends State<ListPlacesScreenPortrait> {
  late ListPlacesStore _store;

  @override
  void initState() {
    super.initState();
    _store = ListPlacesStore(context.read<PlaceRepository>());
    _store.getListPlace();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FiltersScreenInteractor>(
      builder: (
        final context,
        final cart,
        final child,
      ) { return
            Provider<ListPlacesStore>(
              create: (_) => _store,
              child: Observer(
                builder: (_) {
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
                        if (_store.getListPlaceFuture?.status ==
                            FutureStatus.pending)
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: heightSizeBox12,
                                bottom: iconSize29,
                              ),
                              child: Image.asset(
                                ellipse107,
                                height: iconSize29,
                                width: iconSize29,
                              ),
                            ),
                          )
                        else
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
              ),
            );
          },
        );
 //     },
 //   );
  }
}
