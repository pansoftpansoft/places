import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/sight_card_search_text_span.dart';

///Карточка достопримечательностей из списка поиска
class SightCardSearch extends StatelessWidget {
  ///
  static const double heightImage = 95;

  ///
  final Sight sight;

  ///
  final String goNeed;

  ///
  final String goal;

  ///
  const SightCardSearch(this.sight, {
    final Key? key,
    this.goNeed = '',
    this.goal = '',
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) =>
      InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            RouteName.sightDetailsScreen,
            arguments: sight,
          );
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
                  sight.urls.first,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 0, width: 16),
              SightCardSearchTextSpan(sight, SearchFilterModel.searchString),
            ],
          ),
        ),
      );
}
