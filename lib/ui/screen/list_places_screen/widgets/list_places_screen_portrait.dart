import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/res/loader_size.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/details_place_screen/bloc/details_place_bloc.dart';
//import 'package:places/ui/screen/details_place_screen/details_place_screen.dart';
import 'package:places/ui/screen/list_places_screen/bloc/list_places_bloc.dart';
import 'package:places/ui/screen/list_places_screen/widgets/sticky_header.dart';
import 'package:places/ui/screen/widgets/card_place/card_place.dart';
import 'package:places/ui/screen/widgets/loader.dart';

class ListPlacesScreenPortrait extends StatelessWidget {
  const ListPlacesScreenPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ListPlacesBloc, ListPlacesState>(
          listenWhen: (previousState, state) => state.loaded,
          listener: (context, state) {
            debugPrint('Ни чего не делаем');

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

            context.read<DetailsPlaceBloc>().add(
              DetailsPlaceEvents.onLoad(
                place: state.place,
                index: 0,
              ),
            );

            Navigator.pushNamed(context, RouteName.detailsPlaceScreen);

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
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: heightSizeBox12,
                        bottom: iconSize29,
                      ),
                      child: Loader(LoaderSize.large),
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
