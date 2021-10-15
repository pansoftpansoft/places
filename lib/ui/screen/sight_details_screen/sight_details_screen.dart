import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/add_to_favorites_button.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/build_route_button.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/photo_gallery.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/schedule_button.dart';

///Подробно о достопримечательности
class SightDetails extends StatelessWidget {
  ///Конструктор экрана подробности о достопримечательности
  const SightDetails(this._sight, {final Key? key}) : super(key: key);

  ///Экземпляр достопримечательности
  final Sight _sight;

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              expandedHeight: 330,
              flexibleSpace: FlexibleSpaceBar(
                background: PhotoGallery(),
              ),
            ),
            SliverFillRemaining(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      Sizes.paddingPage,
                      24,
                      Sizes.paddingPage,
                      0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _sight.name,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              typePlaceString(_sight.type),
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'закрыто до 09:00',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          _sight.details,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(height: 24),
                        ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                            height: 48,
                          ),
                          child: const BuildRouteButton(),
                        ),
                        const SizedBox(height: 24),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            AddToFavoritesButton(),
                            ScheduleButton(),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
