import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_details_screen/models/sight_details_model.dart';
import 'package:places/ui/screen/sight_details_screen/sight_details_screen.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_screen_model.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/sight_card_search_text_span.dart';
import 'package:provider/provider.dart';

///Карточка достопримечательностей из списка поиска
class SightCardSearch extends StatelessWidget {
  ///
  static const double heightImage = 95;

  ///
  final Place place;

  ///
  final String goNeed;

  ///
  final String goal;

  ///
  const SightCardSearch(
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
              SightCardSearchTextSpan(place, SearchScreenModel.searchString),
            ],
          ),
        ),
      );

  Future<void> _onTap(BuildContext context) async {
    await context.read<SightDetailsModel>().getPlace(place.id).then(
          (value) => showModalBottomSheet<Widget>(
            context: context,
            builder: (final _) => const SightDetailsScreen(),
            isScrollControlled: true,
            isDismissible: true,
            useRootNavigator: true,
          ),
        );
  }
}
