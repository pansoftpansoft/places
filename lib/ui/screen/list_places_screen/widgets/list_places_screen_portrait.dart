import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/res/img.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/details_place_screen/details_place_screen.dart';
import 'package:places/ui/screen/list_places_screen/bloc/list_places_bloc.dart';
import 'package:places/ui/screen/list_places_screen/widgets/sticky_header.dart';
import 'package:places/ui/screen/widgets/card_place/card_place.dart';

class ListPlacesScreenPortrait extends StatelessWidget {
  const ListPlacesScreenPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ListPlacesBloc, ListPlacesState>(
          listenWhen: (previousState, state) => state.loaded,
          listener: (context, state) {
            debugPrint('Ни чего не делвем');

            return;
          },
        ),

        BlocListener<ListPlacesBloc, ListPlacesState>(
          listenWhen: (previousState, state) => state.addNew,
          listener: (context, state) {
            Navigator.pushNamed(context, RouteName.addPlaceScreen);

            return;
          },
        ),
        BlocListener<ListPlacesBloc, ListPlacesState>(
          listenWhen: (previousState, state) => state.selected,
          listener: (context, state) {
            debugPrint('See details');
            showModalBottomSheet<Widget>(
              context: context,
              builder: (_) => DetailsPlaceScreen(place: state.place),
              isScrollControlled: true,
              isDismissible: true,
              useRootNavigator: true,
            );

            return;
          },
        ),
      ],
      child: BlocBuilder<ListPlacesBloc, ListPlacesState>(
        builder: (context, state) {
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
                if (state.load)
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
                          ' state.listPlaces[$index].isFavorites = '
                          '${state.listPlaces[index].isFavorites}',
                        );

                        return CardPlace(state.listPlaces[index]);
                      },
                      childCount:
                          state.listPlaces.length, // mocksFiltered.length,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
