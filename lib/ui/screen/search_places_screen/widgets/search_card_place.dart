import 'package:flutter/material.dart';
import 'package:places/data/interactor/search_screen_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/search_places_screen/bloc/search_places_bloc.dart';
import 'package:places/ui/screen/search_places_screen/widgets/search_card_place_text_span.dart';
import 'package:provider/provider.dart';

///Карточка достопримечательностей из списка поиска
class SearchCardPlace extends StatelessWidget {
  ///
  static const double heightImage = 95;

  ///
  final Place place;

  ///
  final String goNeed;

  ///
  final String goal;

  ///
  const SearchCardPlace(
    this.place, {
    Key? key,
    this.goNeed = '',
    this.goal = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          _onTap(context);
        },
        child: SizedBox(
          height: 78,
          child: Row(
            children: <Widget>[
              Container(
                height: 56,
                width: 56,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      borderRadiusCard12,
                    ),
                  ),
                ),
                child: Image.network(
                  place.urls.first,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 0, width: 16),
              SearchCardPlaceTextSpan(
                place,
                context.read<SearchScreenInteractor>().searchString,
              ),
            ],
          ),
        ),
      );

  Future<void> _onTap(BuildContext context) async {
    context
        .read<SearchPlacesBloc>()
        .add(SearchPlacesEvents.selectSearch(place: place));
  }
}
