import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/add_to_favorites_button.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/build_route_button.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/photo_gallery.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/schedule_button.dart';

///Подробно о достопримечательности
class SightDetailsScreen extends StatelessWidget {
  ///Экземпляр достопримечательности
  final Sight _sight;

  ///Конструктор экрана подробности о достопримечательности
  const SightDetailsScreen(this._sight, {final Key? key}) : super(key: key);


  @override
  Widget build(final BuildContext context) => ClipRRect(
    borderRadius: const BorderRadius.vertical(
      top: Radius.circular(16),
    ),
    child: Container(
      height: 650,
      color: ColorPalette.whiteColor,
      child: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              const SliverAppBar(
                automaticallyImplyLeading: false,
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
                        paddingPage,
                        24,
                        paddingPage,
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
                                style:
                                Theme.of(context).textTheme.headline5,
                              ),
                              const SizedBox(width: 16),
                              Text(
                                'закрыто до 09:00',
                                style:
                                Theme.of(context).textTheme.subtitle2,
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
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              ScheduleButton(),
                              AddToFavoritesButton(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                  width: 390,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: SvgPicture.asset(
                      SvgIcons.rectangle1303,
                      color: ColorPalette.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 16,
            top: 16,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(40, 40),
                elevation: 0,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8),
                primary: ColorPalette.whiteColor,
                onPrimary: ColorPalette.whiteMain,
              ),
              child: SvgPicture.asset(
                SvgIcons.delete,
                color: ColorPalette.whiteMain,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
