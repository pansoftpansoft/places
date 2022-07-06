import 'package:flutter/material.dart';
import 'package:places/data/interactor/details_place_interactor.dart';
import 'package:places/data/interactor/list_places_screen_model.dart';
import 'package:places/data/interactor/search_screen_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/details_place_screen/details_place_screen.dart';
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
    final Key? key,
    this.goNeed = '',
    this.goal = '',
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => InkWell(
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
              SearchCardPlaceTextSpan(place, context.read<SearchScreenInteractor>().searchString),
            ],
          ),
        ),
      );

  Future<void> _onTap(BuildContext context) async {
    await context.read<DetailsPlaceInteractor>().getPlace(place.id, context.read<ListPlacesScreenModel>().streamControllerListPlace).then(
          (value) => showModalBottomSheet<Widget>(
            context: context,
            builder: (final _) => const DetailsPlaceScreen(),
            isScrollControlled: true,
            isDismissible: true,
            useRootNavigator: true,
          ),
        );
  }
}
